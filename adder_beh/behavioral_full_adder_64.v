`timescale 1ns / 1ps



module behavioral_full_adder_64
(
  input [63:0] A,
  input [63:0] B,
  output [64:0] SUM
);

  assign SUM = (A + B);
endmodule
