module test;

reg clk, rst;
reg [3:0] cnt;
reg [9:0] V2C_1, V2C_2, V2C_3, V2C_4, V2C_5, V2C_6, V2C_7;
wire [9:0] C2V_1, C2V_2, C2V_3, C2V_4, C2V_5, C2V_6, C2V_7;

initial begin
    clk = 1'b1;
    rst = 1'b1;
    cnt = 4'b0000;
    V2C_1 = -10'd17;//-17
    V2C_2 = 10'd16;//16
    V2C_3 = -10'd8;//-8
    V2C_4 = 10'd9;//9
    V2C_5 = -10'd10;//-10
    V2C_6 = 10'd12;//12
    V2C_7 = -10'd11;//-11
end

always #5 clk = ~clk;

always @ (posedge clk) begin
    if (cnt < 4'b1111)
    cnt <= cnt + 4'b0001;
    else
    cnt <= 4'b0000;
end

CNU_7 CNU1 (clk, rst, cnt, V2C_1, V2C_2, V2C_3, V2C_4, V2C_5, V2C_6, V2C_7, C2V_1, C2V_2, C2V_3, C2V_4, C2V_5, C2V_6, C2V_7);

endmodule