function print_Decoder(fid, H)
[m, n] = size (H);
code_length = 1440;
quan_width = 10;
    %% print ports.
    fprintf (fid, "module Decoder #(\n");
    fprintf (fid, "\tparameter code_length = " + string(n) + ",\n");
    fprintf (fid, "\tparameter quan_width = " + string(quan_width) + "\n");
    fprintf (fid, ")\n");
    fprintf (fid, "(\n");
    fprintf (fid, "\tinput wire clk,\n");
    fprintf (fid, "\tinput wire rst,\n");
    fprintf (fid, "\tinput wire in_valid,\n");
    fprintf (fid, "\tinput wire [15:0] in_index,\n");
    fprintf (fid, "\tinput wire [4 * quan_width - 1: 0] data_in,\n");
    fprintf (fid, "\toutput reg out_valid,\n");
    fprintf (fid, "\toutput reg [15:0] out_index,\n");
    fprintf (fid, "\toutput reg [4 - 1: 0] data_out\n");
    fprintf (fid, ");\n\n");

    %% define variables.
    fprintf (fid, "wire [code_length - 1:0] Bit;\n");
    fprintf (fid, "wire ");
    for col = 1 : n - 1
        fprintf (fid, "Bit_" + string(col) + ", ");
    end
    fprintf (fid, "Bit_" + string(n) + ";\n");

    fprintf (fid, "reg [7:0] cnt;\n");
    fprintf (fid, "reg [4:0] iter;\n");
    fprintf (fid, "reg ");
    for row = 1 : m
        fprintf (fid, "Check_" + string(row) + ", ");
    end
    fprintf (fid, "Check_Sum;\n");
    %% define L, C2V, V2C, V.
    fprintf (fid, "reg [quan_width - 1 : 0] ");
    for col = 1 : n - 1
        fprintf (fid, "L_" + string(col) + ", ");
    end
    fprintf (fid, "L_" + string(n) + ";\n");

    fprintf (fid, "wire [quan_width - 1:0] ");
    for row = 1 : m
        for col = 1 : n
            if (H(row, col) == 1)
                fprintf (fid, "C2V_" + string(row) + "_" + string(col) + ", ");
            end
        end
    end
    fprintf (fid, "C2V_0_0;\n");
    
    fprintf (fid, "wire [quan_width - 1:0] ");
    for row = 1 : m
        for col = 1 : n
            if (H(row, col))
                fprintf (fid, "V2C_" + string(col) + "_" + string(row) + ", ");
            end
        end
    end
    fprintf (fid, "V2C_0_0;\n");
    
    fprintf (fid, "wire [quan_width - 1:0] ");
    for col = 1 : n - 1
        fprintf (fid, "V_" + string(col) + ", ");
    end
    fprintf (fid, "V_" + string (n) + ";\n");
    
    fprintf (fid, "\n");

    %% print controller.
%     fprintf (fid, "always @ (posedge clk) begin\n");
%     fprintf (fid, "if (in_valid == 1) begin\n");
%     fprintf (fid, "\tL [(in_index + 4)*quan_width-1-:4*quan_width] <= data_in;\n");
%     fprintf (fid, "\tcnt <= 0;\n");
%     fprintf (fid, "end\n");
%     fprintf (fid, "if (in_valid == 0 && cnt == 0)\n");
%     fprintf (fid, "cnt <= 1;\n");
%     fprintf (fid, "end\n\n");
    % 输入
    fprintf (fid, "always @ (posedge clk) begin\n");
        fprintf (fid, "\tcase ({in_valid, in_index})\n");
        for cnt = 1 : 4 : code_length
            fprintf (fid, "\t\t{1'b1, 16'd" + string(cnt - 1) + ...
                "}: begin L_" + string(cnt) + " <= data_in[quan_width-1:0]; L_" + string(cnt+1) + " <= data_in[quan_width*2-1:quan_width];" + ...
                " L_" + string(cnt+2) + " <= data_in[quan_width*3-1:quan_width*2]; L_" + string(cnt+3) + " <= data_in[quan_width*4-1:quan_width*3]; end\n");
        end
        fprintf (fid, "\tendcase\n");
    fprintf (fid, "end\n\n");

    fprintf (fid, "always @ (posedge clk) begin\n");
    fprintf (fid, "if (in_valid == 0 && cnt == 0)\n");
    fprintf (fid, "cnt <= 1;\n");
    fprintf (fid, "end\n\n");

    %输出
%     fprintf (fid, "always @ (posedge clk) begin\n");
%         fprintf (fid, "if (out_valid == 1)\n");
%         fprintf (fid, "data_out <= Bit [out_index+3-:4];\n");
% 
%         fprintf (fid, "if (out_valid == 1) begin\n");
%             fprintf (fid, "if (out_index < code_length - 4)\n");
%             fprintf (fid, "out_index <= out_index + 4;\n");
%             fprintf (fid, "else\n");
%             fprintf (fid, "out_valid <= 0;\n");
%         fprintf (fid, "end\n");
%     fprintf (fid, "end\n\n");

    %输出
    fprintf (fid, "always @ (posedge clk) begin\n");
        fprintf (fid, "\tcase ({out_valid, out_index})\n");
        for cnt = 1 : 4 : code_length
            fprintf (fid, "\t\t{1'b1, 16'd" + string(cnt - 1) + ...
                "}: begin data_out[0] <= Bit_" + string(cnt) + "; data_out[1] <= Bit_" + string(cnt + 1) + ";" + ...
                "data_out[2] <= Bit_" + string(cnt + 2) + "; data_out[3] <= Bit_" + string(cnt + 3) + "; end\n");
        end
        fprintf (fid, "\tendcase\n");
    fprintf (fid, "end\n\n");

    fprintf (fid, "always @ (posedge clk) begin\n");
        fprintf (fid, "if (out_valid == 1) begin\n");
        fprintf (fid, "if (out_index < code_length - 4)\n");
        fprintf (fid, "out_index <= out_index + 4;\n");
        fprintf (fid, "else\n");
        fprintf (fid, "out_valid <= 0;\n");
        fprintf (fid, "end\n");
    fprintf (fid, "end\n\n");




    fprintf (fid, "always @ (posedge clk or negedge rst) begin\n");
    fprintf (fid, "\tif (!rst) begin\n");
    fprintf (fid, "\t\tcnt <= 0;\n");
    fprintf (fid, "\t\titer <= 0;\n");
    fprintf (fid, "\t\tout_valid <= 0;\n");
    fprintf (fid, "\t\tout_index <= 0;\n");
    fprintf (fid, "\t\tdata_out <= 4'd0;\n");
    for row = 1 : m
        fprintf (fid, "\t\tCheck_" + string(row) + " <= 1;\n");
    end
    fprintf (fid, "\t\tCheck_Sum <= 1;\n");
    fprintf (fid, "\tend\n");
    fprintf (fid, "\telse begin\n");
    fprintf (fid, "\t\tif (out_valid == 0) begin\n");
    fprintf (fid, "\t\t\tif (8'd0 < cnt && cnt < 8'd15)\n");
    fprintf (fid, "\t\t\tcnt <= cnt + 1;\n");
    fprintf (fid, "\t\t\telse if (cnt == 8'd15) begin\n");
    for row = 1 : m
        fprintf (fid, "\t\t\t\tCheck_" + string (row) + " <= ");
        index = find (H(row, :));
        for k = 1 : length (index) - 1
            fprintf (fid, "Bit_" + string(index(k)) + " ^ ");
        end
        fprintf (fid, "Bit_" + string(index(end)) + ";\n");
    end
    fprintf (fid, "\t\t\t\tcnt <= cnt + 1;\n");
    fprintf (fid, "\t\t\tend\n");
    fprintf (fid, "\t\t\telse if (cnt == 8'd16) begin\n");
    fprintf (fid, "\t\t\t\tCheck_Sum <= ");
    for row = 1 : m - 1
        fprintf (fid, "Check_" + string(row) + " | ");
    end
    fprintf (fid, "Check_" + string(m) + ";\n");
    fprintf (fid, "\t\t\t\tcnt <= cnt + 1;\n");
    fprintf (fid, "\t\t\tend\n");
    fprintf (fid, "\t\t\telse if (cnt == 8'd17) begin\n");
    fprintf (fid, "\t\t\t\tif (Check_Sum == 0 || iter == 5'd30) begin\n");
    fprintf (fid, "\t\t\t\t\tcnt <= cnt + 1;\n");
    fprintf (fid, "\t\t\t\t\tout_valid <= 1;\n");
    fprintf (fid, "\t\t\t\tend\n");
    fprintf (fid, "\t\t\t\telse begin\n");
    fprintf (fid, "\t\t\t\t\tout_valid <= 0;\n");
    fprintf (fid, "\t\t\t\t\tcnt <= 2;\n");
    fprintf (fid, "\t\t\t\t\titer <= iter + 1;\n");
    fprintf (fid, "\t\t\t\tend\n");
    fprintf (fid, "\t\t\tend\n");
    fprintf (fid, "\t\tend\n");
    fprintf (fid, "\tend\n");
    fprintf (fid, "end\n");
                    
    %% print Bits' assignment.
    for col = 1 : n
        fprintf (fid, "assign Bit_" + string(col) + " = V_" + string(col) + "[quan_width-1];\n");
    end
    
    fprintf (fid, "\n");
    %% print CNUs.
    for row = 1 : m
        degree = sum (H(row, :));
        fprintf (fid, "CNU_" + string(degree) + " #(quan_width)" + " CNU" + string(row) + " (");
            fprintf (fid, "\t.clk (clk),\n");
            fprintf (fid, "\t.rst (rst),\n");
            fprintf (fid, "\t.cnt (cnt),\n");
            cnt = 1;
            for col = 1 : n
                if (H(row, col) == 1)
                    fprintf (fid, "\t.V2C_" + string (cnt) + " (V2C_" + string(col) + "_" + string(row) + "),\n");
                    cnt = cnt + 1;
                end
            end
            cnt = 1;
            for col = 1 : n
                if (H(row, col) == 1)
                    fprintf (fid, "\t.C2V_" + string (cnt) + " (C2V_" + string(row) + "_" + string(col) + "),\n");
                    cnt = cnt + 1;
                end
            end
            fprintf (fid, "\t.init_cnt (8'd2)\n");
        fprintf (fid, ");\n");
        fprintf (fid, "\n");
    end
    
    %% caculate the max number of clock periods CNUs need.
    CN_degree = max (sum (H, 2));
    cnt_needed = 1;
    while (CN_degree > 2)
        if (mod (CN_degree, 2) == 0)
            if (mod (CN_degree, 4) == 0)
                CN_degree = CN_degree / 2;
            else
                CN_degree = (CN_degree - 2) / 2 + 2;
            end
        else
            CN_degree = floor ((CN_degree - 3) / 4) * 2 + 2;
        end
        cnt_needed = cnt_needed + 1;
    end
    cnt_needed = cnt_needed + 1 + 1;
    %% print VNU.
    for col = 1 : n
        degree = sum (H(:, col));
        fprintf (fid, "VNU_" + string(degree) + " #(quan_width) VNU" + string(col) + " (\n");
            fprintf (fid, "\t.clk (clk),\n");
            fprintf (fid, "\t.rst (rst),\n");
            fprintf (fid, "\t.cnt (cnt),\n");
            fprintf (fid, "\t.init_cnt (8'd" + string(cnt_needed + 4) + "),\n");
            cnt = 1;
            for row = 1 : m
                if (H(row, col) == 1)
                    fprintf (fid, "\t.C2V_" + string (cnt) + " (C2V_" + string(row) + "_" + string(col) + "),\n");
                    cnt = cnt + 1;
                end
            end
            %fprintf (fid, "\t.L (L[" + string(quan_width * (col - 1) + quan_width - 1) + ":" + string(quan_width * (col - 1)) + "]),\n");
            fprintf (fid, "\t.L (L_" + string(col) + "),\n");
            cnt = 1;
            for row = 1 : m
                if (H(row, col) == 1)
                    fprintf (fid, "\t.V2C_" + string (cnt) + " (V2C_" + string(col) + "_" + string(row) + "),\n");
                    cnt = cnt + 1;
                end
            end
            fprintf (fid, "\t.V (V_" + string(col) + ")\n");        
        fprintf (fid, ");\n");    
        fprintf (fid, "\n");
    end
fprintf (fid, "endmodule");