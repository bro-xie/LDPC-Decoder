function [LDPCcode, H] = LDPCCode(LDPCDataIn,kldpc,nldpc,M,q,CodeTable)
Data = LDPCDataIn;
N = nldpc;%ldpc码总长
K = kldpc;%信息bit长
NumP = N - K;%计算校验位个数
ReNum = K/M;%计算需要重复累加的次数
% 校验bit累加地址表

P = zeros(1,NumP);%初始化校验比特
for i = 1:K
    SortDataAddressForG{i} = [];
end
%第 i 个元胞里的下标表示信息比特 i 参与异或的校验比特下标

for n = 1:ReNum % 取 CodeTable 中一行
    %元胞数组转矩阵
    FirstPlusAddress = cellfun(@str2num,CodeTable{1,n});

    %% 重构 校验比特累加 部分
    for a = 1 + (n - 1) * M : n * M
        for j = 1 : length (FirstPlusAddress)
            Address = mod (FirstPlusAddress(j) + (mod (a-1, M)) * q, N-K);
            P(Address+1) = xor(P(Address+1), Data(a));
            SortDataAddressForG{a} = [SortDataAddressForG{a} Address];
        end
    end

%     %% 第一次校验比特累加
%     for i = 1:length(FirstPlusAddress) % 第 1 + (n-1)*M 个信息比特参与了本次 FirstPlusAddress 中的校验比特的生成
%         %因为校验比特累加地址起始是从0开始计算的，所以P的索引要+1
%         P(FirstPlusAddress(i)+1) = xor(P(FirstPlusAddress(i)+1),Data(1+(n-1)*M));
%         SortDataAddressForG{1 + (n-1)*M} = [SortDataAddressForG{1 + (n-1)*M} FirstPlusAddress(i)];
%     end
%     %% 后续M-1次校验比特累加
%     %计算接下来M-1个信息比特的校验比特累加位置,并做校验比特累加
%     for a = 2+(n-1)*M:n*M
%         for j = 1:length(FirstPlusAddress)
%         Address = mod(FirstPlusAddress(j)+(mod((a-1),M))*q,N-K);
%         P(Address+1) = xor(P(Address+1),Data(a));
%         SortDataAddressForG{a} = [SortDataAddressForG{a} Address];
%         end     
%     end
end

%% 得到当前按照校验位排序的校验位与数据位的关系
SortPAddressForG = zeros(NumP,K);%行索引为校验位
for i = 1:K
    ForSortP = SortDataAddressForG{i};
    SortPAddressForG(ForSortP+1,i) = rem(SortPAddressForG(ForSortP+1,i)+1,2);
end
%得到按照校验位排序的校验位与数据位的关系
%% 生成最终的校验比特,并与信息位拼接
for n = 2:NumP
    P(n) = xor(P(n),P(n-1));
end
LDPCcode = [Data P];
%% 
H = GetH(CodeTable,NumP,K,ReNum,M,q);