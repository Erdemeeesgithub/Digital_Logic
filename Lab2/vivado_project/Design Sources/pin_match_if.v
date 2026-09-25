`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 11:41:49 AM
// Design Name: 
// Module Name: pin_match_if
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


module pin_match_if(
    input [7:0] user_in, output reg door_unlock
    );
always @(*) begin
    if (user_in == 8'h8d || user_in == 8'h74 || user_in == 8'h34) door_unlock = 1'b1;
    else door_unlock = 1'b0;
end
endmodule
