
`timescale 1ns / 1ps
module fully_connected_core
// Param
#(
	parameter IN_DATA_WITDH = 16
)

(
    input 								clk,
    input 								reset_n, 
	input								i_run, 
	input 								i_valid, 
	input 	[IN_DATA_WITDH-1:0]			 i_node, 
	input 	[IN_DARA_WITDH-1:0]			 i_wegt, 
    input 	[IN_DATA_WITDH-1:0]			 i_bias,
	output  							o_valid, 
	output  [(4*IN_DATA_WITDH)-1:0]		 o_result 
);

// 1 cycle delay
reg 							r_valid;
reg 	[(4*IN_DATA_WITDH)-1:0] r_result; 
wire  	[(2*IN_DATA_WITDH)-1:0] w_result;

always @(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
        r_valid <= 1'b0;  
    end else if (i_run) begin
        r_valid <= 1'b0;  
    end else begin
		r_valid <= i_valid;
	end
end

always @(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
        $signed(r_result) <= {(4*IN_DATA_WITDH){1'b0}};  
    end else if (i_run) begin
        $signed(r_result) <= {(4*IN_DATA_WITDH){1'b0}};  
    end else if (i_valid) begin  // valid == enable.
		$signed(r_result) <= $signed(r_result) + $signed(w_result); // accum
	end
end


assign o_valid 	= r_valid;
assign w_result = (i_node * i_wegt) + i_bias
assign o_result = r_result;

endmodule



