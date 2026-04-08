`timescale 1ns/1ps
module tb;
   reg A, B, clk;
   wire Y;

  OR  uut X( A.(A), B.(B), Y.(Y));

initial clk=0;
always #5  clk= ~CLK;

initial begin
#10
  A= 0; B=0;
#10 
  A=1; B=0;
#10
  A=0; B=1;
#10
  A=1; B=1;
end
endmodule
