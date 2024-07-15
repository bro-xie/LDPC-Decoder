module VNU_1 #(
parameter quan_width = 6)
(
	input wire clk,
	input wire rst,
	input wire [7:0] cnt,
	input wire [7:0] init_cnt,
	input wire signed [quan_width-1:0] C2V_1,
	input wire signed [quan_width-1:0] L,
	output reg signed [quan_width-1:0] V2C_1,
	output reg signed [quan_width-1:0] V
);
	always @ (posedge clk or negedge rst) begin
		if (!rst) begin
			V2C_1 <= 0;
			V <= 0;
		end
		else begin
			if (cnt == 1) begin
				V2C_1 <= L;
				V <= L;
			end
			else if (cnt == init_cnt) begin
				V <= C2V_1 + L;
			end
			else if (cnt == init_cnt + 1) begin
				V2C_1 <= V - C2V_1;
			end
		end
	end
endmodule

module VNU_2 #(
parameter quan_width = 6)
(
	input wire clk,
	input wire rst,
	input wire [7:0] cnt,
	input wire [7:0] init_cnt,
	input wire signed [quan_width-1:0] C2V_1,
	input wire signed [quan_width-1:0] C2V_2,
	input wire signed [quan_width-1:0] L,
	output reg signed [quan_width-1:0] V2C_1,
	output reg signed [quan_width-1:0] V2C_2,
	output reg signed [quan_width-1:0] V
);
	always @ (posedge clk or negedge rst) begin
		if (!rst) begin
			V2C_1 <= 0;
			V2C_2 <= 0;
			V <= 0;
		end
		else begin
			if (cnt == 1) begin
				V2C_1 <= L;
				V2C_2 <= L;
				V <= L;
			end
			else if (cnt == init_cnt) begin
				V <= C2V_1 + C2V_2 + L;
			end
			else if (cnt == init_cnt + 1) begin
				V2C_1 <= V - C2V_1;
				V2C_2 <= V - C2V_2;
			end
		end
	end
endmodule

module VNU_3 #(
parameter quan_width = 6)
(
	input wire clk,
	input wire rst,
	input wire [7:0] cnt,
	input wire [7:0] init_cnt,
	input wire signed [quan_width-1:0] C2V_1,
	input wire signed [quan_width-1:0] C2V_2,
	input wire signed [quan_width-1:0] C2V_3,
	input wire signed [quan_width-1:0] L,
	output reg signed [quan_width-1:0] V2C_1,
	output reg signed [quan_width-1:0] V2C_2,
	output reg signed [quan_width-1:0] V2C_3,
	output reg signed [quan_width-1:0] V
);
	always @ (posedge clk or negedge rst) begin
		if (!rst) begin
			V2C_1 <= 0;
			V2C_2 <= 0;
			V2C_3 <= 0;
			V <= 0;
		end
		else begin
			if (cnt == 1) begin
				V2C_1 <= L;
				V2C_2 <= L;
				V2C_3 <= L;
				V <= L;
			end
			else if (cnt == init_cnt) begin
				V <= C2V_1 + C2V_2 + C2V_3 + L;
			end
			else if (cnt == init_cnt + 1) begin
				V2C_1 <= V - C2V_1;
				V2C_2 <= V - C2V_2;
				V2C_3 <= V - C2V_3;
			end
		end
	end
endmodule

module VNU_6 #(
parameter quan_width = 6)
(
	input wire clk,
	input wire rst,
	input wire [7:0] cnt,
	input wire [7:0] init_cnt,
	input wire signed [quan_width-1:0] C2V_1,
	input wire signed [quan_width-1:0] C2V_2,
	input wire signed [quan_width-1:0] C2V_3,
	input wire signed [quan_width-1:0] C2V_4,
	input wire signed [quan_width-1:0] C2V_5,
	input wire signed [quan_width-1:0] C2V_6,
	input wire signed [quan_width-1:0] L,
	output reg signed [quan_width-1:0] V2C_1,
	output reg signed [quan_width-1:0] V2C_2,
	output reg signed [quan_width-1:0] V2C_3,
	output reg signed [quan_width-1:0] V2C_4,
	output reg signed [quan_width-1:0] V2C_5,
	output reg signed [quan_width-1:0] V2C_6,
	output reg signed [quan_width-1:0] V
);
	always @ (posedge clk or negedge rst) begin
		if (!rst) begin
			V2C_1 <= 0;
			V2C_2 <= 0;
			V2C_3 <= 0;
			V2C_4 <= 0;
			V2C_5 <= 0;
			V2C_6 <= 0;
			V <= 0;
		end
		else begin
			if (cnt == 1) begin
				V2C_1 <= L;
				V2C_2 <= L;
				V2C_3 <= L;
				V2C_4 <= L;
				V2C_5 <= L;
				V2C_6 <= L;
				V <= L;
			end
			else if (cnt == init_cnt) begin
				V <= C2V_1 + C2V_2 + C2V_3 + C2V_4 + C2V_5 + C2V_6 + L;
			end
			else if (cnt == init_cnt + 1) begin
				V2C_1 <= V - C2V_1;
				V2C_2 <= V - C2V_2;
				V2C_3 <= V - C2V_3;
				V2C_4 <= V - C2V_4;
				V2C_5 <= V - C2V_5;
				V2C_6 <= V - C2V_6;
			end
		end
	end
endmodule
