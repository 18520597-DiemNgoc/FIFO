module FIFO(INOUT, EMPTY, FULL, EN, READ_WRITE, RESET, CLK);
	parameter n = 8;
	input EN, READ_WRITE, RESET, CLK;
	output EMPTY, FULL;
	inout [(n - 1):0] INOUT;

	wire En_Font, En_Back, x_MSB, y_MSB, equal, temp;
	wire [9:0] out_Font, out_Back, OUT_MUX;
	
	and(En_Font, ~READ_WRITE, EN),
	   (En_Back, READ_WRITE, EN);
	
	Counter Front(.Q(out_Font), .Out_MSB(x_MSB), .E(En_Font), .Reset(RESET), .clk(CLK));
	Counter Back(.Q(out_Back), .Out_MSB(y_MSB), .E(En_Back), .Reset(RESET), .clk(CLK));
	
	MUX2to1_nbit MUX(.Y(OUT_MUX), .I0(out_Back), .I1(out_Font), .Sel(En_Font)); 

	RAM RAM(.INOUT(INOUT), .IN_DEC(OUT_MUX), .EN(1'b1), .RWS(En_Back), .CS(EN), .clk(~CLK)); 
	
	Compare_nbit compare(.Out(equal), .I0(out_Font), .I1(out_Back)); 

	xor(temp, x_MSB, y_MSB);
	and(EMPTY, ~temp, equal),
	   (FULL, temp, equal);

endmodule
