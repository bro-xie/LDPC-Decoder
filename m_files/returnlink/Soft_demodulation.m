%这里有三个函数，QPSK8PSK 16QAM软解调输出函数，8PSK软解调具体方法和16QAM软解调具体方法
function dec = Soft_demodulation(m,in_msg,InVar,coderate)
if m==2
    %QPSK软解调

      dec = reshape([real(in_msg);imag(in_msg)],1, []);
elseif m==3
    %8PSK软解调
    dec=[];
          for i=1:length(in_msg)
           [dec_1,dec_2,dec_3]=soft_dem8PSK(in_msg(i),InVar);
           [dec_1,dec_2,dec_3]=deal(-dec_1,-dec_2,-dec_3);
           dec=[dec,dec_1,dec_2,dec_3];
          end
elseif m==4
    %16APSK软解调
    dec=[];
          for i=1:length(in_msg)
           [dec_1,dec_2,dec_3,dec_4]=soft_dem16APSK(in_msg(i),InVar,coderate);
           [dec_1,dec_2,dec_3,dec_4]=deal(-dec_1,-dec_2,-dec_3,-dec_4);
           dec=[dec,dec_1,dec_2,dec_3,dec_4];
          end
elseif m==5
    %32APSK软解调
    dec=[];
          for i=1:length(in_msg)
           [dec_1,dec_2,dec_3,dec_4,dec_5]=soft_dem32APSK(in_msg(i),InVar,coderate);
           [dec_1,dec_2,dec_3,dec_4,dec_5]=deal(-dec_1,-dec_2,-dec_3,-dec_4,-dec_5);
           dec=[dec,dec_1,dec_2,dec_3,dec_4,dec_5];
          end
else
    fprintf("请输入合适的m值");
end
end

function [llr_b0, llr_b1, llr_b2] = soft_dem8PSK(signal, v)%（正确性有待考察）
% 输入：每一个经8PSK调制后的符号
% 输出：软解调后的LLR，每一位对应一个LLR
%% 定义星座图上每一个点
x0 = real(exp(1j*pi*2/8)); y0 = imag(exp(1j*pi*2/8));
x1 = real(exp(1j*pi*0/8)); y1 = imag(exp(1j*pi*0/8));
x7 = real(exp(1j*pi*8/8)); y7 = imag(exp(1j*pi*8/8));
x6 = real(exp(1j*pi*-6/8)); y6 = imag(exp(1j*pi*-6/8));
x3 = real(exp(1j*pi*4/8)); y3 = imag(exp(1j*pi*4/8));
x2 = real(exp(1j*pi*-2/8)); y2 = imag(exp(1j*pi*-2/8));
x4 = real(exp(1j*pi*6/8)); y4 = imag(exp(1j*pi*6/8));
x5 = real(exp(1j*pi*-4/8)); y5 = imag(exp(1j*pi*-4/8));


%% 符号点与星座图上每个点简化后的距离
m0 = real(signal)*x0 + imag(signal)*y0;
m1 = real(signal)*x1 + imag(signal)*y1;
m2 = real(signal)*x2 + imag(signal)*y2;
m3 = real(signal)*x3 + imag(signal)*y3;
m4 = real(signal)*x4 + imag(signal)*y4;
m5 = real(signal)*x5 + imag(signal)*y5;
m6 = real(signal)*x6 + imag(signal)*y6;
m7 = real(signal)*x7 + imag(signal)*y7;

%% 分别计算三位的LLR
llr_b0 = (1/v)*(max([m2, m3, m4, m5]) - max([m0, m1, m6, m7]));  % v为噪声方差
llr_b1 = (1/v)*(max([m4, m5, m6, m7]) - max([m0, m1, m2, m3]));
llr_b2 = (1/v)*(max([m1, m2, m5, m6]) - max([m0, m3, m4, m7]));
end

function [llr_b0, llr_b1, llr_b2, llr_b3, llr_b4] = soft_dem32APSK(signal, v, coderate)
% 输入：每一个经32APSK调制后的符号
% 输出：软解调后的LLR，每一位对应一个LLR
%% 定义星座图上每一个点
R3=1;
Tabcode=[3/4,4/5,5/6,8/9,9/10];
Tabgamma1=[2.84,2.72,2.64,2.54,2.53];
Tabgamma2=[5.27,4.87,4.64,4.33,4.3];
code_index=find(Tabcode==coderate);
gamma1=Tabgamma1(code_index);
gamma2=Tabgamma2(code_index);
R1=R3/gamma2;
R2=R1*gamma1;
x0 = real(R2*exp(1j*pi*3/12)); y0 = imag(R2*exp(1j*pi*3/12));
x1 = real(R2*exp(1j*pi*5/12)); y1 = imag(R2*exp(1j*pi*5/12));
x2 = real(R2*exp(1j*pi*-3/12)); y2 = imag(R2*exp(1j*pi*-3/12));
x3 = real(R2*exp(1j*pi*-5/12)); y3 = imag(R2*exp(1j*pi*-5/12));
x4 = real(R2*exp(1j*pi*9/12)); y4 = imag(R2*exp(1j*pi*9/12));
x5 = real(R2*exp(1j*pi*7/12)); y5 = imag(R2*exp(1j*pi*7/12));
x6 = real(R2*exp(1j*pi*-9/12)); y6 = imag(R2*exp(1j*pi*-9/12));
x7 = real(R2*exp(1j*pi*-7/12)); y7 = imag(R2*exp(1j*pi*-7/12));
x8 = real(R3*exp(1j*pi*2/16)); y8 = imag(R3*exp(1j*pi*2/16));
x9 = real(R3*exp(1j*pi*6/16)); y9 = imag(R3*exp(1j*pi*6/16));
x10 = real(R3*exp(1j*pi*-4/16)); y10 = imag(R3*exp(1j*pi*-4/16));
x11 = real(R3*exp(1j*pi*-8/16)); y11 = imag(R3*exp(1j*pi*-8/16));
x12 = real(R3*exp(1j*pi*12/16)); y12 = imag(R3*exp(1j*pi*12/16));
x13 = real(R3*exp(1j*pi*8/16)); y13 = imag(R3*exp(1j*pi*8/16));
x14 = real(R3*exp(1j*pi*-14/16)); y14 = imag(R3*exp(1j*pi*-14/16));
x15 = real(R3*exp(1j*pi*-10/16)); y15 = imag(R3*exp(1j*pi*-10/16));
x16 = real(R2*exp(1j*pi*1/12)); y16 = imag(R2*exp(1j*pi*1/12));
x17 = real(R1*exp(1j*pi*1/4)); y17 = imag(R1*exp(1j*pi*1/4));
x18 = real(R2*exp(1j*pi*-1/12)); y18 = imag(R2*exp(1j*pi*-1/12));
x19 = real(R1*exp(1j*pi*-1/4)); y19 = imag(R1*exp(1j*pi*-1/4));
x20 = real(R2*exp(1j*pi*11/12)); y20 = imag(R2*exp(1j*pi*11/12));
x21 = real(R1*exp(1j*pi*3/4)); y21 = imag(R1*exp(1j*pi*3/4));
x22 = real(R2*exp(1j*pi*-11/12)); y22 = imag(R2*exp(1j*pi*-11/12));
x23 = real(R1*exp(1j*pi*-3/4)); y23 = imag(R1*exp(1j*pi*-3/4));
x24 = real(R3*exp(1j*pi*0/16)); y24 = imag(R3*exp(1j*pi*0/16));
x25 = real(R3*exp(1j*pi*4/16)); y25 = imag(R3*exp(1j*pi*4/16));
x26 = real(R3*exp(1j*pi*-2/16)); y26 = imag(R3*exp(1j*pi*-2/16));
x27 = real(R3*exp(1j*pi*-6/16)); y27 = imag(R3*exp(1j*pi*-6/16));
x28 = real(R3*exp(1j*pi*14/16)); y28 = imag(R3*exp(1j*pi*14/16));
x29 = real(R3*exp(1j*pi*10/16)); y29 = imag(R3*exp(1j*pi*10/16));
x30 = real(R3*exp(1j*pi*16/16)); y30 = imag(R3*exp(1j*pi*16/16));
x31 = real(R3*exp(1j*pi*-12/16)); y31 = imag(R3*exp(1j*pi*-12/16));

%% 符号点与星座图上每个点简化后的距离
m0 = -((real(signal) - x0)^2 + (imag(signal) - y0)^2);
m1 = -((real(signal) - x1)^2 + (imag(signal) - y1)^2);
m2 = -((real(signal) - x2)^2 + (imag(signal) - y2)^2);
m3 = -((real(signal) - x3)^2 + (imag(signal) - y3)^2);
m4 = -((real(signal) - x4)^2 + (imag(signal) - y4)^2);
m5 = -((real(signal) - x5)^2 + (imag(signal) - y5)^2);
m6 = -((real(signal) - x6)^2 + (imag(signal) - y6)^2);
m7 = -((real(signal) - x7)^2 + (imag(signal) - y7)^2);
m8 = -((real(signal) - x8)^2 + (imag(signal) - y8)^2);
m9 = -((real(signal) - x9)^2 + (imag(signal) - y9)^2);
m10 = -((real(signal) - x10)^2 + (imag(signal) - y10)^2);
m11 = -((real(signal) - x11)^2 + (imag(signal) - y11)^2);
m12 = -((real(signal) - x12)^2 + (imag(signal) - y12)^2);
m13 = -((real(signal) - x13)^2 + (imag(signal) - y13)^2);
m14 = -((real(signal) - x14)^2 + (imag(signal) - y14)^2);
m15 = -((real(signal) - x15)^2 + (imag(signal) - y15)^2);
m16 = -((real(signal) - x16)^2 + (imag(signal) - y16)^2);
m17 = -((real(signal) - x17)^2 + (imag(signal) - y17)^2);
m18 = -((real(signal) - x18)^2 + (imag(signal) - y18)^2);
m19 = -((real(signal) - x19)^2 + (imag(signal) - y19)^2);
m20 = -((real(signal) - x20)^2 + (imag(signal) - y20)^2);
m21 = -((real(signal) - x21)^2 + (imag(signal) - y21)^2);
m22 = -((real(signal) - x22)^2 + (imag(signal) - y22)^2);
m23 = -((real(signal) - x23)^2 + (imag(signal) - y23)^2);
m24 = -((real(signal) - x24)^2 + (imag(signal) - y24)^2);
m25 = -((real(signal) - x25)^2 + (imag(signal) - y25)^2);
m26 = -((real(signal) - x26)^2 + (imag(signal) - y26)^2);
m27 = -((real(signal) - x27)^2 + (imag(signal) - y27)^2);
m28 = -((real(signal) - x28)^2 + (imag(signal) - y28)^2);
m29 = -((real(signal) - x29)^2 + (imag(signal) - y29)^2);
m30 = -((real(signal) - x30)^2 + (imag(signal) - y30)^2);
m31 = -((real(signal) - x31)^2 + (imag(signal) - y31)^2);

%% 分别计算四位的LLR
llr_b0 = (1/(2*v))*(max([m16, m17, m18, m19, m20, m21, m22, m23, m24, m25, m26, m27, m28, m29, m30, m31]) - max([m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15]));
llr_b1 = (1/(2*v))*(max([m8, m9, m10, m11, m12, m13, m14, m15, m24, m25, m26, m27, m28, m29, m30, m31]) - max([m0, m1, m2, m3, m4, m5, m6, m7, m16, m17, m18, m19, m20, m21, m22, m23]));
llr_b2 = (1/(2*v))*(max([m4, m5, m6, m7, m12, m13, m14, m15, m20, m21, m22, m23, m28, m29, m30, m31]) - max([m0, m1, m2, m3, m8, m9, m10, m11, m16, m17, m18, m19, m24, m25, m26, m27]));
llr_b3 = (1/(2*v))*(max([m2, m3, m6, m7, m10, m11, m14, m15, m18, m19, m22, m23, m26, m27, m30, m31]) - max([m0, m1, m4, m5, m8, m9, m12, m13, m16, m17, m20, m21, m24, m25, m28, m29]));
llr_b4 = (1/(2*v))*(max([m1, m3, m5, m7, m9, m11, m13, m15, m17, m19, m21, m23, m25, m27, m29, m31]) - max([m0, m2, m4, m6, m8, m10, m12, m14, m16, m18, m20, m22, m24, m26, m28, m30]));
end

function [llr_b0, llr_b1, llr_b2, llr_b3] = soft_dem16APSK(signal, v, coderate)
% 输入：每一个经16APSK调制后的符号
% 输出：软解调后的LLR，每一位对应一个LLR
%% 定义星座图上每一个点
R2=1;
Tabcode=[2/3,3/4,4/5,5/6,8/9,9/10];
Tabgamma=[3.15,2.85,2.75,2.7,2.6,2.57];
gamma=Tabgamma(Tabcode==coderate); 
R1=R2/gamma;

x10 = real(exp(1j*pi*7/12));             y10 = imag(exp(1j*pi*7/12));
x13 = real(R1*exp(1j*pi*(-1)/4));   y13 = imag(R1*exp(1j*pi*(-1)/4));
x5 = real(exp(1j*pi*(-1)/12));           y5 = imag(exp(1j*pi*(-1)/12));
x2 = real(exp(1j*pi*3/4));               y2 = imag(exp(1j*pi*3/4));
x11 = real(exp(1j*pi*(-7)/12));          y11 = imag(exp(1j*pi*(-7)/12));
x12 = real(R1*exp(1j*pi*1/4));      y12 = imag(R1*exp(1j*pi*1/4));
x4 = real(exp(1j*pi*1/12));              y4 = imag(exp(1j*pi*1/12));
x3 = real(exp(1j*pi*(-3)/4));            y3 = imag(exp(1j*pi*(-3)/4));
x9 = real(exp(1j*pi*(-5)/12));           y9 = imag(exp(1j*pi*(-5)/12));
x14 = real(R1*exp(1j*pi*3/4));      y14 = imag(R1*exp(1j*pi*3/4));
x6 = real(exp(1j*pi*11/12));             y6 = imag(exp(1j*pi*11/12));
x1 = real(exp(1j*pi*(-1)/4));            y1 = imag(exp(1j*pi*(-1)/4));
x8 = real(exp(1j*pi*5/12));              y8 = imag(exp(1j*pi*5/12));
x15 = real(R1*exp(1j*pi*(-3)/4));   y15 = imag(R1*exp(1j*pi*(-3)/4));
x7 = real(exp(1j*pi*(-11)/12));          y7 = imag(exp(1j*pi*(-11)/12));
x0 = real(exp(1j*pi*1/4));               y0 = imag(exp(1j*pi*1/4));

%% 符号点与星座图上每个点简化后的距离
m0 = -((real(signal) - x0)^2 + (imag(signal) - y0)^2);
m1 = -((real(signal) - x1)^2 + (imag(signal) - y1)^2);
m2 = -((real(signal) - x2)^2 + (imag(signal) - y2)^2);
m3 = -((real(signal) - x3)^2 + (imag(signal) - y3)^2);
m4 = -((real(signal) - x4)^2 + (imag(signal) - y4)^2);
m5 = -((real(signal) - x5)^2 + (imag(signal) - y5)^2);
m6 = -((real(signal) - x6)^2 + (imag(signal) - y6)^2);
m7 = -((real(signal) - x7)^2 + (imag(signal) - y7)^2);
m8 = -((real(signal) - x8)^2 + (imag(signal) - y8)^2);
m9 = -((real(signal) - x9)^2 + (imag(signal) - y9)^2);
m10 = -((real(signal) - x10)^2 + (imag(signal) - y10)^2);
m11 = -((real(signal) - x11)^2 + (imag(signal) - y11)^2);
m12 = -((real(signal) - x12)^2 + (imag(signal) - y12)^2);
m13 = -((real(signal) - x13)^2 + (imag(signal) - y13)^2);
m14 = -((real(signal) - x14)^2 + (imag(signal) - y14)^2);
m15 = -((real(signal) - x15)^2 + (imag(signal) - y15)^2);

%% 分别计算四位的LLR
llr_b0 = (1/(2*v))*(max([m8, m9, m10, m11, m12, m13, m14, m15]) - max([m0, m1, m2, m3, m4, m5, m6, m7]));
llr_b1 = (1/(2*v))*(max([m4, m5, m6, m7, m12, m13, m14, m15]) - max([m0, m1, m2, m3, m8, m9, m10, m11]));
llr_b2 = (1/(2*v))*(max([m2, m3, m6, m7, m10, m11, m14, m15]) - max([m0, m1, m4, m5, m8, m9, m12, m13]));
llr_b3 = (1/(2*v))*(max([m1, m3, m5, m7, m9, m11, m13, m15]) - max([m0, m2, m4, m6, m8, m10, m12, m14]));
end