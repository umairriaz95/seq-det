/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP2
// Date      : Sun Oct  9 16:00:07 2022
/////////////////////////////////////////////////////////////


module prac ( clk, rst_n, in, out );
  input clk, rst_n, in;
  output out;
  wire   N9, N10, N11, N22, n7, n8, n9, n10, n11, n12;
  assign N22 = in;

  FD1 \curr_st_reg[0]  ( .D(N9), .CP(clk), .QN(n12) );
  FD1 \curr_st_reg[1]  ( .D(N10), .CP(clk), .QN(n11) );
  FD1 out_reg ( .D(N11), .CP(clk), .Q(out) );
  IV U12 ( .A(n7), .Z(N9) );
  NR3 U13 ( .A(n7), .B(n11), .C(n12), .Z(N11) );
  MUX21L U14 ( .A(n8), .B(n9), .S(n12), .Z(N10) );
  OR2 U15 ( .A(n7), .B(n11), .Z(n9) );
  ND2 U16 ( .A(rst_n), .B(N22), .Z(n7) );
  ND2 U17 ( .A(rst_n), .B(n10), .Z(n8) );
  IV U18 ( .A(N22), .Z(n10) );
endmodule

