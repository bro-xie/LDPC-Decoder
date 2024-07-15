function CodeTable = GetTable(waveID)
%GETTABLE 此处显示有关此函数的摘要
%   此处显示详细说明
switch waveID
    case 1
        fid = fopen('Table1.txt');
    case 2
        fid = fopen('Table2.txt');
    case 3
        fid = fopen('Table3.txt');
    case 4
        fid = fopen('Table4.txt');
    case 5
        fid = fopen('Table5.txt');
    case 6
        fid = fopen('Table6.txt');
    case 7
        fid = fopen('Table7.txt');
    case 8
        fid = fopen('Table8.txt');
    case 9
        fid = fopen('Table9.txt');
    case 10
        fid = fopen('Table10.txt');        
    case 11
        fid = fopen('Table11.txt');
    case 12
        fid = fopen('Table12.txt');
    case 13
        fid = fopen('Table13.txt');
    case 14
        fid = fopen('Table14.txt');
    case 15
        fid = fopen('Table15.txt');
    case 16
        fid = fopen('Table16.txt');
end

i = 1;
while ~feof(fid)
   tline = fgetl(fid);
   S=regexp(tline,'\s+','split');
   	CodeTable{i} =  S;
   i = i+1;
   if isempty(tline)
       continue;
   end 
end       

end

