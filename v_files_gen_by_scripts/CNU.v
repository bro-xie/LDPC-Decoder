module CNU_19 #(
parameter quan_width = 6
)
(
	input wire clk,
	input wire rst,
	input wire [7:0] cnt,
	input wire [7:0] init_cnt,
	input wire [quan_width-1:0] V2C_1,
	input wire [quan_width-1:0] V2C_2,
	input wire [quan_width-1:0] V2C_3,
	input wire [quan_width-1:0] V2C_4,
	input wire [quan_width-1:0] V2C_5,
	input wire [quan_width-1:0] V2C_6,
	input wire [quan_width-1:0] V2C_7,
	input wire [quan_width-1:0] V2C_8,
	input wire [quan_width-1:0] V2C_9,
	input wire [quan_width-1:0] V2C_10,
	input wire [quan_width-1:0] V2C_11,
	input wire [quan_width-1:0] V2C_12,
	input wire [quan_width-1:0] V2C_13,
	input wire [quan_width-1:0] V2C_14,
	input wire [quan_width-1:0] V2C_15,
	input wire [quan_width-1:0] V2C_16,
	input wire [quan_width-1:0] V2C_17,
	input wire [quan_width-1:0] V2C_18,
	input wire [quan_width-1:0] V2C_19,
	output wire [quan_width-1:0] C2V_1,
	output wire [quan_width-1:0] C2V_2,
	output wire [quan_width-1:0] C2V_3,
	output wire [quan_width-1:0] C2V_4,
	output wire [quan_width-1:0] C2V_5,
	output wire [quan_width-1:0] C2V_6,
	output wire [quan_width-1:0] C2V_7,
	output wire [quan_width-1:0] C2V_8,
	output wire [quan_width-1:0] C2V_9,
	output wire [quan_width-1:0] C2V_10,
	output wire [quan_width-1:0] C2V_11,
	output wire [quan_width-1:0] C2V_12,
	output wire [quan_width-1:0] C2V_13,
	output wire [quan_width-1:0] C2V_14,
	output wire [quan_width-1:0] C2V_15,
	output wire [quan_width-1:0] C2V_16,
	output wire [quan_width-1:0] C2V_17,
	output wire [quan_width-1:0] C2V_18,
	output wire [quan_width-1:0] C2V_19
);

wire [quan_width-1:0] cache [19*3:0];
wire [quan_width-1:0] min1, min2;
wire final_sign_1, final_sign_2, final_sign_3, final_sign_4, final_sign_5, final_sign_6, final_sign_7, final_sign_8, final_sign_9, final_sign_10, final_sign_11, final_sign_12, final_sign_13, final_sign_14, final_sign_15, final_sign_16, final_sign_17, final_sign_18, final_sign_19, sign_xor_sum;

assign sign_xor_sum = V2C_1[quan_width-1] ^ V2C_2[quan_width-1] ^ V2C_3[quan_width-1] ^ V2C_4[quan_width-1] ^ V2C_5[quan_width-1] ^ V2C_6[quan_width-1] ^ V2C_7[quan_width-1] ^ V2C_8[quan_width-1] ^ V2C_9[quan_width-1] ^ V2C_10[quan_width-1] ^ V2C_11[quan_width-1] ^ V2C_12[quan_width-1] ^ V2C_13[quan_width-1] ^ V2C_14[quan_width-1] ^ V2C_15[quan_width-1] ^ V2C_16[quan_width-1] ^ V2C_17[quan_width-1] ^ V2C_18[quan_width-1] ^ V2C_19[quan_width-1];
assign final_sign_1 = V2C_1[quan_width-1] ^ sign_xor_sum;
assign final_sign_2 = V2C_2[quan_width-1] ^ sign_xor_sum;
assign final_sign_3 = V2C_3[quan_width-1] ^ sign_xor_sum;
assign final_sign_4 = V2C_4[quan_width-1] ^ sign_xor_sum;
assign final_sign_5 = V2C_5[quan_width-1] ^ sign_xor_sum;
assign final_sign_6 = V2C_6[quan_width-1] ^ sign_xor_sum;
assign final_sign_7 = V2C_7[quan_width-1] ^ sign_xor_sum;
assign final_sign_8 = V2C_8[quan_width-1] ^ sign_xor_sum;
assign final_sign_9 = V2C_9[quan_width-1] ^ sign_xor_sum;
assign final_sign_10 = V2C_10[quan_width-1] ^ sign_xor_sum;
assign final_sign_11 = V2C_11[quan_width-1] ^ sign_xor_sum;
assign final_sign_12 = V2C_12[quan_width-1] ^ sign_xor_sum;
assign final_sign_13 = V2C_13[quan_width-1] ^ sign_xor_sum;
assign final_sign_14 = V2C_14[quan_width-1] ^ sign_xor_sum;
assign final_sign_15 = V2C_15[quan_width-1] ^ sign_xor_sum;
assign final_sign_16 = V2C_16[quan_width-1] ^ sign_xor_sum;
assign final_sign_17 = V2C_17[quan_width-1] ^ sign_xor_sum;
assign final_sign_18 = V2C_18[quan_width-1] ^ sign_xor_sum;
assign final_sign_19 = V2C_19[quan_width-1] ^ sign_xor_sum;

get_abs #(quan_width) get_abs1(clk, rst, cnt, init_cnt, V2C_1, cache[1]);
get_abs #(quan_width) get_abs2(clk, rst, cnt, init_cnt, V2C_2, cache[2]);
get_abs #(quan_width) get_abs3(clk, rst, cnt, init_cnt, V2C_3, cache[3]);
get_abs #(quan_width) get_abs4(clk, rst, cnt, init_cnt, V2C_4, cache[4]);
get_abs #(quan_width) get_abs5(clk, rst, cnt, init_cnt, V2C_5, cache[5]);
get_abs #(quan_width) get_abs6(clk, rst, cnt, init_cnt, V2C_6, cache[6]);
get_abs #(quan_width) get_abs7(clk, rst, cnt, init_cnt, V2C_7, cache[7]);
get_abs #(quan_width) get_abs8(clk, rst, cnt, init_cnt, V2C_8, cache[8]);
get_abs #(quan_width) get_abs9(clk, rst, cnt, init_cnt, V2C_9, cache[9]);
get_abs #(quan_width) get_abs10(clk, rst, cnt, init_cnt, V2C_10, cache[10]);
get_abs #(quan_width) get_abs11(clk, rst, cnt, init_cnt, V2C_11, cache[11]);
get_abs #(quan_width) get_abs12(clk, rst, cnt, init_cnt, V2C_12, cache[12]);
get_abs #(quan_width) get_abs13(clk, rst, cnt, init_cnt, V2C_13, cache[13]);
get_abs #(quan_width) get_abs14(clk, rst, cnt, init_cnt, V2C_14, cache[14]);
get_abs #(quan_width) get_abs15(clk, rst, cnt, init_cnt, V2C_15, cache[15]);
get_abs #(quan_width) get_abs16(clk, rst, cnt, init_cnt, V2C_16, cache[16]);
get_abs #(quan_width) get_abs17(clk, rst, cnt, init_cnt, V2C_17, cache[17]);
get_abs #(quan_width) get_abs18(clk, rst, cnt, init_cnt, V2C_18, cache[18]);
get_abs #(quan_width) get_abs19(clk, rst, cnt, init_cnt, V2C_19, cache[19]);

in2out2 #(quan_width) in2out2_L1_0 (clk, rst, cnt, init_cnt + 1, cache[1], cache[2], cache[20], cache[21]);
in2out2 #(quan_width) in2out2_L1_1 (clk, rst, cnt, init_cnt + 1, cache[3], cache[4], cache[22], cache[23]);
in2out2 #(quan_width) in2out2_L1_2 (clk, rst, cnt, init_cnt + 1, cache[5], cache[6], cache[24], cache[25]);
in2out2 #(quan_width) in2out2_L1_3 (clk, rst, cnt, init_cnt + 1, cache[7], cache[8], cache[26], cache[27]);
in2out2 #(quan_width) in2out2_L1_4 (clk, rst, cnt, init_cnt + 1, cache[9], cache[10], cache[28], cache[29]);
in2out2 #(quan_width) in2out2_L1_5 (clk, rst, cnt, init_cnt + 1, cache[11], cache[12], cache[30], cache[31]);
in2out2 #(quan_width) in2out2_L1_6 (clk, rst, cnt, init_cnt + 1, cache[13], cache[14], cache[32], cache[33]);
in2out2 #(quan_width) in2out2_L1_7 (clk, rst, cnt, init_cnt + 1, cache[15], cache[16], cache[34], cache[35]);
in3out2 #(quan_width) in3out2_L1_8 (clk, rst, cnt, init_cnt + 1, cache[17], cache[18], cache[19], cache[36], cache[37]);
in4out2 #(quan_width) in4out2_L2_9 (clk, rst, cnt, init_cnt + 2, cache[20], cache[21], cache[22], cache[23], cache[38], cache[39]);
in4out2 #(quan_width) in4out2_L2_10 (clk, rst, cnt, init_cnt + 2, cache[24], cache[25], cache[26], cache[27], cache[40], cache[41]);
in4out2 #(quan_width) in4out2_L2_11 (clk, rst, cnt, init_cnt + 2, cache[28], cache[29], cache[30], cache[31], cache[42], cache[43]);
in4out2 #(quan_width) in4out2_L2_12 (clk, rst, cnt, init_cnt + 2, cache[32], cache[33], cache[34], cache[35], cache[44], cache[45]);
in4out2 #(quan_width) in4out2_L3_13 (clk, rst, cnt, init_cnt + 3, cache[36], cache[37], cache[38], cache[39], cache[46], cache[47]);
in4out2 #(quan_width) in4out2_L3_14 (clk, rst, cnt, init_cnt + 3, cache[40], cache[41], cache[42], cache[43], cache[48], cache[49]);
in4out2 #(quan_width) in4out2_L4_15 (clk, rst, cnt, init_cnt + 4, cache[44], cache[45], cache[46], cache[47], cache[50], cache[51]);
in4out2 #(quan_width) in4out2_L5_16 (clk, rst, cnt, init_cnt + 5, cache[48], cache[49], cache[50], cache[51], cache[52], cache[53]);

assign_C2V #(quan_width) assign_C2V_L6_0 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_1, final_sign_1, C2V_1);
assign_C2V #(quan_width) assign_C2V_L6_1 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_2, final_sign_2, C2V_2);
assign_C2V #(quan_width) assign_C2V_L6_2 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_3, final_sign_3, C2V_3);
assign_C2V #(quan_width) assign_C2V_L6_3 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_4, final_sign_4, C2V_4);
assign_C2V #(quan_width) assign_C2V_L6_4 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_5, final_sign_5, C2V_5);
assign_C2V #(quan_width) assign_C2V_L6_5 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_6, final_sign_6, C2V_6);
assign_C2V #(quan_width) assign_C2V_L6_6 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_7, final_sign_7, C2V_7);
assign_C2V #(quan_width) assign_C2V_L6_7 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_8, final_sign_8, C2V_8);
assign_C2V #(quan_width) assign_C2V_L6_8 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_9, final_sign_9, C2V_9);
assign_C2V #(quan_width) assign_C2V_L6_9 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_10, final_sign_10, C2V_10);
assign_C2V #(quan_width) assign_C2V_L6_10 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_11, final_sign_11, C2V_11);
assign_C2V #(quan_width) assign_C2V_L6_11 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_12, final_sign_12, C2V_12);
assign_C2V #(quan_width) assign_C2V_L6_12 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_13, final_sign_13, C2V_13);
assign_C2V #(quan_width) assign_C2V_L6_13 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_14, final_sign_14, C2V_14);
assign_C2V #(quan_width) assign_C2V_L6_14 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_15, final_sign_15, C2V_15);
assign_C2V #(quan_width) assign_C2V_L6_15 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_16, final_sign_16, C2V_16);
assign_C2V #(quan_width) assign_C2V_L6_16 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_17, final_sign_17, C2V_17);
assign_C2V #(quan_width) assign_C2V_L6_17 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_18, final_sign_18, C2V_18);
assign_C2V #(quan_width) assign_C2V_L6_18 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_19, final_sign_19, C2V_19);

endmodule

module CNU_20 #(
parameter quan_width = 6
)
(
	input wire clk,
	input wire rst,
	input wire [7:0] cnt,
	input wire [7:0] init_cnt,
	input wire [quan_width-1:0] V2C_1,
	input wire [quan_width-1:0] V2C_2,
	input wire [quan_width-1:0] V2C_3,
	input wire [quan_width-1:0] V2C_4,
	input wire [quan_width-1:0] V2C_5,
	input wire [quan_width-1:0] V2C_6,
	input wire [quan_width-1:0] V2C_7,
	input wire [quan_width-1:0] V2C_8,
	input wire [quan_width-1:0] V2C_9,
	input wire [quan_width-1:0] V2C_10,
	input wire [quan_width-1:0] V2C_11,
	input wire [quan_width-1:0] V2C_12,
	input wire [quan_width-1:0] V2C_13,
	input wire [quan_width-1:0] V2C_14,
	input wire [quan_width-1:0] V2C_15,
	input wire [quan_width-1:0] V2C_16,
	input wire [quan_width-1:0] V2C_17,
	input wire [quan_width-1:0] V2C_18,
	input wire [quan_width-1:0] V2C_19,
	input wire [quan_width-1:0] V2C_20,
	output wire [quan_width-1:0] C2V_1,
	output wire [quan_width-1:0] C2V_2,
	output wire [quan_width-1:0] C2V_3,
	output wire [quan_width-1:0] C2V_4,
	output wire [quan_width-1:0] C2V_5,
	output wire [quan_width-1:0] C2V_6,
	output wire [quan_width-1:0] C2V_7,
	output wire [quan_width-1:0] C2V_8,
	output wire [quan_width-1:0] C2V_9,
	output wire [quan_width-1:0] C2V_10,
	output wire [quan_width-1:0] C2V_11,
	output wire [quan_width-1:0] C2V_12,
	output wire [quan_width-1:0] C2V_13,
	output wire [quan_width-1:0] C2V_14,
	output wire [quan_width-1:0] C2V_15,
	output wire [quan_width-1:0] C2V_16,
	output wire [quan_width-1:0] C2V_17,
	output wire [quan_width-1:0] C2V_18,
	output wire [quan_width-1:0] C2V_19,
	output wire [quan_width-1:0] C2V_20
);

wire [quan_width-1:0] cache [20*3:0];
wire [quan_width-1:0] min1, min2;
wire final_sign_1, final_sign_2, final_sign_3, final_sign_4, final_sign_5, final_sign_6, final_sign_7, final_sign_8, final_sign_9, final_sign_10, final_sign_11, final_sign_12, final_sign_13, final_sign_14, final_sign_15, final_sign_16, final_sign_17, final_sign_18, final_sign_19, final_sign_20, sign_xor_sum;

assign sign_xor_sum = V2C_1[quan_width-1] ^ V2C_2[quan_width-1] ^ V2C_3[quan_width-1] ^ V2C_4[quan_width-1] ^ V2C_5[quan_width-1] ^ V2C_6[quan_width-1] ^ V2C_7[quan_width-1] ^ V2C_8[quan_width-1] ^ V2C_9[quan_width-1] ^ V2C_10[quan_width-1] ^ V2C_11[quan_width-1] ^ V2C_12[quan_width-1] ^ V2C_13[quan_width-1] ^ V2C_14[quan_width-1] ^ V2C_15[quan_width-1] ^ V2C_16[quan_width-1] ^ V2C_17[quan_width-1] ^ V2C_18[quan_width-1] ^ V2C_19[quan_width-1] ^ V2C_20[quan_width-1];
assign final_sign_1 = V2C_1[quan_width-1] ^ sign_xor_sum;
assign final_sign_2 = V2C_2[quan_width-1] ^ sign_xor_sum;
assign final_sign_3 = V2C_3[quan_width-1] ^ sign_xor_sum;
assign final_sign_4 = V2C_4[quan_width-1] ^ sign_xor_sum;
assign final_sign_5 = V2C_5[quan_width-1] ^ sign_xor_sum;
assign final_sign_6 = V2C_6[quan_width-1] ^ sign_xor_sum;
assign final_sign_7 = V2C_7[quan_width-1] ^ sign_xor_sum;
assign final_sign_8 = V2C_8[quan_width-1] ^ sign_xor_sum;
assign final_sign_9 = V2C_9[quan_width-1] ^ sign_xor_sum;
assign final_sign_10 = V2C_10[quan_width-1] ^ sign_xor_sum;
assign final_sign_11 = V2C_11[quan_width-1] ^ sign_xor_sum;
assign final_sign_12 = V2C_12[quan_width-1] ^ sign_xor_sum;
assign final_sign_13 = V2C_13[quan_width-1] ^ sign_xor_sum;
assign final_sign_14 = V2C_14[quan_width-1] ^ sign_xor_sum;
assign final_sign_15 = V2C_15[quan_width-1] ^ sign_xor_sum;
assign final_sign_16 = V2C_16[quan_width-1] ^ sign_xor_sum;
assign final_sign_17 = V2C_17[quan_width-1] ^ sign_xor_sum;
assign final_sign_18 = V2C_18[quan_width-1] ^ sign_xor_sum;
assign final_sign_19 = V2C_19[quan_width-1] ^ sign_xor_sum;
assign final_sign_20 = V2C_20[quan_width-1] ^ sign_xor_sum;

get_abs #(quan_width) get_abs1(clk, rst, cnt, init_cnt, V2C_1, cache[1]);
get_abs #(quan_width) get_abs2(clk, rst, cnt, init_cnt, V2C_2, cache[2]);
get_abs #(quan_width) get_abs3(clk, rst, cnt, init_cnt, V2C_3, cache[3]);
get_abs #(quan_width) get_abs4(clk, rst, cnt, init_cnt, V2C_4, cache[4]);
get_abs #(quan_width) get_abs5(clk, rst, cnt, init_cnt, V2C_5, cache[5]);
get_abs #(quan_width) get_abs6(clk, rst, cnt, init_cnt, V2C_6, cache[6]);
get_abs #(quan_width) get_abs7(clk, rst, cnt, init_cnt, V2C_7, cache[7]);
get_abs #(quan_width) get_abs8(clk, rst, cnt, init_cnt, V2C_8, cache[8]);
get_abs #(quan_width) get_abs9(clk, rst, cnt, init_cnt, V2C_9, cache[9]);
get_abs #(quan_width) get_abs10(clk, rst, cnt, init_cnt, V2C_10, cache[10]);
get_abs #(quan_width) get_abs11(clk, rst, cnt, init_cnt, V2C_11, cache[11]);
get_abs #(quan_width) get_abs12(clk, rst, cnt, init_cnt, V2C_12, cache[12]);
get_abs #(quan_width) get_abs13(clk, rst, cnt, init_cnt, V2C_13, cache[13]);
get_abs #(quan_width) get_abs14(clk, rst, cnt, init_cnt, V2C_14, cache[14]);
get_abs #(quan_width) get_abs15(clk, rst, cnt, init_cnt, V2C_15, cache[15]);
get_abs #(quan_width) get_abs16(clk, rst, cnt, init_cnt, V2C_16, cache[16]);
get_abs #(quan_width) get_abs17(clk, rst, cnt, init_cnt, V2C_17, cache[17]);
get_abs #(quan_width) get_abs18(clk, rst, cnt, init_cnt, V2C_18, cache[18]);
get_abs #(quan_width) get_abs19(clk, rst, cnt, init_cnt, V2C_19, cache[19]);
get_abs #(quan_width) get_abs20(clk, rst, cnt, init_cnt, V2C_20, cache[20]);

in2out2 #(quan_width) in2out2_L1_0 (clk, rst, cnt, init_cnt + 1, cache[1], cache[2], cache[21], cache[22]);
in2out2 #(quan_width) in2out2_L1_1 (clk, rst, cnt, init_cnt + 1, cache[3], cache[4], cache[23], cache[24]);
in2out2 #(quan_width) in2out2_L1_2 (clk, rst, cnt, init_cnt + 1, cache[5], cache[6], cache[25], cache[26]);
in2out2 #(quan_width) in2out2_L1_3 (clk, rst, cnt, init_cnt + 1, cache[7], cache[8], cache[27], cache[28]);
in2out2 #(quan_width) in2out2_L1_4 (clk, rst, cnt, init_cnt + 1, cache[9], cache[10], cache[29], cache[30]);
in2out2 #(quan_width) in2out2_L1_5 (clk, rst, cnt, init_cnt + 1, cache[11], cache[12], cache[31], cache[32]);
in2out2 #(quan_width) in2out2_L1_6 (clk, rst, cnt, init_cnt + 1, cache[13], cache[14], cache[33], cache[34]);
in2out2 #(quan_width) in2out2_L1_7 (clk, rst, cnt, init_cnt + 1, cache[15], cache[16], cache[35], cache[36]);
in2out2 #(quan_width) in2out2_L1_8 (clk, rst, cnt, init_cnt + 1, cache[17], cache[18], cache[37], cache[38]);
in2out2 #(quan_width) in2out2_L1_9 (clk, rst, cnt, init_cnt + 1, cache[19], cache[20], cache[39], cache[40]);
in4out2 #(quan_width) in4out2_L2_10 (clk, rst, cnt, init_cnt + 2, cache[21], cache[22], cache[23], cache[24], cache[41], cache[42]);
in4out2 #(quan_width) in4out2_L2_11 (clk, rst, cnt, init_cnt + 2, cache[25], cache[26], cache[27], cache[28], cache[43], cache[44]);
in4out2 #(quan_width) in4out2_L2_12 (clk, rst, cnt, init_cnt + 2, cache[29], cache[30], cache[31], cache[32], cache[45], cache[46]);
in4out2 #(quan_width) in4out2_L2_13 (clk, rst, cnt, init_cnt + 2, cache[33], cache[34], cache[35], cache[36], cache[47], cache[48]);
in4out2 #(quan_width) in4out2_L2_14 (clk, rst, cnt, init_cnt + 2, cache[37], cache[38], cache[39], cache[40], cache[49], cache[50]);
in4out2 #(quan_width) in4out2_L3_15 (clk, rst, cnt, init_cnt + 3, cache[41], cache[42], cache[43], cache[44], cache[51], cache[52]);
in4out2 #(quan_width) in4out2_L3_16 (clk, rst, cnt, init_cnt + 3, cache[45], cache[46], cache[47], cache[48], cache[53], cache[54]);
in4out2 #(quan_width) in4out2_L4_17 (clk, rst, cnt, init_cnt + 4, cache[49], cache[50], cache[51], cache[52], cache[55], cache[56]);
in4out2 #(quan_width) in4out2_L5_18 (clk, rst, cnt, init_cnt + 5, cache[53], cache[54], cache[55], cache[56], cache[57], cache[58]);

assign_C2V #(quan_width) assign_C2V_L6_0 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_1, final_sign_1, C2V_1);
assign_C2V #(quan_width) assign_C2V_L6_1 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_2, final_sign_2, C2V_2);
assign_C2V #(quan_width) assign_C2V_L6_2 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_3, final_sign_3, C2V_3);
assign_C2V #(quan_width) assign_C2V_L6_3 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_4, final_sign_4, C2V_4);
assign_C2V #(quan_width) assign_C2V_L6_4 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_5, final_sign_5, C2V_5);
assign_C2V #(quan_width) assign_C2V_L6_5 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_6, final_sign_6, C2V_6);
assign_C2V #(quan_width) assign_C2V_L6_6 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_7, final_sign_7, C2V_7);
assign_C2V #(quan_width) assign_C2V_L6_7 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_8, final_sign_8, C2V_8);
assign_C2V #(quan_width) assign_C2V_L6_8 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_9, final_sign_9, C2V_9);
assign_C2V #(quan_width) assign_C2V_L6_9 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_10, final_sign_10, C2V_10);
assign_C2V #(quan_width) assign_C2V_L6_10 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_11, final_sign_11, C2V_11);
assign_C2V #(quan_width) assign_C2V_L6_11 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_12, final_sign_12, C2V_12);
assign_C2V #(quan_width) assign_C2V_L6_12 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_13, final_sign_13, C2V_13);
assign_C2V #(quan_width) assign_C2V_L6_13 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_14, final_sign_14, C2V_14);
assign_C2V #(quan_width) assign_C2V_L6_14 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_15, final_sign_15, C2V_15);
assign_C2V #(quan_width) assign_C2V_L6_15 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_16, final_sign_16, C2V_16);
assign_C2V #(quan_width) assign_C2V_L6_16 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_17, final_sign_17, C2V_17);
assign_C2V #(quan_width) assign_C2V_L6_17 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_18, final_sign_18, C2V_18);
assign_C2V #(quan_width) assign_C2V_L6_18 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_19, final_sign_19, C2V_19);
assign_C2V #(quan_width) assign_C2V_L6_19 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_20, final_sign_20, C2V_20);

endmodule

