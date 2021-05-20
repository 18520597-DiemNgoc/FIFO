module MUX2to1_nbit(Y, I0, I1, Sel);
	parameter n = 10;
	input [(n - 1):0] I0, I1;
	input Sel;
	output[(n - 1):0] Y;

	MUX2to1 MUX[(n- 1):0](.Y(Y), .A(I0), .B(I1), .Sel(Sel));

endmodule

/********Mux2to1 1 bit***********/
module MUX2to1(Y, A, B, Sel);
	input A, B, Sel;
	output Y;
	
	wire t1, t2;
	
	and(t1, A, ~Sel),
	   (t2, B, Sel);
	or(Y, t1, t2);
	
endmodule
	
	


