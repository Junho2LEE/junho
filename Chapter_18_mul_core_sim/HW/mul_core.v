//////////////////////////////////////////////////////////////////////////////////
// Company: Personal
// Engineer: Matbi / Austin
//
// Create Date: 2021.01.31
// Design Name: 
// Module Name: mul_core_8b
// Project Name:
// Target Devices:
// Tool Versions:
// Description: To study ctrl sram. (WRITE / READ)
//				FSM + mem I/F
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
 
`timescale 1ns / 1ps
module mul_core
// Param
#(
	parameter IN_DATA_WITDH = 8
)

(
    input 								clk,
    input 								reset_n,
	input 								i_valid,
	input 	[IN_DATA_WITDH-1:0]			i_a,
	input 	[IN_DATA_WITDH-1:0]			i_b,
	output  							o_valid,
	output  [(2*IN_DATA_WITDH)-1:0]		o_result
);

// 1 cycle delay
reg 							r_valid;
reg 	[(2*IN_DATA_WITDH)-1:0] r_result;
wire  	[(2*IN_DATA_WITDH)-1:0] w_result;

always @(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
        r_valid <= 1'b0;  
    end else begin
		r_valid <= i_valid;
	end
end

always @(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
        r_result <= {(2*IN_DATA_WITDH){1'b0}};  
    end else begin
		r_result <= w_result;
	end
end

assign o_valid 	= r_valid;
assign w_result = i_a * i_b;
assign o_result = r_result;

endmodule
