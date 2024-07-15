function CodeLDPCAfterIW = Interweave(CodeLDPC,m,N)
%为应对突发型错误，在比特序列进行符号映射之前，需要进行交织操作
%比特交织针对每个分块码字而言，采用列入行出矩阵式交织
%交织矩阵列数等于符号映射星座图阶数（如QPSK调制列数为2，8psk为3）
%--------------CodeLDPC：经过LDPC编码的码字(行向量)!!
%--------------m：在交织后要进行的调制阶数
%--------------N：LDPC码总长
%输出CodeLDPCAfterIW为行向量
Codesplit =  N/m;
CodeForIW = [];
for i = 1:m
    CodeForIW = [CodeForIW CodeLDPC(1+(i-1)*Codesplit:i*Codesplit)'];
end
    CodeLDPCAfterIW = reshape(CodeForIW',[],1);
end

