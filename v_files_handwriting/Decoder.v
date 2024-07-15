module Decoder #(
    parameter code_length = 2,
    parameter quan_width = 10
)
 (
   input wire clk,
   input wire rst,
   input wire [code_length * quan_width - 1: 0] L,
   output reg done,
   output wire [code_length - 1: 0] Bit
);

reg [7:0] cnt;
reg [4:0] iter;
reg Check_1, Check_2, Check_sum;
wire [quan_width - 1:0] C2V_1_1, C2V_1_2, C2V_2_1, C2V_2_2;
wire [quan_width - 1:0] V2C_1_1, V2C_1_2, V2C_2_1, V2C_2_2;
wire [quan_width - 1:0] V_1, V_2;

assign Bit[0] = V_1[9];
assign Bit[1] = V_2[9];

always @ (posedge clk or negedge rst) begin
    if (rst) begin
        cnt <= 0;
        iter <= 0;
        Check_1 <= 1;
        Check_2 <= 1;
        Check_sum <= 1;
    end
    else begin
        if (done == 0) begin
            if (cnt < 8'd15)
            cnt <= cnt + 1;
            else begin
                if (cnt == 8'd15) begin
                    Check_1 <= 1;
                    Check_2 <= 0;
                    cnt <= cnt + 1;
                end
                else if (cnt == 8'd16) begin
                    Check_sum <= Check_1 | Check_2;
                    cnt <= cnt + 1;
                end
                else begin
                    if (Check_sum == 0 || iter ==5'd30) 
                    done <= 1;
                    else begin
                        done <= 0;
                        cnt <= 0;
                    end
                end
            end
        end
    end
end


endmodule