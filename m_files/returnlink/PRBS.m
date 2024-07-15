function  y = PRBS(pdu)
%--------------------------------------------------------------------------
%  
% ����˵����   ����HTS����������Э���PDU��������ݰ��� 1 + x14 + x15 ʽ����α�����
% 
% ���������
%          pdu: L2�㴫���pdu����
% ���������
%          y:   α������������
% 
% 
% -------------------------------------------------------------------------

N  = length(pdu);
SR = [1 0 0 1 0 1 0 1 0 0 0 0 0 0 0];
y  = zeros(1,N);

for i = 1:N
    temp      = mod(SR(14)+ SR(15),2);
    y(i)      = mod(temp + pdu(i),2);
    SR(2:end) = SR(1:14);       % ����״̬
    SR(1)     = temp;
    
    
end





