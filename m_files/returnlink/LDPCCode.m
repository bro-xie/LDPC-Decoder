function [LDPCcode, H] = LDPCCode(LDPCDataIn,kldpc,nldpc,M,q,CodeTable)
Data = LDPCDataIn;
N = nldpc;%ldpc���ܳ�
K = kldpc;%��Ϣbit��
NumP = N - K;%����У��λ����
ReNum = K/M;%������Ҫ�ظ��ۼӵĴ���
% У��bit�ۼӵ�ַ��

P = zeros(1,NumP);%��ʼ��У�����
for i = 1:K
    SortDataAddressForG{i} = [];
end
%�� i ��Ԫ������±��ʾ��Ϣ���� i ��������У������±�

for n = 1:ReNum % ȡ CodeTable ��һ��
    %Ԫ������ת����
    FirstPlusAddress = cellfun(@str2num,CodeTable{1,n});

    %% �ع� У������ۼ� ����
    for a = 1 + (n - 1) * M : n * M
        for j = 1 : length (FirstPlusAddress)
            Address = mod (FirstPlusAddress(j) + (mod (a-1, M)) * q, N-K);
            P(Address+1) = xor(P(Address+1), Data(a));
            SortDataAddressForG{a} = [SortDataAddressForG{a} Address];
        end
    end

%     %% ��һ��У������ۼ�
%     for i = 1:length(FirstPlusAddress) % �� 1 + (n-1)*M ����Ϣ���ز����˱��� FirstPlusAddress �е�У����ص�����
%         %��ΪУ������ۼӵ�ַ��ʼ�Ǵ�0��ʼ����ģ�����P������Ҫ+1
%         P(FirstPlusAddress(i)+1) = xor(P(FirstPlusAddress(i)+1),Data(1+(n-1)*M));
%         SortDataAddressForG{1 + (n-1)*M} = [SortDataAddressForG{1 + (n-1)*M} FirstPlusAddress(i)];
%     end
%     %% ����M-1��У������ۼ�
%     %���������M-1����Ϣ���ص�У������ۼ�λ��,����У������ۼ�
%     for a = 2+(n-1)*M:n*M
%         for j = 1:length(FirstPlusAddress)
%         Address = mod(FirstPlusAddress(j)+(mod((a-1),M))*q,N-K);
%         P(Address+1) = xor(P(Address+1),Data(a));
%         SortDataAddressForG{a} = [SortDataAddressForG{a} Address];
%         end     
%     end
end

%% �õ���ǰ����У��λ�����У��λ������λ�Ĺ�ϵ
SortPAddressForG = zeros(NumP,K);%������ΪУ��λ
for i = 1:K
    ForSortP = SortDataAddressForG{i};
    SortPAddressForG(ForSortP+1,i) = rem(SortPAddressForG(ForSortP+1,i)+1,2);
end
%�õ�����У��λ�����У��λ������λ�Ĺ�ϵ
%% �������յ�У�����,������Ϣλƴ��
for n = 2:NumP
    P(n) = xor(P(n),P(n-1));
end
LDPCcode = [Data P];
%% 
H = GetH(CodeTable,NumP,K,ReNum,M,q);