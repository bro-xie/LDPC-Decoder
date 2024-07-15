`include"VNU.v"

module test;

reg clk, rst;
initial begin
    clk = 1'b1;
    rst = 1'b1;
end

always #5 clk = ~clk;


endmodule