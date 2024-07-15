function H = GetH(CodeTable,NumP,K,ReNum,M,q)
%ͨ�����ɾ���G�õ�У�����H
H1 = zeros(NumP,K);
for n = 1:ReNum
    PlusAddress = cellfun(@str2num,CodeTable{1,n});
    for a = 1+(n-1)*M:n*M
        for j = 1:length(PlusAddress)
        AddressH = mod(PlusAddress(j)+(mod((a-1),M))*q,NumP);%���ĵ��ϵ�H1(pos,m)=1
        H1(AddressH+1 ,a) = 1;
        end
    end
end
%% �õ�У�����H
H2 = eye(NumP);
for n = NumP:-1:2
    H2(n,n-1) = 1;
end
H = [H1 H2];
end

