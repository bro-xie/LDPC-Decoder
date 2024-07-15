clc, clear, close all;

load ("DVB_H_10.mat");
H = DVB_H;
degree_i = sum (H, 1);
degree_i = unique (degree_i);
degree_j = sum (H, 2);
degree_j = unique (degree_j);

%% print CNU.
fid = fopen ("..\v_files_gen_by_scripts\CNU.v", 'wt');
% fid = fopen ("CNU.v", 'wt');
% print_CNU_q (fid, 19, 3);
for cnt = 1 : length (degree_j)
    print_CNU_q (fid, degree_j (cnt));
    fprintf (fid, "\n");
end
fclose (fid);

%% print CNU_SubModule.
fid = fopen ("..\v_files_gen_by_scripts\CNU_SubModule.v", 'wt');
print_CNU_SubModule (fid);
fclose (fid);

%% print VNU.
fid = fopen ("..\v_files_gen_by_scripts\VNU.v", 'wt');
for cnt = 1 : length (degree_i)
    print_VNU_p (fid, degree_i (cnt));
    fprintf (fid, "\n");
end
fclose (fid);

%% print Decoder.
fid = fopen ("..\v_files_gen_by_scripts\Decoder.v", 'wt');
print_Decoder (fid, H);
fclose (fid);

%% print test.

% encoding part.
addpath ("returnlink\");

waveID = 10;
BurstType    = 'DATA';
[kcrc,kldpc,nldpc,M,Coderate,q] = ReturnLDPCparams(waveID);
m = 2;
crc_polynomial  = [1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 1];
CodeTable = GetTable(waveID);
snr_db = 6;
snr=10.^(snr_db/10);

PDU  = randi([0 1],1,kcrc);         % L2层传入的PDU数据包
EnergyDispersal = PRBS(PDU);
hcrc         = crc.generator('Polynomial', crc_polynomial );
LDPCDataIn  =  generate(hcrc,EnergyDispersal.').';   % 卷积编码前的输入数据
[LDPCcode,H] = LDPCCode(LDPCDataIn, kldpc,nldpc,M,q,CodeTable);
CodeLDPCAfterIW = Interweave(LDPCcode,m,nldpc);
TransmitCode = Modulate(CodeLDPCAfterIW,m,BurstType,Coderate);%暂未考虑BPSK，后续添加
sigma=sqrt(1/(2*snr(1))); %噪声标准差,因为I,Q支路都要加噪声，所以里面是1/2*snr不是1/snr
InVar=sigma.^2;           %方差
receiveSignal = TransmitCode + sigma*randn(1,length(TransmitCode))...
                         +sigma*1i*randn(1,length(TransmitCode));
dec =Soft_demodulation(m,receiveSignal,InVar,Coderate);%
CodeDeIW = Deinterweave(dec,m,nldpc);
save ("LDPCcode&CodeDeIW.mat", "LDPCcode", "CodeDeIW");


clc, clear, close all;
load ("LDPCcode&CodeDeIW.mat");
load ("DVB_H_10.mat");
H = DVB_H;
[iter, recoverData] = my_LBP (CodeDeIW, H, 30, 0.75, LDPCcode);



fid = fopen ("..\v_files_gen_by_scripts\test.v", 'wt');
print_test_IO (fid, LDPCcode, CodeDeIW);
fclose (fid);