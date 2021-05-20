module RAM(INOUT, IN_DEC, EN, RWS, CS, clk);
	input [9:0] IN_DEC; // Address of Decoder
	input EN, RWS, CS, clk; // EN is select sign of decoder
	inout [7:0] INOUT;
	wire [1023:0] OUT_DEC; // output of decoder 10 to 1024
	wire t1,t2; // t1 is write enable, t2 is read enable
	wire [3:0] E; // output of decoder 2 to 4
	wire [7:0] Out_Word;
	
	//Decoder 10 to 1024
	Decoder2to4 Dec_Control(.Out_De0(E[0]), .Out_De1(E[1]), .Out_De2(E[2]), .Out_De3(E[3]), .I0(IN_DEC[8]), .I1(IN_DEC[9]), .En(EN));
	Decoder8to256 Dec [3:0] (.Out8_Dec(OUT_DEC), .In8_Dec(IN_DEC[7:0]), .EN(E));
	
	// read and write select, {RWS = 0 read = 1}; {RWS = 1 write = 1}
	and(t1, RWS, CS, clk),
	   (t2, ~RWS, CS);

	// connect all word to create a ram
	WORD W[1023:0](.OUT_Word(Out_Word), .IN_Word(INOUT), .WriteEn(t1), .Row(OUT_DEC));
	bufif1 result[7:0](INOUT, Out_Word, t2);
	
endmodule
	
/************Decoder 2 to 4*****************/
module Decoder2to4(Out_De0, Out_De1, Out_De2, Out_De3, I0, I1, En); // I1 MSB, I0 LSB
	input I0, I1, En;
	output Out_De0, Out_De1, Out_De2, Out_De3;
	
	and(Out_De0, ~I0, ~I1, En),
		(Out_De1, I0, ~I1, En),
		(Out_De2, ~I0, I1, En),
		(Out_De3, I0, I1, En);

endmodule

/************Decoder 8 to 256*****************/	
module Decoder8to256(Out8_Dec, In8_Dec, EN);
	input [7:0] In8_Dec;
	input EN;
	output [255:0] Out8_Dec;
	wire [15:0] E;
	// 8x256 decoder using 16 (4x16) decoders
	Decoder4to16 Dec[15:0](.Out4_Dec(Out8_Dec), .In4_Dec(In8_Dec[3:0]), .EN(E[15:0]));
	Decoder4to16 Dec16(.Out4_Dec(E[15:0]), .In4_Dec(In8_Dec[7:4]), .EN(EN));
	
endmodule

/************WORD*****************/
module WORD(OUT_Word, IN_Word, WriteEn, Row);
	input Row, WriteEn;
	input [7:0] IN_Word;
	output [7:0] OUT_Word;
	
	MC memoryCel[7:0](.Out_MC(OUT_Word[7:0]), .In_MC(IN_Word[7:0]), .RowSel(Row), .WrEn(WriteEn));

endmodule

/************Decoder 4 to 16*****************/
module Decoder4to16(Out4_Dec, In4_Dec, EN);
	input [3:0] In4_Dec;
	input EN;
	output [15:0] Out4_Dec;
	wire dec0, dec1;
	
	and(dec0, ~In4_Dec[3], EN),
		(dec1, In4_Dec[3], EN);
	Decoder3to8 Dec0(.Out3_Dec(Out4_Dec[7:0]), .In3_Dec(In4_Dec[2:0]), .EN(dec0));
	Decoder3to8 Dec1(.Out3_Dec(Out4_Dec[15:8]), .In3_Dec(In4_Dec[2:0]), .EN(dec1));

endmodule

/************Decoder 3 to 8*****************/
module Decoder3to8(Out3_Dec, In3_Dec, EN);
	input EN;
	input [2:0] In3_Dec;
	output [7:0] Out3_Dec;
	wire dec0, dec1;
	
	and(dec0, ~In3_Dec[2], EN),
		(dec1, In3_Dec[2], EN);
		
	Decoder2to4 Dec0(.Out_De0(Out3_Dec[0]), .Out_De1(Out3_Dec[1]), .Out_De2(Out3_Dec[2]), .Out_De3(Out3_Dec[3]), .I0(In3_Dec[0]), .I1(In3_Dec[1]), .En(dec0));
	Decoder2to4 Dec1(.Out_De0(Out3_Dec[4]), .Out_De1(Out3_Dec[5]), .Out_De2(Out3_Dec[6]), .Out_De3(Out3_Dec[7]), .I0(In3_Dec[0]), .I1(In3_Dec[1]), .En(dec1));

endmodule

/************Memory Cell*****************/
module MC(Out_MC, In_MC, RowSel, WrEn);
	input In_MC, RowSel, WrEn;
	output Out_MC;
	wire Q;
	
	D_latch memoryCell(.Q_latch(Q), .Qn_latch(), .Din_latch(In_MC), .clk_d(RowSel & WrEn));
	bufif1 f1(Out_MC, Q, RowSel);

endmodule

/************D_latch*****************/
module D_latch(Q_latch,Qn_latch, Din_latch, clk_d);
	input Din_latch, clk_d;
	output Q_latch, Qn_latch;
	wire d1,d2,d3,d4;
	
	and(d1, Din_latch, clk_d),
		(d3, d2, clk_d);
	not(d2, Din_latch);
	
	or (Q_latch, d1, ~Qn_latch),
	   (Qn_latch, d3, ~Q_latch);

endmodule



