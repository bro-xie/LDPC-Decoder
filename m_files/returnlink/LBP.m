function [n,recoverData] = LBP(receiveSignal, H, MAX_Iter_Num, NORM_FACTOR)


[M,N]=size(H);

Qv = receiveSignal; % Z
Rcv = zeros(M,N); % 
Qvc = zeros(1,N);
recoverData = zeros(1,N);
for n = 1:MAX_Iter_Num
   for i = 1:M % ö��ÿ��У�鷽��
       col = find(H(i,:));%�ҵ�H��ÿ��Ϊ1������һ�У����뵱ǰ�����ڵ���ص�����һ��У��ڵ㣩
       for k = 1:length(col)
           Qvc(1,col(k)) = Qv(col(k)) - Rcv(i,col(k));%�����м����
       end    
       
       alpha = sign(Qvc);
       beta = abs(Qvc);
       signS = 1;
       min1 = 100000;
       min2 = 100000;
       index = 10000;% ����ֵ��С���±�
       
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
       
       for k = 1:length(col)   %����У��ڵ㴫�������ڵ������Ϣ Update C2V 
          if col(k) == index
              Rcv(i,col(k)) = NORM_FACTOR*signS*alpha(col(k))*min2;%��һ����С��   L (m -> k) ��m��У�鷽�� ��k�������ڵ�
          else
              Rcv(i,col(k)) = NORM_FACTOR*signS*alpha(col(k))*min1;
          end
          Qv(col(k)) = Qvc(1,col(k)) + Rcv(i,col(k));%����������
       end     
   end              %end for i    

   %�о� Qv��V_val
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


