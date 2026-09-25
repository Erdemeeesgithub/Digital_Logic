`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 01:28:20 PM
// Design Name: 
// Module Name: mux4
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


module mux4 #(parameter WIDTH = 8) (
    input [WIDTH-1:0] d0,d1,d2,d3,
    input [1:0]       sel,
    output [WIDTH-1:0]y
 );
  wire [WIDTH-1:0] m0, m1;
  
  mux2 #(.WIDTH(WIDTH)) u0 (.a(d0), .b(d1), .s(sel[0]), .y(m0));
  mux2 #(.WIDTH(WIDTH)) u1 (.a(d2), .b(d3), .s(sel[0]), .y(m1));
  mux2 #(.WIDTH(WIDTH)) u2 (.a(m0), .b(m1), .s(sel[1]), .y(y));
endmodule
