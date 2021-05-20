module D_FF(Q, Din, reset, clk);
	input Din, reset, clk;
	output Q;

	wire d1,d2,d3,d4, Qn;

	nand(d1, d4, d2),
	    (d2, d1, clk, ~reset),
	    (d3, d2, clk, d4),
	    (d4, d3, Din, ~reset),
	    (Q, d2, Qn),
	    (Qn, Q, d3, ~reset);
	
endmodule

