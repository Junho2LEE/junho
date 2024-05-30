//////////////////////////////////////////////////////////////////////////////////
// Company: Personal
// Engineer: Matbi / Austin
//
// Create Date:
// Design Name: 
// Module Name: tb_data_mover_bram
// Project Name:
// Target Devices:
// Tool Versions:
// Description: Verifify module data_mover_bram
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

`define CNT_BIT 31
`define ADDR_WIDTH 12
`define DATA_WIDTH 32
`define MEM_DEPTH 4096
`define IN_DATA_WITDH 16
`define NUM_CORE 2


module tb_data_mover_bram;
reg clk , reset_n;
reg 					i_run;
reg  [`CNT_BIT-1:0]	i_num_cnt;
wire 					o_idle;
wire 					o_write;
wire 					o_read;
wire 					o_done;
 
// Memory I/F
wire [`ADDR_WIDTH-1:0] 	addr0_b0;
wire  					ce0_b0;
wire  					we0_b0;
wire [`DATA_WIDTH-1:0]  q0_b0;
wire [`DATA_WIDTH-1:0] 	d0_b0;

wire [`ADDR_WIDTH-1:0] 	addr0_b1;
wire  					ce0_b1;
wire  					we0_b1;
wire [`DATA_WIDTH-1:0]  q0_b1;
wire [`DATA_WIDTH-1:0] 	d0_b1;

wire [`ADDR_WIDTH-1:0] 	addr0_b2;
wire  					ce0_b2;
wire  					we0_b2;
wire [`DATA_WIDTH-1:0]  q0_b2;
wire [`DATA_WIDTH-1:0] 	d0_b2;

// Write BRAM 0
reg [`ADDR_WIDTH-1:0] 	addr1_b0;
reg  					ce1_b0	;
reg  					we1_b0	;
wire [`DATA_WIDTH-1:0]  q1_b0	;
reg [`DATA_WIDTH-1:0] 	d1_b0	;

reg [`IN_DATA_WITDH-1:0]  a_0;
reg [`IN_DATA_WITDH-1:0]  a_1;


// Read BRAM 1
reg [`ADDR_WIDTH-1:0] 	addr1_b1;
reg  					ce1_b1	;
reg  					we1_b1	;
wire [`DATA_WIDTH-1:0]  q1_b1	;
reg [`DATA_WIDTH-1:0] 	d1_b1	;

reg [`ADDR_WIDTH-1:0] 	addr1_b2;
reg  					ce1_b2	;
reg  					we1_b2	;
wire [`DATA_WIDTH-1:0]  q1_b2	;
reg [`DATA_WIDTH-1:0] 	d1_b2	;


wire [`DATA_WIDTH-1:0]  result_0;
wire [`DATA_WIDTH-1:0]  result_1;

// clk gen
always
    #5 clk = ~clk;

integer i,f_in_node, f_in_wegt, f_in_bias, f_ot, status;

initial
  begin
    f_in_node = $fopen("./golden_refc/ref_c_rand_input_node.txt","rb");
    f_in_wegt = $fopen("./golden_refc/ref_c_rand_input_wegt.txt","rb");
	f_in_bias = $fopen("./golden_refc/ref_c_rand_input_bias.txt","rb");
    f_ot = $fopen("rtl_v_result.txt","wb");
  end

initial begin
//initialize value
$display("initialize value [%0d]", $time);
    reset_n <= 1;
    clk     <= 0;
	i_run 	<= 0;
	i_num_cnt <= `MEM_DEPTH; // initial value
	addr1_b0 <= 0;
	ce1_b0	 <= 0;
	we1_b0	 <= 0;
	d1_b0	 <= 0;
	addr1_b1 <= 0;
	ce1_b1	 <= 0;
	we1_b1	 <= 0;
	d1_b1	 <= 0;
	addr1_b2 <= 0;
	ce1_b2	 <= 0;
	we1_b2	 <= 0;
	d1_b2	 <= 0;
// reset_n gen
$display("Reset! [%0d]", $time);
# 100
    reset_n <= 0;
# 10
    reset_n <= 1;
# 10
@(posedge clk);

$display("Step 1. Mem write to Bram0 [%0d]", $time);
for(i = 0; i < i_num_cnt; i = i + 1) begin
	status = $fscanf(f_in_node,"%d %d %d %d \n", a_0, a_1);
	u_TDPBRAM_0.ram[i] = {a_0, a_1};
	status = $fscanf(f_in_wegt,"%d %d %d %d \n", a_0, a_1);
	u_TDPBRAM_1.ram[i] = {a_0, a_1};
	status = $fscanf(f_in_bias,"%d %d %d %d \n", a_0, a_1);
	u_TDPBRAM_2.ram[i] = {a_0, a_1};
end

$display("Step 2. Check Idle [%0d]", $time);
wait(o_idle);

$display("Step 3. Start! data_mover_bram [%0d]", $time);
	i_run <= 1;
@(posedge clk);
	i_run <= 0;

$display("Step 4. Wait Done [%0d]", $time);
wait(o_done);

$display("Step 5. read result [%0d]", $time);
// TODO Check to compare result
$fwrite(f_ot,"%0d %0d %0d %0d ", result_0, result_1);

$fclose(f_in_node);
$fclose(f_in_wegt);
$fclose(f_in_bias);
$fclose(f_ot);
# 100
$display("Success Simulation!! (Matbi = gudok & joayo) [%0d]", $time);
$finish;
end

// Call DUT
data_mover_bram 
#(	
	.CNT_BIT  (`CNT_BIT),
	.DWIDTH   (`DATA_WIDTH), 
	.AWIDTH   (`ADDR_WIDTH), 
	.MEM_SIZE (`MEM_DEPTH),
	.IN_DATA_WITDH (`IN_DATA_WITDH))
u_data_mover_bram (
    .clk			(clk		),
    .reset_n		(reset_n	),
	.i_run			(i_run		),
	.i_num_cnt		(i_num_cnt	),
	.o_idle			(o_idle		),
	.o_read			(o_read		),
	.o_write		(o_write	),
	.o_done			(o_done		),
                            	
	.addr_b0		(addr0_b0	),
	.ce_b0			(ce0_b0		),
	.we_b0			(we0_b0		),
	.q_b0			(q0_b0		),
	.d_b0			(d0_b0		),
                            	
	.addr_b1		(addr0_b1	),
	.ce_b1			(ce0_b1		),
	.we_b1			(we0_b1		),
	.q_b1			(q0_b1		),
	.d_b1			(d0_b1		),

	.addr_b2		(addr0_b2	),
	.ce_b2			(ce0_b2		),
	.we_b2			(we0_b2		),
	.q_b2			(q0_b2		),
	.d_b2			(d0_b2		),
// (lab21) result
  	.result_0		(result_0	),
	.result_1		(result_1	),
	);

true_dpbram 
#(	.DWIDTH   (`DATA_WIDTH), 
	.AWIDTH   (`ADDR_WIDTH), 
	.MEM_SIZE (`MEM_DEPTH)) 
u_TDPBRAM_0(
	.clk		(clk), 

	.addr0		(addr0_b0), 
	.ce0		(ce0_b0), 
	.we0		(we0_b0), 
	.q0			(q0_b0), 
	.d0			(d0_b0), 

// no use port B. Use in TB
	.addr1 		(addr1_b0), 
	.ce1		(ce1_b0	), 
	.we1		(we1_b0	),
	.q1			(q1_b0	), 
	.d1			(d1_b0	)
);

true_dpbram 
#(	.DWIDTH   (`DATA_WIDTH), 
	.AWIDTH   (`ADDR_WIDTH), 
	.MEM_SIZE (`MEM_DEPTH)) 
u_TDPBRAM_1(
	.clk		(clk), 

	.addr0		(addr0_b1), 
	.ce0		(ce0_b1), 
	.we0		(we0_b1), 
	.q0			(q0_b1), 
	.d0			(d0_b1), 

// no use port B. Use in TB
	.addr1 		(addr1_b1), 
	.ce1		(ce1_b1	), 
	.we1		(we1_b1	),
	.q1			(q1_b1	), 
	.d1			(d1_b1	)
);


true_dpbram 
#(	.DWIDTH   (`DATA_WIDTH), 
	.AWIDTH   (`ADDR_WIDTH), 
	.MEM_SIZE (`MEM_DEPTH)) 
u_TDPBRAM_2(
	.clk		(clk), 

	.addr0		(addr0_b2), 
	.ce0		(ce0_b2), 
	.we0		(we0_b2), 
	.q0			(q0_b2), 
	.d0			(d0_b2), 

// no use port B. Use in TB
	.addr1 		(addr1_b2), 
	.ce1		(ce1_b2	), 
	.we1		(we1_b2	),
	.q1			(q1_b2	), 
	.d1			(d1_b2	)
);
endmodule
