module Compare_nbit(Out, I0, I1);
	parameter n = 10;
	input [(n - 1):0] I0, I1;
	output Out;

	wire [(n - 1):0] In;

	Compare_1bit INST[n:1](.Out(In[(n - 1):0]), .I0(I0[(n - 1):0]), .I1(I1[(n - 1):0]));
	and and1(Out, In[0], In[1], In[2], In[3], In[4], In[5], In[6], In[7], In[8], In[9]);

endmodule

module Compare_1bit(Out, I0, I1);
	input I0, I1;
	output Out;
	
	xnor(Out, I0, I1);

endmodule
