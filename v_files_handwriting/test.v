`include "Decoder.v"
`timescale 1ns / 1ps
module test;

reg clk, rst;
initial begin
    //$dumpfile ("wave.vcd");
    //$dumpvars (0, test);
    clk = 1'b1;
    rst = 1'b1;
    #20
    rst = 1'b0;
    //#1000
    //$finish;
end
always #5 clk = ~clk;
wire [127:0] tmp = {$realtobits(1.7), $realtobits(2.3)};
wire done;
wire [1:0] Bit;
Decoder Decoder1 (
    .clk (clk),
    .rst (rst),
    .L (tmp),
    .done (done),
    .Bit (Bit)
);

endmodule