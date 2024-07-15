%convert dec from (1, N) to (m, N / m);
function CodeDeIW = Deinterweave(dec,m,N)
%输入dec为行向量！
Codesplit =  N/m;    
CodeForDeIW = reshape(dec,m,[]);
CodeDeIW = [];
 for i = 1:m
   CodeDeIW = [CodeDeIW CodeForDeIW(i,:)];
 end

end

