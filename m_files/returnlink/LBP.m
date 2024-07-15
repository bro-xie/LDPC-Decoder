function [n,recoverData] = LBP(receiveSignal, H, MAX_Iter_Num, NORM_FACTOR)


[M,N]=size(H);

Qv = receiveSignal; % Z
Rcv = zeros(M,N); % 
Qvc = zeros(1,N);
recoverData = zeros(1,N);
for n = 1:MAX_Iter_Num
   for i = 1:M % 枚举每个校验方程
       col = find(H(i,:));%找到H中每行为1的在哪一列（即与当前变量节点相关的是哪一个校验节点）
       for k = 1:length(col)
           Qvc(1,col(k)) = Qv(col(k)) - Rcv(i,col(k));%计算中间变量
       end    
       
       alpha = sign(Qvc);
       beta = abs(Qvc);
       signS = 1;
       min1 = 100000;
       min2 = 100000;
       index = 10000;% 绝对值最小的下标
       
       for k = 1:length(col)
          signS = alpha(col(k))*signS;
          if beta(col(k)) < min1
             min2 = min1;
             min1 = beta(col(k));
             index = col(k);
          end
          if ((beta(col(k)) > min1) && (beta(col(k))<min2))
              min2 = beta(col(k));
          end
       end
       
       for k = 1:length(col)   %更新校验节点传给变量节点的外信息 Update C2V 
          if col(k) == index
              Rcv(i,col(k)) = NORM_FACTOR*signS*alpha(col(k))*min2;%归一化最小和   L (m -> k) 第m个校验方程 第k个变量节点
          else
              Rcv(i,col(k)) = NORM_FACTOR*signS*alpha(col(k))*min1;
          end
          Qv(col(k)) = Qvc(1,col(k)) + Rcv(i,col(k));%计算后验概率
       end     
   end              %end for i    

   %判决 Qv是V_val
   for k = 1:N
       if Qv(k) < 0
           recoverData(k) = 1;
       else
           recoverData(k) = 0;
       end
   end
   if rem(H*recoverData',2) == 0
       break;
   end
end                 %end for n 


