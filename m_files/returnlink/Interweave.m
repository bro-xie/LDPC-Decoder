function CodeLDPCAfterIW = Interweave(CodeLDPC,m,N)
%ΪӦ��ͻ���ʹ����ڱ������н��з���ӳ��֮ǰ����Ҫ���н�֯����
%���ؽ�֯���ÿ���ֿ����ֶ��ԣ����������г�����ʽ��֯
%��֯�����������ڷ���ӳ������ͼ��������QPSK��������Ϊ2��8pskΪ3��
%--------------CodeLDPC������LDPC���������(������)!!
%--------------m���ڽ�֯��Ҫ���еĵ��ƽ���
%--------------N��LDPC���ܳ�
%���CodeLDPCAfterIWΪ������
Codesplit =  N/m;
CodeForIW = [];
for i = 1:m
    CodeForIW = [CodeForIW CodeLDPC(1+(i-1)*Codesplit:i*Codesplit)'];
end
    CodeLDPCAfterIW = reshape(CodeForIW',[],1);
end

