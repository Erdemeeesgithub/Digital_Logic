`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 11:41:22 AM
// Design Name: 
// Module Name: pin_match_cond
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


module pin_match_cond(
    input [7:0] user_in, output door_unlock
    );
    assign door_unlock = (user_in==8'h8d || user_in==8'h74 || user_in==8'h34)? 1'b1 : 1'b0;                                                  
endmodule
