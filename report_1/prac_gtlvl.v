/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP2
// Date      : Sun Oct  9 16:39:19 2022
/////////////////////////////////////////////////////////////


module prac ( clk, rst_n, in, out );
  input clk, rst_n, in;
  output out;
  wire   N9, N10, N11, N22, n3, n4, n5, n6, n7;
  wire   [2:0] curr_st;
  assign N22 = in;

  FD1 \curr_st_reg[0]  ( .D(N9), .CP(clk), .Q(curr_st[0]) );
  FD1 \curr_st_reg[1]  ( .D(N10), .CP(clk), .Q(curr_st[1]), .QN(n7) );
  FD1 out_reg ( .D(N11), .CP(clk), .Q(out) );
  OR3 U11 ( .A(n4), .B(curr_st[0]), .C(n7), .Z(n6) );
  NR2 U12 ( .A(n4), .B(n3), .Z(N9) );
  IVP U13 ( .A(rst_n), .Z(n3) );
  IVP U14 ( .A(N22), .Z(n4) );
  AO4 U15 ( .A(n5), .B(n3), .C(n6), .D(n3), .Z(N10) );
  ND2 U16 ( .A(curr_st[0]), .B(n4), .Z(n5) );
  AN3 U17 ( .A(curr_st[0]), .B(N9), .C(curr_st[1]), .Z(N11) );
endmodule

