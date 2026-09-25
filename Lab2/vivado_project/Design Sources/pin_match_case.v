`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 11:42:44 AM
// Design Name: 
// Module Name: pin_match_case
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


module pin_match_case(
    input [7:0] user_in, output reg door_unlock
    );
always @(*) begin
    case(user_in)
        8'h8d, 8'h74, 8'h34: door_unlock = 1'b1;
        default : door_unlock = 1'b0;
        endcase
end
endmodule
