`timescale 1ns/1ps
module TestBench();
  parameter n = 8;
  parameter t = 20;
  reg EN_tb, READ_WRITE_tb, RESET_tb, CLK_tb;
  reg [(n-1):0] INOUT_tb;
  wire EMPTY_tb, FULL_tb;
  wire [(n-1):0] OUT_tb;

  integer i;
  initial begin
    RESET_tb = 1;
    EN_tb = 1;
    READ_WRITE_tb = 1;
    CLK_tb = 0;
    INOUT_tb = 8'd0;

    #t RESET_tb = 0;
    for(i = 0; i < 1023; i = i + 1) begin
	#t INOUT_tb <= INOUT_tb + 8'd1; RESET_tb = 0;
    end
    #t READ_WRITE_tb = 0;
    #(t*10) READ_WRITE_tb = 1;
    for(i = 0; i < 9; i = i + 1)
	#t INOUT_tb <= INOUT_tb + 8'd1;
    #t READ_WRITE_tb = 0;
    #(t*10) $finish;
  end  

  initial begin
    $monitor("Time=%d, Read/Write=%b, DataIn=%d, DataOut=%d, Full=%b, Empty=%b", $time, READ_WRITE_tb, INOUT_tb, OUT_tb, FULL_tb, EMPTY_tb);
  end

  always @ (CLK_tb)
  #(t/2) CLK_tb <= ~CLK_tb;

  assign OUT_tb = (EN_tb & READ_WRITE_tb) ? INOUT_tb : 8'bzzzzzzzz;

  FIFO DUT(.INOUT(OUT_tb), .EMPTY(EMPTY_tb), .FULL(FULL_tb), .EN(EN_tb), .READ_WRITE(READ_WRITE_tb), .RESET(RESET_tb), .CLK(CLK_tb));

endmodule