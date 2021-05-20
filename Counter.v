module Counter(Q, Out_MSB, E, Reset, clk);
	input clk, E, clk, Reset;
	output Out_MSB;
	output [9:0] Q;

	wire [10:0] x, y;
	
	HAS HAS[11:1](.D_out(x[10:0]), .C_out(y[10:0]), .Cin({y[9:0], E}), .Qin({Out_MSB, Q[9:0]}));
	D_FF D[11:1](.Q({Out_MSB, Q[9:0]}), .Din(x[10:0]), .reset(Reset), .clk(clk));

endmodule

/***********HAS***********/
module HAS(D_out, C_out, Cin, Qin);
	input Cin, Qin;
	output D_out, C_out;
	
	and (C_out, Cin, Qin);
	xor (D_out, Cin, Qin);
endmodule
