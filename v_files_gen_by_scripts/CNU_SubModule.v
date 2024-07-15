module get_abs #(
    parameter quan_width = 6
)
(
    input wire clk,
    input wire rst,
    input wire [7:0] cnt,
    input wire [7:0] target_cnt,
    input wire signed [quan_width-1:0] in_data,
    output reg [quan_width-1:0] out_data
);   

always @ (posedge clk or negedge rst) begin
    if (!rst) begin
        out_data <= 0;
    end
    else begin
        if (cnt == target_cnt) begin
            out_data <= in_data[quan_width-1] == 0 ? in_data : ~in_data + 1;
        end
    end
end

endmodule

module assign_C2V #(
    parameter quan_width = 6
)
(
    input wire clk,
    input wire rst,
    input wire [3:0] cnt,
    input wire [3:0] target_cnt,
    input wire signed [quan_width-1:0] min1,
    input wire signed [quan_width-1:0] min2,
    input wire signed [quan_width-1:0] V2C,
    input wire final_sign,
    output reg signed [quan_width-1:0] C2V
);
reg [quan_width-1:0] tmp;

always @ (posedge clk or negedge rst) begin
    if (!rst) begin
        tmp <= 0;
        C2V <= 0;
    end
    else begin
        if (cnt == target_cnt) begin
            if (min1 == V2C || min1 == ~V2C + 1) begin
                tmp <= min2 * 3 / 4;
            end
            else begin
                tmp <= min1 * 3 / 4;
            end
        end
        else if (cnt == target_cnt + 1) begin
            if (final_sign == 0)
            C2V <= tmp;
            else
            C2V <= ~tmp + 1;
        end
    end
end
endmodule

module in2out2 #(
	parameter quan_width = 6
)
(
    input wire clk,
    input wire rst,
    input wire [7:0] cnt,
    input wire [7:0] target_cnt,
    input wire signed [quan_width-1:0] in_data1,
    input wire signed [quan_width-1:0] in_data2,
    output reg [quan_width-1:0] out_data1,
    output reg [quan_width-1:0] out_data2
);
    always @ (posedge clk or negedge rst) begin
        if (!rst) begin
            out_data1 <= 0;
            out_data2 <= 0;
        end
        else begin
            if (cnt == target_cnt) begin
                if (in_data1 > in_data2) begin
                    out_data1 <= in_data2;
                    out_data2 <= in_data1;
                end
                else begin
                    out_data1 <= in_data1;
                    out_data2 <= in_data2;
                end
            end
        end
    end
endmodule

module in3out2 #(
	parameter quan_width = 6
)
(
    input wire clk,
    input wire rst,
    input wire [7:0] cnt,
    input wire [7:0] target_cnt,
    input wire [quan_width-1:0] in_data1,
    input wire [quan_width-1:0] in_data2,
    input wire [quan_width-1:0] in_data3,
    output reg [quan_width-1:0] out_data1,
    output reg [quan_width-1:0] out_data2
);
always @ (posedge clk or negedge rst) begin
    if (!rst) begin
        out_data1 <= 0;
        out_data2 <= 0;
    end
    else begin
        if (cnt == target_cnt) begin
            if (in_data1 < in_data2) begin
                if (in_data3 <= in_data1) begin
                    out_data1 <= in_data3;
                    out_data2 <= in_data1;
                end
                else if (in_data2 <= in_data3) begin
                    out_data1 <= in_data1;
                    out_data2 <= in_data2;
                end 
                else begin
                    out_data1 <= in_data1;
                    out_data2 <= in_data3;
                end
            end
            else begin//in_data2 < in_data1
                if (in_data3 <= in_data2) begin
                    out_data1 <= in_data3;
                    out_data2 <= in_data2;
                end
                else if (in_data1 <= in_data3) begin
                    out_data1 <= in_data2;
                    out_data2 <= in_data1;
                end 
                else begin
                    out_data1 <= in_data2;
                    out_data2 <= in_data3;
                end
            end
        end
    end
end

endmodule


module in4out2 #(
	parameter quan_width = 6
)
(
    input wire clk,
    input wire rst,
    input wire [7:0] cnt,
    input wire [7:0] target_cnt,
    input wire [quan_width-1:0] in_data1,//in_data1 <= in_data2
    input wire [quan_width-1:0] in_data2,
    input wire [quan_width-1:0] in_data3,//in_data3 <= in_data4
    input wire [quan_width-1:0] in_data4,
    output reg [quan_width-1:0] out_data1,
    output reg [quan_width-1:0] out_data2//次小
);

always @ (posedge clk or negedge rst) begin
    if (!rst) begin
        out_data1 <= 0;
        out_data2 <= 0;
    end
    else begin
        if (cnt == target_cnt) begin
            if (in_data4 <= in_data1) begin
                out_data1 <= in_data3;
                out_data2 <= in_data4;
            end
            else if (in_data2 <= in_data3) begin
                out_data1 <= in_data1;
                out_data2 <= in_data2;
            end
            else begin
                if (in_data3 < in_data1) begin
                    out_data1 <= in_data3;
                    out_data2 <= in_data1;
                end
                else begin
                    out_data1 <= in_data1;
                    out_data2 <= in_data3;
                end
            end
        end
    end
end
endmodule
