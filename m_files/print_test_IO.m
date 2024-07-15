function print_test_IO(fid, LDPCCode, CodeDeIW)
    code_length = 1440;
    quan_width = 10;
    fprintf (fid, "`timescale 1ns / 1ps\n");
    fprintf (fid, "module test;\n");
    fprintf (fid, "reg clk, rst;\n");
    fprintf (fid, "reg in_valid;\n");
    fprintf (fid, "reg [15:0] in_index;\n");
    fprintf (fid, "wire out_valid;\n");
    fprintf (fid, "wire [15:0] out_index;\n");
    fprintf (fid, "initial begin\n");
    fprintf (fid, "clk = 1'b1;\n");
    fprintf (fid, "rst = 1'b1;\n");
    fprintf (fid, "in_valid = 0;\n");
    fprintf (fid, "in_index = 0;\n");
    fprintf (fid, "#1\n");
    fprintf (fid, "rst = 1'b0;\n");
    fprintf (fid, "#1\n");
    fprintf (fid, "rst = 1'b1;\n");
    fprintf (fid, "#1\n");
    fprintf (fid, "in_valid = 1;\n");
    fprintf (fid, "end\n");
    fprintf (fid, "always #5 clk = ~clk;\n");


    fprintf (fid, "always @ (posedge clk) begin\n");
    fprintf (fid, "    if (in_valid == 1) begin\n");
    fprintf (fid, "        if (in_index < 1440 - 4)\n");
    fprintf (fid, "       in_index <= in_index + 4;\n");
    fprintf (fid, "        else\n");
    fprintf (fid, "        in_valid <= 0;\n");
    fprintf (fid, "    end\n");
    fprintf (fid, "end\n");

    fprintf (fid, "wire [" + string(code_length) + " * " + string(quan_width) + " - 1: 0] L = {");
    for cnt = 1440 : -1 : 2
        if (CodeDeIW(cnt) < 0)
            fprintf (fid, "-");
        end
        fprintf (fid, string(quan_width) + "'d" + string(round (abs (CodeDeIW(cnt)) * 50)) + ", ");
    end
    if (CodeDeIW(1) < 0)
        fprintf (fid, "-");
    end
    fprintf (fid, string(quan_width) + "'d" + string(round (abs (CodeDeIW(1)) * 50)) + "};\n");
    fprintf (fid, "wire done;\n");
    fprintf (fid, "wire [" + string (code_length - 1) + ":0] Bit;\n");
    fprintf (fid, "wire [" + string (code_length - 1) + ":0] Check_Bit;\n");
    for cnt = 1 : code_length
        fprintf (fid, "assign Check_Bit[" + string(cnt - 1) + "] = (Bit[" + string(cnt - 1) +"] == " + string(LDPCCode(cnt)) + ") ? 1 : 0;\n");
    end
    fprintf (fid, "wire [63:0] result;\n");
    fprintf (fid, "assign result = ");
    for cnt = 1 : 1440 - 1
        fprintf (fid, "Check_Bit[" + string(cnt - 1) + "] + ");
    end
    fprintf (fid, "Check_Bit[1440 - 1];\n");

    fprintf (fid, "Decoder Decoder1 (\n");
    fprintf (fid, ".clk (clk),\n");
    fprintf (fid, ".rst (rst),\n");
    fprintf (fid, ".in_valid (in_valid),\n");
    fprintf (fid, ".in_index (in_index),\n");
    fprintf (fid, ".data_in (L [(in_index+4)*" + string(quan_width) + "-1-:" + string(quan_width) + "*4]),\n");
    fprintf (fid, ".out_valid(out_valid),\n");
    fprintf (fid, ".Bit (Bit),\n");
    fprintf (fid, ".out_index (out_index)");
    fprintf (fid, ");\n");
    fprintf (fid, "endmodule\n");
end
