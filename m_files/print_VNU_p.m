function print_VNU_p (fid, p)
    %% print port.
    fprintf (fid, "module VNU_" + string (p) + " #(\n");
    fprintf (fid, "parameter quan_width = 6)\n");
    fprintf (fid, "(\n");
        fprintf (fid, "\tinput wire clk,\n");
        fprintf (fid, "\tinput wire rst,\n");
        fprintf (fid, "\tinput wire [7:0] cnt,\n");
        fprintf (fid, "\tinput wire [7:0] init_cnt,\n");
        for cnt = 1 : p
            fprintf (fid, "\tinput wire signed [quan_width-1:0] C2V_" + string(cnt) + ",\n");    
        end
        fprintf (fid, "\tinput wire signed [quan_width-1:0] L,\n");
        for cnt = 1 : p
            fprintf (fid, "\toutput reg signed [quan_width-1:0] V2C_" + string(cnt) + ",\n");    
        end
        fprintf (fid, "\toutput reg signed [quan_width-1:0] V\n");
    fprintf (fid, ");\n");

    %% print always.



    fprintf (fid, "\talways @ (posedge clk or negedge rst) begin\n");
    fprintf (fid, "\t\tif (!rst) begin\n");
    for cnt = 1 : p
        fprintf (fid, "\t\t\tV2C_" + string(cnt) + " <= 0;\n");
    end
    fprintf (fid, "\t\t\tV <= 0;\n");
    fprintf (fid, "\t\tend\n");
    fprintf (fid, "\t\telse begin\n");
        fprintf (fid, "\t\t\tif (cnt == 1) begin\n");
            for cnt = 1 : p
                fprintf (fid, "\t\t\t\tV2C_" + string(cnt) + " <= L;\n");
            end
            fprintf (fid, "\t\t\t\tV <= L;\n");
        fprintf (fid, "\t\t\tend\n")
        fprintf (fid, "\t\t\telse if (cnt == init_cnt) begin\n");
        fprintf (fid, "\t\t\t\tV <= ");
        for cnt = 1 : p
            fprintf (fid, "C2V_" + string(cnt) + " + ");
        end
        fprintf (fid, "L;\n");
        fprintf (fid, "\t\t\tend\n");
        fprintf (fid, "\t\t\telse if (cnt == init_cnt + 1) begin\n");
        for cnt = 1 : p
            fprintf (fid, "\t\t\t\tV2C_" + string(cnt) + " <= V - C2V_" + string(cnt) + ";\n");
        end
    fprintf (fid, "\t\t\tend\n");
    fprintf (fid, "\t\tend\n");
    fprintf (fid, "\tend\n");

    %% print "endmodule".
    fprintf (fid, "endmodule\n");
end