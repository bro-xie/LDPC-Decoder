function  y = PRBS(pdu)
%--------------------------------------------------------------------------
%  
% 功能说明：   按照HTS反向物理层协议对PDU传输的数据按照 1 + x14 + x15 式进行伪随机化
% 
% 输入参数：
%          pdu: L2层传输的pdu数据
% 输入参数：
%          y:   伪随机化后的数据
% 
% 
% -------------------------------------------------------------------------

N  = length(pdu);
SR = [1 0 0 1 0 1 0 1 0 0 0 0 0 0 0];
y  = zeros(1,N);

for i = 1:N
    temp      = mod(SR(14)+ SR(15),2);
    y(i)      = mod(temp + pdu(i),2);
    SR(2:end) = SR(1:14);       % 更新状态
    SR(1)     = temp;
    
    
end






