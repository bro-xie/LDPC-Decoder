% inxoutx部分的时序分配存在问题，在同一个时钟周期中，存在cache值即为输入又为输出，这就导致了上一轮迭代的值被用到了该轮运算中
function print_CNU_q(fid, q)
%% check if q == 1.
if (q == 1)
    return;
end

%% print ports.
fprintf (fid, "module CNU_" + string(q) + " #(\n");
fprintf (fid, "parameter quan_width = 6\n");
fprintf (fid, ")\n");
fprintf (fid, "(\n");
fprintf (fid, "\tinput wire clk,\n");
fprintf (fid, "\tinput wire rst,\n");
fprintf (fid, "\tinput wire [7:0] cnt,\n");
fprintf (fid, "\tinput wire [7:0] init_cnt,\n");
for cnt = 1 : q
    fprintf (fid, "\tinput wire [quan_width-1:0] V2C_" + string (cnt) + ",\n");
end
for cnt = 1 : q - 1
    fprintf (fid, "\toutput wire [quan_width-1:0] C2V_" + string (cnt) + ",\n");
end
fprintf (fid, "\toutput wire [quan_width-1:0] C2V_" + string (q) + "\n");
fprintf (fid, ");\n");

fprintf (fid, "\n");
%% print variables.
fprintf (fid, "wire [quan_width-1:0] cache [" + string(q) + "*3:0];\n");
fprintf (fid, "wire [quan_width-1:0] min1, min2;\n");
fprintf (fid, "wire ");
for cnt = 1 : q
    fprintf (fid, "final_sign_" + string(cnt) + ", ");
end
fprintf (fid, "sign_xor_sum;\n");

fprintf (fid, "\n");
%% print sign assigning part
fprintf (fid, "assign sign_xor_sum = ");
for cnt = 1 : q - 1
    fprintf (fid, "V2C_" + string (cnt) + "[quan_width-1] ^ ");
end
fprintf (fid, "V2C_" + string(q) + "[quan_width-1];\n");
for cnt = 1 : q
    fprintf (fid, "assign final_sign_" + string(cnt) + " = V2C_" + string(cnt) + "[quan_width-1] ^ sign_xor_sum;\n");
end

fprintf (fid, "\n");
%% print get abs.
for cnt = 1 : q
    fprintf (fid, "get_abs #(quan_width) get_abs" + string(cnt) + "(clk, rst, cnt, init_cnt, V2C_" + string(cnt) + ", cache[" + string(cnt) + "]);\n");
end

fprintf (fid, "\n");
%% print searching min1, min2.
module_cnt = 0;
vector = [];
next_cache = 0;

if (mod(q, 2) == 0) 
    for cnt = 1 : q / 2
        fprintf (fid, "in2out2 #(quan_width) in2out2_L1_" + string(module_cnt) + " (clk, rst, cnt, init_cnt + 1," + ...
            " cache[" + string(cnt * 2 - 1) + "], cache[" + string(cnt*2) + "], cache[" + string(cnt * 2 - 1 + q) + "], cache[" + string(cnt * 2 + q) + "]);\n");
        module_cnt = module_cnt + 1;
        vector = [vector, "cache[" + string(cnt * 2 - 1 + q) + "]", "cache[" + string(cnt * 2 + q) + "]"];
    end
    next_cache = q * 2 + 1;
else
    for cnt = 1 : (q - 1) / 2 - 1
        fprintf (fid, "in2out2 #(quan_width) in2out2_L1_" + string(module_cnt) + " (clk, rst, cnt, init_cnt + 1," + ...
            " cache[" + string(cnt * 2 - 1) + "], cache[" + string(cnt*2) + "], cache[" + string(cnt * 2 - 1 + q) + "], cache[" + string(cnt * 2 + q) + "]);\n");
        module_cnt = module_cnt + 1;
        vector = [vector, "cache[" + string(cnt * 2 - 1 + q) + "]", "cache[" + string(cnt * 2 + q) + "]"];
    end
    fprintf (fid, "in3out2 #(quan_width) in3out2_L1_" + string(module_cnt) + " (clk, rst, cnt, init_cnt + 1," + ...
            " cache[" + string(q-2) + "], cache[" + string(q-1) + "], cache[" + string(q) + "], cache[" + string(q-2 + q) + "], cache[" + string(q-1 + q) + "]);\n");
    module_cnt = module_cnt + 1;
    vector = [vector, "cache[" + string(q-2 + q) + "]", "cache[" + string(q-1 + q) + "]"];
    next_cache = q * 2;
end

index = ones (1, length (vector)) + 1;

while (length (vector) > 2)
    fprintf (fid, "in4out2 #(quan_width) in4out2_L" + string(index(4)) + "_" + string(module_cnt) + " " + ...
        "(clk, rst, cnt, init_cnt + " + string(index(4)) + ", " + ...
        vector(1) + ", " + vector(2) + ", " + vector(3) + ", " + vector(4) + ...
        ", cache[" + string(next_cache) + "], cache[" + string(next_cache + 1) + "]);\n");
    vector = [vector, "cache[" + string(next_cache) + "]", "cache[" + string(next_cache + 1) + "]"];
    index = [index, index(1) + 1, index(1) + 1];
    vector = vector (5 : end);
    index = index (5 : end);
    module_cnt = module_cnt + 1;
    next_cache = next_cache + 2;
end

fprintf (fid, "\n");
%% print assign part.
for cnt = 1 : q
    fprintf (fid, "assign_C2V #(quan_width) assign_C2V_L" + string(index(1)) + "_" + string(cnt - 1) + ...
        " (clk, rst, cnt, init_cnt + " + string(index(1)) + ", " + vector(1) + ", " + vector(2) + ", V2C_" + string (cnt) + ...
        ", final_sign_" + string(cnt) + ", C2V_" + string(cnt) + ");\n");
    
end

fprintf (fid, "\n");
%% print "endmodule".
fprintf (fid, "endmodule\n");
end