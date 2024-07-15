module Decoder #(
	parameter code_length = 1440,
	parameter quan_width = 15
)
(
	input wire clk,
	input wire rst,
	input wire in_valid,
	input wire [15:0] in_index,
	input wire [4 * quan_width - 1: 0] data_in,
	output reg out_valid,
	output reg [15:0] out_index,
	output reg [4 - 1: 0] data_out,
	//output wire [code_length - 1:0] Bit
);

reg [code_length * quan_width - 1 : 0] L;
wire [code_length - 1:0] Bit;
reg [7:0] cnt;
reg [4:0] iter;
reg Check_1, Check_2, Check_3, Check_4, Check_5, Check_6, Check_7, Check_8, Check_9, 
……
……
…… 
Check_270, Check_271, Check_272, Check_273, Check_274, Check_275, Check_276, Check_277, Check_278, Check_279, Check_280, Check_281, Check_282, Check_283, Check_284, Check_285, Check_286, Check_287, Check_288, Check_Sum;
wire [quan_width - 1:0] C2V_1_5, C2V_1_89, C2V_1_109, C2V_1_170, C2V_1_232, C2V_1_275, C2V_1_375, C2V_1_429, C2V_1_526, C2V_1_762, C2V_1_810, C2V_1_858, 
……
……
……
V2C_327_288, V2C_479_288, V2C_576_288, V2C_609_288, V2C_813_288, V2C_841_288, V2C_874_288, V2C_936_288, V2C_971_288, V2C_1038_288, V2C_1102_288, V2C_1152_288, V2C_1439_288, V2C_1440_288, V2C_0_0;
wire [quan_width - 1:0] V_1, V_2, V_3, V_4, V_5, V_6, V_7, V_8, V_9, V_10, V_11, V_12, V_13, V_14, V_15, V_16, V_17, V_18, V_19, V_20, V_21, V_22, V_23, V_24, V_25, V_26, 
……
……
……
V_1432, V_1433, V_1434, V_1435, V_1436, V_1437, V_1438, V_1439, V_1440;

always @ (posedge clk or negedge rst) begin
if (rst && in_valid == 1) begin
	L [(in_index + 4)*quan_width-1-:4*quan_width] <= data_in;
	cnt <= 0;
end
if (rst && in_valid == 0 && cnt == 0) 
cnt <= 1;
end

always @ (posedge clk or negedge rst) begin
if (rst && out_valid == 1)
data_out <= Bit [out_index+3-:4];

if (rst && out_valid == 1) begin
if (out_index < code_length - 4)
out_index <= out_index + 4;
else begin
out_valid <= 0;
end
end
end

always @ (posedge clk or negedge rst) begin
	if (!rst) begin
		cnt <= 0;
		iter <= 0;
		out_valid <= 0;
		out_index <= 0;
		data_out <= 4'd0;
		Check_1 <= 1;
		Check_2 <= 1;
		Check_3 <= 1;
		Check_4 <= 1;
		Check_5 <= 1;
		Check_6 <= 1;
		Check_7 <= 1;
		Check_8 <= 1;
		Check_9 <= 1;
		Check_10 <= 1;
……
……
……
		Check_281 <= 1;
		Check_282 <= 1;
		Check_283 <= 1;
		Check_284 <= 1;
		Check_285 <= 1;
		Check_286 <= 1;
		Check_287 <= 1;
		Check_288 <= 1;
		Check_Sum <= 1;
	end
	else begin
		if (out_valid == 0) begin
			if (8'd0 < cnt && cnt < 8'd15)
			cnt <= cnt + 1;
			else if (cnt == 8'd15) begin
				Check_1 <= Bit[4] ^ Bit[88] ^ Bit[108] ^ Bit[169] ^ Bit[231] ^ Bit[274] ^ Bit[374] ^ Bit[428] ^ Bit[525] ^ Bit[761] ^ Bit[809] ^ Bit[857] ^ Bit[898] ^ Bit[939] ^ Bit[973] ^ Bit[1012] ^ Bit[1086] ^ Bit[1145] ^ Bit[1152];
				Check_2 <= Bit[13] ^ Bit[62] ^ Bit[118] ^ Bit[166] ^ Bit[195] ^ Bit[264] ^ Bit[315] ^ Bit[422] ^ Bit[511] ^ Bit[671] ^ Bit[684] ^ Bit[852] ^ Bit[894] ^ Bit[957] ^ Bit[988] ^ Bit[1020] ^ Bit[1087] ^ Bit[1118] ^ Bit[1152] ^ Bit[1153];
……
……
……
				Check_288 <= Bit[28] ^ Bit[52] ^ Bit[140] ^ Bit[160] ^ Bit[194] ^ Bit[273] ^ Bit[326] ^ Bit[478] ^ Bit[575] ^ Bit[608] ^ Bit[812] ^ Bit[840] ^ Bit[873] ^ Bit[935] ^ Bit[970] ^ Bit[1037] ^ Bit[1101] ^ Bit[1151] ^ Bit[1438] ^ Bit[1439];
				cnt <= cnt + 1;
			end
			else if (cnt == 8'd16) begin
				Check_Sum <= Check_1 | Check_2 | Check_3 | Check_4 | Check_5 | Check_6 | Check_7 | Check_8 | Check_9 | Check_10 | Check_11 | Check_12 | Check_13 | Check_14 | Check_15 | Check_16 | Check_17 | Check_18 | Check_19 | Check_20 | Check_21 | Check_22 | Check_23 | Check_24 | Check_25 | Check_26 | Check_27 | Check_28 | Check_29 | Check_30 | Check_31 | Check_32 | Check_33 | Check_34 | Check_35 | Check_36 | Check_37 | Check_38 | Check_39 | Check_40 | Check_41 | Check_42 | Check_43 | Check_44 | Check_45 | Check_46 | Check_47 | Check_48 | Check_49 | Check_50 | Check_51 | Check_52 | Check_53 | Check_54 | Check_55 | Check_56 | Check_57 | Check_58 | Check_59 | Check_60 | Check_61 | Check_62 | Check_63 | Check_64 | Check_65 | Check_66 | Check_67 | Check_68 | Check_69 | Check_70 | Check_71 | Check_72 | Check_73 | Check_74 | Check_75 | Check_76 | Check_77 | Check_78 | Check_79 | Check_80 | Check_81 | Check_82 | Check_83 | Check_84 | Check_85 | Check_86 | Check_87 | Check_88 | Check_89 | Check_90 | Check_91 | Check_92 | Check_93 | Check_94 | Check_95 | Check_96 | Check_97 | Check_98 | Check_99 | Check_100 | Check_101 | Check_102 | Check_103 | Check_104 | Check_105 | Check_106 | Check_107 | Check_108 | Check_109 | Check_110 | Check_111 | Check_112 | Check_113 | Check_114 | Check_115 | Check_116 | Check_117 | Check_118 | Check_119 | Check_120 | Check_121 | Check_122 | Check_123 | Check_124 | Check_125 | Check_126 | Check_127 | Check_128 | Check_129 | Check_130 | Check_131 | Check_132 | Check_133 | Check_134 | Check_135 | Check_136 | Check_137 | Check_138 | Check_139 | Check_140 | Check_141 | Check_142 | Check_143 | Check_144 | Check_145 | Check_146 | Check_147 | Check_148 | Check_149 | Check_150 | Check_151 | Check_152 | Check_153 | Check_154 | Check_155 | Check_156 | Check_157 | Check_158 | Check_159 | Check_160 | Check_161 | Check_162 | Check_163 | Check_164 | Check_165 | Check_166 | Check_167 | Check_168 | Check_169 | Check_170 | Check_171 | Check_172 | Check_173 | Check_174 | Check_175 | Check_176 | Check_177 | Check_178 | Check_179 | Check_180 | Check_181 | Check_182 | Check_183 | Check_184 | Check_185 | Check_186 | Check_187 | Check_188 | Check_189 | Check_190 | Check_191 | Check_192 | Check_193 | Check_194 | Check_195 | Check_196 | Check_197 | Check_198 | Check_199 | Check_200 | Check_201 | Check_202 | Check_203 | Check_204 | Check_205 | Check_206 | Check_207 | Check_208 | Check_209 | Check_210 | Check_211 | Check_212 | Check_213 | Check_214 | Check_215 | Check_216 | Check_217 | Check_218 | Check_219 | Check_220 | Check_221 | Check_222 | Check_223 | Check_224 | Check_225 | Check_226 | Check_227 | Check_228 | Check_229 | Check_230 | Check_231 | Check_232 | Check_233 | Check_234 | Check_235 | Check_236 | Check_237 | Check_238 | Check_239 | Check_240 | Check_241 | Check_242 | Check_243 | Check_244 | Check_245 | Check_246 | Check_247 | Check_248 | Check_249 | Check_250 | Check_251 | Check_252 | Check_253 | Check_254 | Check_255 | Check_256 | Check_257 | Check_258 | Check_259 | Check_260 | Check_261 | Check_262 | Check_263 | Check_264 | Check_265 | Check_266 | Check_267 | Check_268 | Check_269 | Check_270 | Check_271 | Check_272 | Check_273 | Check_274 | Check_275 | Check_276 | Check_277 | Check_278 | Check_279 | Check_280 | Check_281 | Check_282 | Check_283 | Check_284 | Check_285 | Check_286 | Check_287 | Check_288;
				cnt <= cnt + 1;
			end
			else if (cnt == 8'd17) begin
				if (Check_Sum == 0 || iter == 5'd30) begin
					cnt <= cnt + 1;
					out_valid <= 1;
				end
				else begin
					out_valid <= 0;
					cnt <= 2;
					iter <= iter + 1;
				end
			end
		end
	end
end
assign Bit[0] = V_1[quan_width-1];
assign Bit[1] = V_2[quan_width-1];
assign Bit[2] = V_3[quan_width-1];
assign Bit[3] = V_4[quan_width-1];
assign Bit[4] = V_5[quan_width-1];
assign Bit[5] = V_6[quan_width-1];
assign Bit[6] = V_7[quan_width-1];
assign Bit[7] = V_8[quan_width-1];
assign Bit[8] = V_9[quan_width-1];
assign Bit[9] = V_10[quan_width-1];
assign Bit[10] = V_11[quan_width-1];
……
……
……
assign Bit[1430] = V_1431[quan_width-1];
assign Bit[1431] = V_1432[quan_width-1];
assign Bit[1432] = V_1433[quan_width-1];
assign Bit[1433] = V_1434[quan_width-1];
assign Bit[1434] = V_1435[quan_width-1];
assign Bit[1435] = V_1436[quan_width-1];
assign Bit[1436] = V_1437[quan_width-1];
assign Bit[1437] = V_1438[quan_width-1];
assign Bit[1438] = V_1439[quan_width-1];
assign Bit[1439] = V_1440[quan_width-1];

CNU_19 #(quan_width) CNU1 (	.clk (clk),
	.rst (rst),
	.cnt (cnt),
	.V2C_1 (V2C_5_1),
	.V2C_2 (V2C_89_1),
	.V2C_3 (V2C_109_1),
	.V2C_4 (V2C_170_1),
	.V2C_5 (V2C_232_1),
	.V2C_6 (V2C_275_1),
	.V2C_7 (V2C_375_1),
	.V2C_8 (V2C_429_1),
	.V2C_9 (V2C_526_1),
	.V2C_10 (V2C_762_1),
	.V2C_11 (V2C_810_1),
	.V2C_12 (V2C_858_1),
	.V2C_13 (V2C_899_1),
	.V2C_14 (V2C_940_1),
	.V2C_15 (V2C_974_1),
	.V2C_16 (V2C_1013_1),
	.V2C_17 (V2C_1087_1),
	.V2C_18 (V2C_1146_1),
	.V2C_19 (V2C_1153_1),
	.C2V_1 (C2V_1_5),
	.C2V_2 (C2V_1_89),
	.C2V_3 (C2V_1_109),
	.C2V_4 (C2V_1_170),
	.C2V_5 (C2V_1_232),
	.C2V_6 (C2V_1_275),
	.C2V_7 (C2V_1_375),
	.C2V_8 (C2V_1_429),
	.C2V_9 (C2V_1_526),
	.C2V_10 (C2V_1_762),
	.C2V_11 (C2V_1_810),
	.C2V_12 (C2V_1_858),
	.C2V_13 (C2V_1_899),
	.C2V_14 (C2V_1_940),
	.C2V_15 (C2V_1_974),
	.C2V_16 (C2V_1_1013),
	.C2V_17 (C2V_1_1087),
	.C2V_18 (C2V_1_1146),
	.C2V_19 (C2V_1_1153),
	.init_cnt (8'd2)
);

CNU_20 #(quan_width) CNU2 (	.clk (clk),
	.rst (rst),
	.cnt (cnt),
	.V2C_1 (V2C_14_2),
	.V2C_2 (V2C_63_2),
	.V2C_3 (V2C_119_2),
	.V2C_4 (V2C_167_2),
	.V2C_5 (V2C_196_2),
	.V2C_6 (V2C_265_2),
	.V2C_7 (V2C_316_2),
	.V2C_8 (V2C_423_2),
	.V2C_9 (V2C_512_2),
	.V2C_10 (V2C_672_2),
	.V2C_11 (V2C_685_2),
	.V2C_12 (V2C_853_2),
	.V2C_13 (V2C_895_2),
	.V2C_14 (V2C_958_2),
	.V2C_15 (V2C_989_2),
	.V2C_16 (V2C_1021_2),
	.V2C_17 (V2C_1088_2),
	.V2C_18 (V2C_1119_2),
	.V2C_19 (V2C_1153_2),
	.V2C_20 (V2C_1154_2),
	.C2V_1 (C2V_2_14),
	.C2V_2 (C2V_2_63),
	.C2V_3 (C2V_2_119),
	.C2V_4 (C2V_2_167),
	.C2V_5 (C2V_2_196),
	.C2V_6 (C2V_2_265),
	.C2V_7 (C2V_2_316),
	.C2V_8 (C2V_2_423),
	.C2V_9 (C2V_2_512),
	.C2V_10 (C2V_2_672),
	.C2V_11 (C2V_2_685),
	.C2V_12 (C2V_2_853),
	.C2V_13 (C2V_2_895),
	.C2V_14 (C2V_2_958),
	.C2V_15 (C2V_2_989),
	.C2V_16 (C2V_2_1021),
	.C2V_17 (C2V_2_1088),
	.C2V_18 (C2V_2_1119),
	.C2V_19 (C2V_2_1153),
	.C2V_20 (C2V_2_1154),
	.init_cnt (8'd2)
);
……
……
……
CNU_20 #(quan_width) CNU288 (	.clk (clk),
	.rst (rst),
	.cnt (cnt),
	.V2C_1 (V2C_29_288),
	.V2C_2 (V2C_53_288),
	.V2C_3 (V2C_141_288),
	.V2C_4 (V2C_161_288),
	.V2C_5 (V2C_195_288),
	.V2C_6 (V2C_274_288),
	.V2C_7 (V2C_327_288),
	.V2C_8 (V2C_479_288),
	.V2C_9 (V2C_576_288),
	.V2C_10 (V2C_609_288),
	.V2C_11 (V2C_813_288),
	.V2C_12 (V2C_841_288),
	.V2C_13 (V2C_874_288),
	.V2C_14 (V2C_936_288),
	.V2C_15 (V2C_971_288),
	.V2C_16 (V2C_1038_288),
	.V2C_17 (V2C_1102_288),
	.V2C_18 (V2C_1152_288),
	.V2C_19 (V2C_1439_288),
	.V2C_20 (V2C_1440_288),
	.C2V_1 (C2V_288_29),
	.C2V_2 (C2V_288_53),
	.C2V_3 (C2V_288_141),
	.C2V_4 (C2V_288_161),
	.C2V_5 (C2V_288_195),
	.C2V_6 (C2V_288_274),
	.C2V_7 (C2V_288_327),
	.C2V_8 (C2V_288_479),
	.C2V_9 (C2V_288_576),
	.C2V_10 (C2V_288_609),
	.C2V_11 (C2V_288_813),
	.C2V_12 (C2V_288_841),
	.C2V_13 (C2V_288_874),
	.C2V_14 (C2V_288_936),
	.C2V_15 (C2V_288_971),
	.C2V_16 (C2V_288_1038),
	.C2V_17 (C2V_288_1102),
	.C2V_18 (C2V_288_1152),
	.C2V_19 (C2V_288_1439),
	.C2V_20 (C2V_288_1440),
	.init_cnt (8'd2)
);

VNU_6 #(quan_width) VNU1 (
	.clk (clk),
	.rst (rst),
	.cnt (cnt),
	.init_cnt (8'd11),
	.C2V_1 (C2V_17_1),
	.C2V_2 (C2V_120_1),
	.C2V_3 (C2V_130_1),
	.C2V_4 (C2V_212_1),
	.C2V_5 (C2V_243_1),
	.C2V_6 (C2V_265_1),
	.L (L[14:0]),
	.V2C_1 (V2C_1_17),
	.V2C_2 (V2C_1_120),
	.V2C_3 (V2C_1_130),
	.V2C_4 (V2C_1_212),
	.V2C_5 (V2C_1_243),
	.V2C_6 (V2C_1_265),
	.V (V_1)
);

VNU_6 #(quan_width) VNU2 (
	.clk (clk),
	.rst (rst),
	.cnt (cnt),
	.init_cnt (8'd11),
	.C2V_1 (C2V_23_2),
	.C2V_2 (C2V_126_2),
	.C2V_3 (C2V_136_2),
	.C2V_4 (C2V_218_2),
	.C2V_5 (C2V_249_2),
	.C2V_6 (C2V_271_2),
	.L (L[29:15]),
	.V2C_1 (V2C_2_23),
	.V2C_2 (V2C_2_126),
	.V2C_3 (V2C_2_136),
	.V2C_4 (V2C_2_218),
	.V2C_5 (V2C_2_249),
	.V2C_6 (V2C_2_271),
	.V (V_2)
);
……
……
……
VNU_2 #(quan_width) VNU1439 (
	.clk (clk),
	.rst (rst),
	.cnt (cnt),
	.init_cnt (8'd11),
	.C2V_1 (C2V_287_1439),
	.C2V_2 (C2V_288_1439),
	.L (L[21584:21570]),
	.V2C_1 (V2C_1439_287),
	.V2C_2 (V2C_1439_288),
	.V (V_1439)
);

VNU_1 #(quan_width) VNU1440 (
	.clk (clk),
	.rst (rst),
	.cnt (cnt),
	.init_cnt (8'd11),
	.C2V_1 (C2V_288_1440),
	.L (L[21599:21585]),
	.V2C_1 (V2C_1440_288),
	.V (V_1440)
);
endmodule




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

assign_C2V #(quan_width) assign_C2V_L5_0 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_1, final_sign_1, C2V_1);
assign_C2V #(quan_width) assign_C2V_L5_1 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_2, final_sign_2, C2V_2);
assign_C2V #(quan_width) assign_C2V_L5_2 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_3, final_sign_3, C2V_3);
assign_C2V #(quan_width) assign_C2V_L5_3 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_4, final_sign_4, C2V_4);
assign_C2V #(quan_width) assign_C2V_L5_4 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_5, final_sign_5, C2V_5);
assign_C2V #(quan_width) assign_C2V_L5_5 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_6, final_sign_6, C2V_6);
assign_C2V #(quan_width) assign_C2V_L5_6 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_7, final_sign_7, C2V_7);
assign_C2V #(quan_width) assign_C2V_L5_7 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_8, final_sign_8, C2V_8);
assign_C2V #(quan_width) assign_C2V_L5_8 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_9, final_sign_9, C2V_9);
assign_C2V #(quan_width) assign_C2V_L5_9 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_10, final_sign_10, C2V_10);
assign_C2V #(quan_width) assign_C2V_L5_10 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_11, final_sign_11, C2V_11);
assign_C2V #(quan_width) assign_C2V_L5_11 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_12, final_sign_12, C2V_12);
assign_C2V #(quan_width) assign_C2V_L5_12 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_13, final_sign_13, C2V_13);
assign_C2V #(quan_width) assign_C2V_L5_13 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_14, final_sign_14, C2V_14);
assign_C2V #(quan_width) assign_C2V_L5_14 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_15, final_sign_15, C2V_15);
assign_C2V #(quan_width) assign_C2V_L5_15 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_16, final_sign_16, C2V_16);
assign_C2V #(quan_width) assign_C2V_L5_16 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_17, final_sign_17, C2V_17);
assign_C2V #(quan_width) assign_C2V_L5_17 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_18, final_sign_18, C2V_18);
assign_C2V #(quan_width) assign_C2V_L5_18 (clk, rst, cnt, init_cnt + 6, cache[52], cache[53], V2C_19, final_sign_19, C2V_19);

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
in4out2 #(quan_width) in4out2_L4_18 (clk, rst, cnt, init_cnt + 5, cache[53], cache[54], cache[55], cache[56], cache[57], cache[58]);

assign_C2V #(quan_width) assign_C2V_L5_0 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_1, final_sign_1, C2V_1);
assign_C2V #(quan_width) assign_C2V_L5_1 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_2, final_sign_2, C2V_2);
assign_C2V #(quan_width) assign_C2V_L5_2 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_3, final_sign_3, C2V_3);
assign_C2V #(quan_width) assign_C2V_L5_3 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_4, final_sign_4, C2V_4);
assign_C2V #(quan_width) assign_C2V_L5_4 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_5, final_sign_5, C2V_5);
assign_C2V #(quan_width) assign_C2V_L5_5 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_6, final_sign_6, C2V_6);
assign_C2V #(quan_width) assign_C2V_L5_6 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_7, final_sign_7, C2V_7);
assign_C2V #(quan_width) assign_C2V_L5_7 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_8, final_sign_8, C2V_8);
assign_C2V #(quan_width) assign_C2V_L5_8 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_9, final_sign_9, C2V_9);
assign_C2V #(quan_width) assign_C2V_L5_9 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_10, final_sign_10, C2V_10);
assign_C2V #(quan_width) assign_C2V_L5_10 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_11, final_sign_11, C2V_11);
assign_C2V #(quan_width) assign_C2V_L5_11 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_12, final_sign_12, C2V_12);
assign_C2V #(quan_width) assign_C2V_L5_12 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_13, final_sign_13, C2V_13);
assign_C2V #(quan_width) assign_C2V_L5_13 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_14, final_sign_14, C2V_14);
assign_C2V #(quan_width) assign_C2V_L5_14 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_15, final_sign_15, C2V_15);
assign_C2V #(quan_width) assign_C2V_L5_15 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_16, final_sign_16, C2V_16);
assign_C2V #(quan_width) assign_C2V_L5_16 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_17, final_sign_17, C2V_17);
assign_C2V #(quan_width) assign_C2V_L5_17 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_18, final_sign_18, C2V_18);
assign_C2V #(quan_width) assign_C2V_L5_18 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_19, final_sign_19, C2V_19);
assign_C2V #(quan_width) assign_C2V_L5_19 (clk, rst, cnt, init_cnt + 6, cache[57], cache[58], V2C_20, final_sign_20, C2V_20);
endmodule



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
