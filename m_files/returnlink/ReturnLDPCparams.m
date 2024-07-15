function [kcrc,kldpc,nldpc,M,coderate,q] = ReturnLDPCparams(waveID)
% -------------------------------------------------------------------------
% 输入参数：
%        waveID : 波形id
% 
% 输出参数：
%  


ReturnLinkLDPCParams = load('ReturnLinkLDPCParams.txt');
waveParam = ReturnLinkLDPCParams(waveID,:);

kcrc = waveParam(4);%原始codes扩频后长度(bit)
kldpc = waveParam(2);%添加CRC后code长度
nldpc = waveParam(1);%添加校验位后LDPC码总长
M = waveParam(3);%LDPC校验位地址做模二和时会用到
q = waveParam(5);%LDPC校验位地址做模二和时会用到（q*M=kldpc）
coderate = kldpc/nldpc;%码率

end

