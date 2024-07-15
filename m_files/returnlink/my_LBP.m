function [n,recoverData] = my_LBP(receiveSignal, H, MAX_Iter_Num, NORM_FACTOR, LDPCcode)


[M,N]=size(H);

Qv = receiveSignal; % Z
Rcv = zeros(M,N); % 
Qvc = zeros(M,N);
recoverData = zeros(1,N);

%% input channel signal.
for index1 = 1 : N
    for index2 = 1 : M
        if (H(index2, index1) == 1)
            Qvc(index2, index1) = receiveSignal (index1);
        end
    end
end

%% iteration
for n = 1 : MAX_Iter_Num
    %% CNU
    for index1 = 1 : M % 更新index1号CN的全部信息值

        col = find (H(index1, :));
        alpha = sign (Qvc (index1, :));
        beta = abs (Qvc (index1, :));
        signS = 1;
        min1 = 100000;
        min2 = 100001;
        index = 0;
        
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
                Rcv(index1, col(k)) = NORM_FACTOR * signS * alpha(col(k)) * min2;
            else
                Rcv(index1, col(k)) = NORM_FACTOR * signS * alpha(col(k)) * min1;
            end
        end
    end

    %% VNU
    for index2 = 1 : N
        row = find (H(:, index2));
        Qv(index2) = 0;
        for k = 1 : length(row)
            Qv(index2) = Qv(index2) + Rcv (row(k), index2);
        end
        
        Qv(index2) = Qv(index2) + receiveSignal (index2);
        for k = 1 : length(row)
            Qvc (row(k), index2) = Qv(index2) - Rcv (row(k), index2);
        end
    end

    %% Check
    for k = 1 : N
        if Qv(k) < 0
            recoverData(k) = 1;
        else
            recoverData(k) = 0;
        end
    end
    error = sum (LDPCcode ~= recoverData);
    disp ("error number : " + string(error));
    error_index = find (LDPCcode ~= recoverData);

    %display
    if (1)
        disp ("C2V:")
        disp (Rcv (find (Rcv(:, 2)), 2));
        disp ("V2C:")
        disp (Qvc (find (Qvc(:, 2)), 2));
        disp ("V:")
        disp (Qv(2));
    end


    if rem(H*recoverData',2) == 0
        break;
    end

    
    

end

end

