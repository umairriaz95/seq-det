`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Umair Riaz
//
// Create Date: 10/08/2022 11:37:27 PM
// Design Name:
// Module Name: tb
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module tb();
  reg clk, in, rst_n;
  wire out;
  reg [1:0] l_dly;
  // ------

  reg tb_in;
  integer loop = 100000000;

  always #10 clk = ~clk;

  prac u0 ( .clk(clk), .rst_n(rst_n), .in(in), .out(out));
  initial begin
  clk <= 0;
  rst_n <= 0;
  in <= 0;
  repeat (5) @ (posedge clk);
  rst_n <= 1;

 // -----------------
 // Generate a directed pattern
 @(posedge clk) in <= 0;
 @(posedge clk) in <= 0;
 @(posedge clk) in <= 0;
 @(posedge clk) in <= 0;
 @(posedge clk) in <= 0;
 @(posedge clk) in <= 0;
 @(posedge clk) in <= 0;

 @(posedge clk) in <= 1;
 @(posedge clk) in <= 0;
 @(posedge clk) in <= 1;
 @(posedge clk) in <= 1;
 @(posedge clk) in <= 0;
 @(posedge clk) in <= 0;
 @(posedge clk) in <= 1;
 @(posedge clk) in <= 1;
 @(posedge clk) in <= 0;
 @(posedge clk) in <= 1;
 @(posedge clk) in <= 1;

 // Or random stimulus using a for loop
 // value of input N times
 for (int i = 0 ; i < loop; i ++) begin
 l_dly = $random;
 repeat (l_dly) @ (posedge clk)
 tb_in = $random;
 in = tb_in;
 end

 // Wait for sometime before quitti
 #100 $finish;
 end

endmodule
