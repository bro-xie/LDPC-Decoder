
%  1. ReturnLink 加扰--CRC--编码--交织--只考虑了数据方面的调制：李光浩 2023.8
%    QPSK均可正常使用（波形1-16），8PSK暂未调整
%    
%--------------------------------------------------------------------------
clc;clear;close all

%% 加扰--CRC--编码--交织

%--------------------------------------------------------------------------
% 解析参数
waveID                  = 10;            % 波形ID号
BurstType    = 'DATA';    % 业务模式

m = 2;      %调制阶数
[kcrc,kldpc,nldpc,M,Coderate,q] = ReturnLDPCparams(waveID);
crc_polynomial  = [1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 1];
CodeTable = GetTable(waveID);
FrameSum = 100;%总帧数


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

        PDU  = randi([0 1],1,kcrc);         % L2层传入的PDU数据包
        %加扰（数据伪随机）（Energy dispersal）
        EnergyDispersal = PRBS(PDU);
        %CRC
        hcrc         = crc.generator('Polynomial', crc_polynomial );
        LDPCDataIn  =  generate(hcrc,EnergyDispersal.').';   % 卷积编码前的输入数据
        %ldpc编码
        [LDPCcode,H] = LDPCCode(LDPCDataIn, kldpc,nldpc,M,q,CodeTable);
        %交织
        CodeLDPCAfterIW = Interweave(LDPCcode,m,nldpc);
        %% 组帧（待定）



        %调制
        TransmitCode = Modulate(CodeLDPCAfterIW,m,BurstType,Coderate);%暂未考虑BPSK，后续添加
        %% 加噪
        %设信号能量为1
        %为什么没有考虑信道编码的码率？
        sigma=sqrt(1/(2*snr(k))); %噪声标准差,因为I,Q支路都要加噪声，所以里面是1/2*snr不是1/snr
        InVar=sigma.^2;           %方差
        receiveSignal = TransmitCode + sigma*randn(1,length(TransmitCode))...
                         +sigma*1i*randn(1,length(TransmitCode));
        %% 软解调
        dec =Soft_demodulation(m,receiveSignal,InVar,Coderate);%
        %% 解交织
        CodeDeIW = Deinterweave(dec,m,nldpc);
        %% 译码
        MAX_Iter_Num = 30;%最大迭代次数
        NORM_FACTOR = 0.8;%归一化参数
        
        
        %分层归一化最小二和译码
        %[IterNum,DecodeData] = LBP(CodeDeIW, H,MAX_Iter_Num,NORM_FACTOR);

        %量化译码
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