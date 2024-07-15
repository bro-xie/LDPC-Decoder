function TransmitCode = Modulate(LDPCcode,m,BurstType,coderate)
% 调制
switch m
    case 2
        if strcmp(BurstType,"DATA")
             QpskTab    = exp(1j*pi*[1,-1,3,-3]/4);      % 分别对应： 00 01 10 11

        else
             QpskTab    = exp(1j*pi*[-3,3,-1,1]/4);
        end
                %QpskTab内的值等于是将两个2进制数转化为十进制，如若输入为11，则括号内为4
            TransmitCode  = QpskTab(2*LDPCcode(1:2:end) + LDPCcode(2:2:end)+1);
      
    case 3
        EpskTab    = exp(1j*pi*[2 0 8 -6 4 -2 6 -4]/8);
        TransmitCode  = EpskTab(4*LDPCcode(1:3:end) + 2*LDPCcode(2:3:end) + 1*LDPCcode(3:3:end) + 1);
    case 4
        R2=1;
        Tabcode=[2/3,3/4,4/5,5/6,8/9,9/10];
        Tabgamma=[3.15,2.85,2.75,2.7,2.6,2.57];
        gamma=Tabgamma(Tabcode==coderate); 
        R1=R2/gamma;
% 调制
        Apsk16Tab    = [R2*exp(1j*pi*[3,-3,9,-9,1,-1,11,-11,5,-5,7,-7]/12),R1*exp(1j*pi*[1,-1,3,-3]/4)];
        TransmitCode  = Apsk16Tab(8*LDPCcode(1:4:end) + 4*LDPCcode(2:4:end) + 2*LDPCcode(3:4:end) + 1*LDPCcode(4:4:end) + 1);
    case 5
        R3=1;
        Tabcode=[3/4,4/5,5/6,8/9,9/10];
        Tabgamma1=[2.84,2.72,2.64,2.54,2.53];
        Tabgamma2=[5.27,4.87,4.64,4.33,4.3];
        code_index=find(Tabcode==coderate);
        gamma1=Tabgamma1(code_index);
        gamma2=Tabgamma2(code_index);
        R1=R3/gamma2;
        R2=R1*gamma1;
        Apsk32Tab    = [R2*exp(1j*pi*[3,5,-3,-5,9,7,-9,-7]/12),R3*exp(1j*pi*[2,6,-4,-8,12,8,-14,-10]/16),R2*exp(1j*pi*1/12),R1*exp(1j*pi*1/4),R2*exp(1j*pi*(-1)/12),R1*exp(1j*pi*(-1)/4),R2*exp(1j*pi*11/12),R1*exp(1j*pi*3/4),R2*exp(1j*pi*(-11)/12),R1*exp(1j*pi*(-3)/4),R3*exp(1j*pi*[0,4,-2,-6,14,10,16,-12]/16)];
        TransmitCode  = Apsk32Tab(16*LDPCcode(1:5:end) + 8*LDPCcode(2:5:end) + 4*LDPCcode(3:5:end) + 2*LDPCcode(4:5:end) + 1*LDPCcode(5:5:end) + 1);
end
end

