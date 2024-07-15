module add2to1 (
    input wire clk,
    input wire rst,
    input wire [3:0] cnt,
    input wire [3:0] target_cnt,
    input wire [9:0] data_in1,
    input wire [9:0] data_in2, 
    output reg [9:0] data_out1
);

always @ (posedge clk or negedge rst) begin
    if (cnt == target_cnt) begin
        if ()
    end
end


endmodule