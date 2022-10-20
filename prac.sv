`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Umair Riaz
//
// Create Date: 10/08/2022 10:35:18 PM
// Design Name:
// Module Name: prac
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

// Module to detect sequence 1011

module prac(
  input  logic clk,
  input  logic rst_n,
  input  logic in,
  output logic out
    );

//  Detecting 1 0 1 1
  logic out_next;
  enum logic [2:0] {IDLE, s0, s1, s2, s3} curr_st, next_st;

  always_ff@(posedge clk) begin : state_transition
    if (!rst_n) begin
      curr_st <= IDLE;
      out <= 1'b0;
    end else begin
      curr_st <= next_st;
      out <= out_next;
    end
  end

  always_comb begin: next_state_logic
    out_next = out;
    next_st = curr_st;
    case(curr_st)
      IDLE: begin
        if(in) begin
          out_next = 1'b0;
          next_st = s0;
        end else begin
          out_next = 1'b0;
          next_st = IDLE;
        end
      end

      s0: begin
        if(!in) begin
          out_next = 1'b0;
          next_st = s1;
        end else begin
          out_next = 1'b0;
          next_st = s0;
        end
      end

      s1:begin
        if (in) begin
          out_next = 1'b0;
          next_st = s2;
        end else begin
          out_next = 1'b0;
          next_st = IDLE;
        end
      end

      s2: begin
        if (in) begin
          out_next = 1'b1;
          next_st = s0; // to handle overlapping sequence
        end else begin
          out_next = 1'b0;
          next_st = s1;
        end
      end
      default : begin
        out_next = 1'b0;
        next_st = IDLE;
      end
    endcase
  end : next_state_logic

endmodule
