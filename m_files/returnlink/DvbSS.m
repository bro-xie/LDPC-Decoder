
%  1. ReturnLink ����--CRC--����--��֯--ֻ���������ݷ���ĵ��ƣ����� 2023.8
%    QPSK��������ʹ�ã�����1-16����8PSK��δ����
%    
%--------------------------------------------------------------------------
clc;clear;close all

%% ����--CRC--����--��֯

%--------------------------------------------------------------------------
% ��������
waveID                  = 10;            % ����ID��
BurstType    = 'DATA';    % ҵ��ģʽ

m = 2;      %���ƽ���
[kcrc,kldpc,nldpc,M,Coderate,q] = ReturnLDPCparams(waveID);
crc_polynomial  = [1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 1];
CodeTable = GetTable(waveID);
FrameSum = 100;%��֡��


load ("CN_vector_16cas.mat");
load ("VN_vector_16cas.mat");
CN_vector = CN_vector + 1;
VN_vector = VN_vector + 1;


%snr_db =5.5 : 0.25 : 6;
snr_db = 7;

snr=10.^(snr_db/10);
for k = 1:length(snr)
 FrameNum = 0;
ErrorNum = 0;
    while(FrameNum<FrameSum)
        tic

        PDU  = randi([0 1],1,kcrc);         % L2�㴫���PDU���ݰ�
        %���ţ�����α�������Energy dispersal��
        EnergyDispersal = PRBS(PDU);
        %CRC
        hcrc         = crc.generator('Polynomial', crc_polynomial );
        LDPCDataIn  =  generate(hcrc,EnergyDispersal.').';   % �������ǰ����������
        %ldpc����
        [LDPCcode,H] = LDPCCode(LDPCDataIn, kldpc,nldpc,M,q,CodeTable);
        %��֯
        CodeLDPCAfterIW = Interweave(LDPCcode,m,nldpc);
        %% ��֡��������



        %����
        TransmitCode = Modulate(CodeLDPCAfterIW,m,BurstType,Coderate);%��δ����BPSK���������
        %% ����
        %���ź�����Ϊ1
        %Ϊʲôû�п����ŵ���������ʣ�
        sigma=sqrt(1/(2*snr(k))); %������׼��,��ΪI,Q֧·��Ҫ������������������1/2*snr����1/snr
        InVar=sigma.^2;           %����
        receiveSignal = TransmitCode + sigma*randn(1,length(TransmitCode))...
                         +sigma*1i*randn(1,length(TransmitCode));
        %% ����
        dec =Soft_demodulation(m,receiveSignal,InVar,Coderate);%
        %% �⽻֯
        CodeDeIW = Deinterweave(dec,m,nldpc);
        %% ����
        MAX_Iter_Num = 30;%����������
        NORM_FACTOR = 0.8;%��һ������
        
        
        %�ֲ��һ����С��������
        %[IterNum,DecodeData] = LBP(CodeDeIW, H,MAX_Iter_Num,NORM_FACTOR);

        %��������
        [IterNum,DecodeData] = Quan_decoder (CodeDeIW, H, MAX_Iter_Num, CN_vector, VN_vector);

        [Num0,ber0]=biterr(LDPCcode(1:kldpc),DecodeData(1:kldpc));
        ErrorNum=ErrorNum+Num0;
        FrameNum=FrameNum+1;
        if mod(FrameNum,10)==0 
                %sprintf('snr=%fdB,%d Frames transmitted, %d bit errors\n',snr_db(k),FrameNum,ErrorNum)
        end
        
        toc
    end
    ber(k) = ErrorNum/(FrameNum*kldpc);
    % sprintf('Finally,snr=%fdB,%d Frames transmitted, %d errors,bit error ratio is %f\n',snr_db(k),FrameNum,ErrorNum,ber(k));
end
figure(1);
semilogy(snr_db,ber,'-or','MarkerIndices',1:1:length(snr));
scatterplot(TransmitCode);
scatterplot(receiveSignal);