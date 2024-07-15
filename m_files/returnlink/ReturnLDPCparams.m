function [kcrc,kldpc,nldpc,M,coderate,q] = ReturnLDPCparams(waveID)
% -------------------------------------------------------------------------
% ���������
%        waveID : ����id
% 
% ���������
%  


ReturnLinkLDPCParams = load('ReturnLinkLDPCParams.txt');
waveParam = ReturnLinkLDPCParams(waveID,:);

kcrc = waveParam(4);%ԭʼcodes��Ƶ�󳤶�(bit)
kldpc = waveParam(2);%���CRC��code����
nldpc = waveParam(1);%���У��λ��LDPC���ܳ�
M = waveParam(3);%LDPCУ��λ��ַ��ģ����ʱ���õ�
q = waveParam(5);%LDPCУ��λ��ַ��ģ����ʱ���õ���q*M=kldpc��
coderate = kldpc/nldpc;%����

end

