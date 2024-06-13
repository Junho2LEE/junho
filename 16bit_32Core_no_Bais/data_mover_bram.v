`timescale 1ns / 1ps
module data_mover_bram
// Param
#(
	parameter CNT_BIT = 31,
// BRAM
	parameter DWIDTH = 32,
	parameter AWIDTH = 12,
	parameter MEM_SIZE = 4096,
	parameter IN_DATA_WITDH = 16 //JUN
)

(
    input 				clk,
    input 				reset_n,
	input 				i_run,
	input  [CNT_BIT-1:0]	i_num_cnt,
	output   			o_idle,
	output   			o_read,
	output   			o_write,
	output  			o_done,

// Memory I/F (Read from bram0) // input node
	output[AWIDTH-1:0] 	addr_b0,
	output 				ce_b0,
	output 				we_b0,
	input [DWIDTH-1:0]  q_b0,
	output[DWIDTH-1:0] 	d_b0,

// Memory I/F (Read to bram1)   // weight 1
	output[AWIDTH-1:0] 	addr_b1,
	output 				ce_b1,
	output 				we_b1,
	input [DWIDTH-1:0]  q_b1,
	output[DWIDTH-1:0] 	d_b1,
	
	// Memory I/F (Read to bram2)   // weight 2
	output[AWIDTH-1:0] 	addr_b2,
	output 				ce_b2,
	output 				we_b2,
	input [DWIDTH-1:0]  q_b2,
	output[DWIDTH-1:0] 	d_b2,

	// Memory I/F (Read to bram3)   // Weight 3
	output[AWIDTH-1:0] 	addr_b3,
	output 				ce_b3,
	output 				we_b3,
	input [DWIDTH-1:0]  q_b3,
	output[DWIDTH-1:0] 	d_b3,

	// Memory I/F (Read to bram4)   // weight 4
	output[AWIDTH-1:0] 	addr_b4,
	output 				ce_b4,
	output 				we_b4,
	input [DWIDTH-1:0]  q_b4,
	output[DWIDTH-1:0] 	d_b4,

	// Memory I/F (Read to bram5)   // weight 5
	output[AWIDTH-1:0] 	addr_b5,
	output 				ce_b5,
	output 				we_b5,
	input [DWIDTH-1:0]  q_b5,
	output[DWIDTH-1:0] 	d_b5,

	// Memory I/F (Read to bram6)   // weight 6
	output[AWIDTH-1:0] 	addr_b6,
	output 				ce_b6,
	output 				we_b6,
	input [DWIDTH-1:0]  q_b6,
	output[DWIDTH-1:0] 	d_b6,

	// Memory I/F (Read to bram7)   // weight 7
	output[AWIDTH-1:0] 	addr_b7,
	output 				ce_b7,
	output 				we_b7,
	input [DWIDTH-1:0]  q_b7,
	output[DWIDTH-1:0] 	d_b7,

	// Memory I/F (Read to bram8)   // weight 8
	output[AWIDTH-1:0] 	addr_b8,
	output 				ce_b8,
	output 				we_b8,
	input [DWIDTH-1:0]  q_b8,
	output[DWIDTH-1:0] 	d_b8,

	// Memory I/F (Read to bram9)   // weight 9
	output[AWIDTH-1:0] 	addr_b9,
	output 				ce_b9,
	output 				we_b9,
	input [DWIDTH-1:0]  q_b9,
	output[DWIDTH-1:0] 	d_b9,

	// Memory I/F (Read to bram10)   // weight 10	
	output[AWIDTH-1:0] 	addr_b10,
	output 				ce_b10,
	output 				we_b10,
	input [DWIDTH-1:0]  q_b10,
	output[DWIDTH-1:0] 	d_b10,

	// Memory I/F (Read to bram11)   // weight 11
	output[AWIDTH-1:0] 	addr_b11,
	output 				ce_b11,
	output 				we_b11,
	input [DWIDTH-1:0]  q_b11,
	output[DWIDTH-1:0] 	d_b11,

	// Memory I/F (Read to bram11)   // weight 12
	output[AWIDTH-1:0] 	addr_b12,
	output 				ce_b12,
	output 				we_b12,
	input [DWIDTH-1:0]  q_b12,
	output[DWIDTH-1:0] 	d_b12,

	// Memory I/F (Read to bram13)   // weight 13
	output[AWIDTH-1:0] 	addr_b13,
	output 				ce_b13,
	output 				we_b13,
	input [DWIDTH-1:0]  q_b13,
	output[DWIDTH-1:0] 	d_b13,

	// Memory I/F (Read to bram14)   // weight 14
	output[AWIDTH-1:0] 	addr_b14,
	output 				ce_b14,
	output 				we_b14,
	input [DWIDTH-1:0]  q_b14,
	output[DWIDTH-1:0] 	d_b14,

	// Memory I/F (Read to bram15)   // weight 15
	output[AWIDTH-1:0] 	addr_b15,
	output 				ce_b15,
	output 				we_b15,
	input [DWIDTH-1:0]  q_b15,
	output[DWIDTH-1:0] 	d_b15,

	// Memory I/F (Read to bram16)   // weight 16
	output[AWIDTH-1:0] 	addr_b16,
	output 				ce_b16,
	output 				we_b16,
	input [DWIDTH-1:0]  q_b16,
	output[DWIDTH-1:0] 	d_b16,




//  result for 4 core
	output[DWIDTH-1:0]  result_0,
	output[DWIDTH-1:0]  result_1,
	output[DWIDTH-1:0]  result_2,
	output[DWIDTH-1:0]  result_3,
	output[DWIDTH-1:0]  result_4,
	output[DWIDTH-1:0]  result_5,
	output[DWIDTH-1:0]  result_6,
	output[DWIDTH-1:0]  result_7,
	output[DWIDTH-1:0]  result_8,
	output[DWIDTH-1:0]  result_9,
	output[DWIDTH-1:0]  result_10,
	output[DWIDTH-1:0]  result_11,
	output[DWIDTH-1:0]  result_12,
	output[DWIDTH-1:0]  result_13,
	output[DWIDTH-1:0]  result_14,
	output[DWIDTH-1:0]  result_15,
	output[DWIDTH-1:0]  result_16,
	output[DWIDTH-1:0]  result_17,
	output[DWIDTH-1:0]  result_18,
	output[DWIDTH-1:0]  result_19,
	output[DWIDTH-1:0]  result_20,
	output[DWIDTH-1:0]  result_21,
	output[DWIDTH-1:0]  result_22,
	output[DWIDTH-1:0]  result_23,
	output[DWIDTH-1:0]  result_24,
	output[DWIDTH-1:0]  result_25,
	output[DWIDTH-1:0]  result_26,
	output[DWIDTH-1:0]  result_27,
	output[DWIDTH-1:0]  result_28,
	output[DWIDTH-1:0]  result_29,
	output[DWIDTH-1:0]  result_30,
	output[DWIDTH-1:0]  result_31
    );

/////// Local Param. to define state ////////
localparam S_IDLE	= 2'b00;
localparam S_RUN	= 2'b01;
localparam S_DONE  	= 2'b10;

/////// Type ////////
reg [1:0] c_state_read; // Current state  (F/F)
reg [1:0] n_state_read; // Next state (Variable in Combinational Logic)
reg [1:0] c_state_write; // Current state  (F/F)
reg [1:0] n_state_write; // Next state (Variable in Combinational Logic)
wire	  is_write_done;
wire	  is_read_done;

/////// Main ////////

// Step 1. always block to update state 
always @(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
		c_state_read <= S_IDLE;
    end else begin
		c_state_read <= n_state_read;
    end
end

always @(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
		c_state_write <= S_IDLE;
    end else begin
		c_state_write <= n_state_write;
    end
end

// Step 2. always block to compute n_state_read
//always @(c_state_read or i_run or is_done) 
always @(*) 
begin
	n_state_read = c_state_read; // To prevent Latch.
	case(c_state_read)
	S_IDLE	: if(i_run)
				n_state_read = S_RUN;
	S_RUN   : if(is_read_done)
				n_state_read = S_DONE;
	S_DONE	: n_state_read 	 = S_IDLE;
	endcase
end 

always @(*) 
begin
	n_state_write = c_state_write; // To prevent Latch.
	case(c_state_write)
	S_IDLE	: if(i_run)
				n_state_write = S_RUN;
	S_RUN   : if(is_write_done)
				n_state_write = S_DONE;
	S_DONE	: n_state_write   = S_IDLE;
	endcase
end 

// Step 3.  always block to compute output
// Added to communicate with control signals.
assign o_idle 		= (c_state_read == S_IDLE) && (c_state_write == S_IDLE);
assign o_read 		= (c_state_read == S_RUN);
assign o_write 		= (c_state_write == S_RUN);
assign o_done 		= (c_state_write == S_DONE); // The write state is slower than the read state.

// Step 4. Registering (Capture) number of Count
reg [CNT_BIT-1:0] num_cnt;  
always @(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
        num_cnt <= 0;  
    end else if (i_run) begin
        num_cnt <= i_num_cnt;
	end else if (o_done) begin
		num_cnt <= 0;
	end
end

// Step 5. increased addr_cnt
reg [CNT_BIT-1:0] addr_cnt_read;  
reg [CNT_BIT-1:0] addr_cnt_write;
assign is_read_done  = o_read  && (addr_cnt_read == num_cnt-1);
assign is_write_done = o_write && (addr_cnt_write == num_cnt-1);

always @(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
        addr_cnt_read <= 0;  
    end else if (is_read_done) begin
        addr_cnt_read <= 0; 
    end else if (o_read) begin
        addr_cnt_read <= addr_cnt_read + 1;
	end
end

wire result_valid;

always @(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
        addr_cnt_write <= 0;  
    end else if (is_write_done) begin
        addr_cnt_write <= 0; 
    //end else if (o_write && we_b1) begin  // core delay
    end else if (o_write && result_valid) begin  // (lab21) core delay
        addr_cnt_write <= addr_cnt_write + 1;
	end
end

// Step 6. Read Data from BRAM0
// Assign Memory I/F. Read from BRAM0
assign addr_b0 	= addr_cnt_read;
assign ce_b0 	= o_read;
assign we_b0 	= 1'b0; // read only
assign d_b0		= {DWIDTH{1'b0}}; // no use

reg 				r_valid;
wire [DWIDTH-1:0] 	mem_data_0;

// 1 cycle latency to sync mem output
always @(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
        r_valid <= {DWIDTH{1'b0}};  
    end else begin
		r_valid <= o_read; // read data
	end
end
assign mem_data_0 = q_b0;  


// (lab21) Step 6.1  Read Data from BRAM1 weight
// Assign Memory I/F. Read from BRAM0
assign addr_b1 	= addr_cnt_read;
assign ce_b1 	= o_read;
assign we_b1 	= 1'b0; // read only
assign d_b1		= {DWIDTH{1'b0}}; // no use

wire [DWIDTH-1:0] 	mem_data_1;

assign mem_data_1 = q_b1;

// Assign Memory I/F. Read Data from BRAM1 weight
assign addr_b2 	= addr_cnt_read;
assign ce_b2 	= o_read;
assign we_b2 	= 1'b0; // read only
assign d_b2		= {DWIDTH{1'b0}}; // no use

wire [DWIDTH-1:0] 	mem_data_2;

assign mem_data_2 = q_b2;

/ Assign Memory I/F. Read Data from BRAM3 weight
assign addr_b3 	= addr_cnt_read;
assign ce_b3 	= o_read;
assign we_b3 	= 1'b0; // read only
assign d_b3		= {DWIDTH{1'b0}}; // no use

wire [DWIDTH-1:0] 	mem_data_3;

assign mem_data_3 = q_b3;

// Assign Memory I/F. Read Data from BRAM4 Bias
assign addr_b4 	= addr_cnt_read;
assign ce_b4 	= o_read;
assign we_b4 	= 1'b0; // read only
assign d_b4		= {DWIDTH{1'b0}}; // no use

wire [DWIDTH-1:0] 	mem_data_4;

assign mem_data_4 = q_b4;

// Assign Memory I/F. Read Data from BRAM5 Weight
assign addr_b5 	= addr_cnt_read;
assign ce_b5 	= o_read;
assign we_b5 	= 1'b0; // read only
assign d_b5		= {DWIDTH{1'b0}}; // no use

wire [DWIDTH-1:0] 	mem_data_5;

assign mem_data_5 = q_b5;

// Assign Memory I/F. Read Data from BRAM6 Bias
assign addr_b6 	= addr_cnt_read;
assign ce_b6 	= o_read;
assign we_b6 	= 1'b0; // read only
assign d_b6		= {DWIDTH{1'b0}}; // no use

wire [DWIDTH-1:0] 	mem_data_6;

assign mem_data_6 = q_b6;

// Assign Memory I/F. Read Data from BRAM7 Weight
assign addr_b7 	= addr_cnt_read;
assign ce_b7 	= o_read;
assign we_b7 	= 1'b0; // read only
assign d_b7		= {DWIDTH{1'b0}}; // no use

wire [DWIDTH-1:0] 	mem_data_7;

assign mem_data_7 = q_b7;

// Assign Memory I/F. Read Data from BRAM8 Bias
assign addr_b8 	= addr_cnt_read;
assign ce_b8 	= o_read;
assign we_b8 	= 1'b0; // read only
assign d_b8		= {DWIDTH{1'b0}}; // no use

wire [DWIDTH-1:0] 	mem_data_8;

assign mem_data_8 = q_b8;

// Assign Memory I/F. Read Data from BRAM9 Weight
assign addr_b9 	= addr_cnt_read;
assign ce_b9 	= o_read;
assign we_b9 	= 1'b0; // read only
assign d_b9		= {DWIDTH{1'b0}}; // no use

wire [DWIDTH-1:0] 	mem_data_9;

assign mem_data_9 = q_b9;

// Assign Memory I/F. Read Data from BRAM10 Bias
assign addr_b10 	= addr_cnt_read;
assign ce_b10 	= o_read;
assign we_b10 	= 1'b0; // read only
assign d_b10		= {DWIDTH{1'b0}}; // no use

wire [DWIDTH-1:0] 	mem_data_10;

assign mem_data_10 = q_b10;

// Assign Memory I/F. Read Data from BRAM11 Weight
assign addr_b11 	= addr_cnt_read;
assign ce_b11 	= o_read;
assign we_b11 	= 1'b0; // read only
assign d_b11		= {DWIDTH{1'b0}}; // no use

wire [DWIDTH-1:0] 	mem_data_11;

assign mem_data_11 = q_b11;

// Assign Memory I/F. Read Data from BRAM12 Bias
assign addr_b12 	= addr_cnt_read;
assign ce_b12 	= o_read;
assign we_b12 	= 1'b0; // read only
assign d_b12		= {DWIDTH{1'b0}}; // no use

wire [DWIDTH-1:0] 	mem_data_12;

assign mem_data_12 = q_b12;

// Assign Memory I/F. Read Data from BRAM13 Weight
assign addr_b13 	= addr_cnt_read;
assign ce_b13 	= o_read;
assign we_b13 	= 1'b0; // read only
assign d_b13		= {DWIDTH{1'b0}}; // no use

wire [DWIDTH-1:0] 	mem_data_13;

assign mem_data_13 = q_b13;

// Assign Memory I/F. Read Data from BRAM14 Bias
assign addr_b14 	= addr_cnt_read;
assign ce_b14 	= o_read;
assign we_b14 	= 1'b0; // read only
assign d_b14		= {DWIDTH{1'b0}}; // no use

wire [DWIDTH-1:0] 	mem_data_14;

assign mem_data_14 = q_b14;

// Assign Memory I/F. Read Data from BRAM15 Weight
assign addr_b15 	= addr_cnt_read;
assign ce_b15 	= o_read;
assign we_b15 	= 1'b0; // read only
assign d_b15		= {DWIDTH{1'b0}}; // no use

wire [DWIDTH-1:0] 	mem_data_15;

assign mem_data_15 = q_b15;

// Assign Memory I/F. Read Data from BRAM16 Bias
assign addr_b16 	= addr_cnt_read;
assign ce_b16 	= o_read;
assign we_b16 	= 1'b0; // read only
assign d_b16		= {DWIDTH{1'b0}}; // no use

wire [DWIDTH-1:0] 	mem_data_16;

assign mem_data_16 = q_b16;


wire	[IN_DATA_WITDH-1:0]	    w_a_0	 	= mem_data_0[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_0	 	= mem_data_1[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_0	;
wire 							w_valid_0 	;

wire	[IN_DATA_WITDH-1:0]	    w_a_1	 	= mem_data_0[(2*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_1	 	= mem_data_1[(2*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_1	;
wire 							w_valid_1 	;

wire	[IN_DATA_WITDH-1:0]	    w_a_2	 	= mem_data_0[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_2	 	= mem_data_2[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_2	;
wire 							w_valid_2 	;

wire	[IN_DATA_WITDH-1:0]	    w_a_3	 	= mem_data_0[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_3	 	= mem_data_2[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_3	;
wire 							w_valid_3 	;

wire	[IN_DATA_WITDH-1:0]	    w_a_4	 	= mem_data_0[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_4	 	= mem_data_3[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_4	;
wire 							w_valid_4 	;

wire	[IN_DATA_WITDH-1:0]	    w_a_5	 	= mem_data_0[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_5	 	= mem_data_3[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_5	;
wire 							w_valid_5	;

wire	[IN_DATA_WITDH-1:0]	    w_a_6	 	= mem_data_0[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_6	 	= mem_data_4[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_6	;
wire 							w_valid_6	;

wire	[IN_DATA_WITDH-1:0]	    w_a_7	 	= mem_data_0[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_7	 	= mem_data_4[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_7	;
wire 							w_valid_7	;

wire	[IN_DATA_WITDH-1:0]	    w_a_8	 	= mem_data_0[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_8	 	= mem_data_5[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_8	;
wire 							w_valid_8	;

wire	[IN_DATA_WITDH-1:0]	    w_a_9	 	= mem_data_0[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_9	 	= mem_data_5[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_9	;
wire 							w_valid_9	;

wire	[IN_DATA_WITDH-1:0]	    w_a_10	 	= mem_data_0[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_10	 	= mem_data_6[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_10	;
wire 							w_valid_10	;

wire	[IN_DATA_WITDH-1:0]	    w_a_11	 	= mem_data_0[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_11	 	= mem_data_6[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_11	;
wire 							w_valid_11	;

wire	[IN_DATA_WITDH-1:0]	    w_a_12	 	= mem_data_0[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_12	 	= mem_data_7[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_12	;
wire 							w_valid_12	;

wire	[IN_DATA_WITDH-1:0]	    w_a_13	 	= mem_data_0[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_13	 	= mem_data_7[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_13	;
wire 							w_valid_13	;

wire	[IN_DATA_WITDH-1:0]	    w_a_14	 	= mem_data_0[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_14	 	= mem_data_8[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_14	;
wire 							w_valid_14	;

wire	[IN_DATA_WITDH-1:0]	    w_a_15	 	= mem_data_0[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_15	 	= mem_data_8[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_15	;
wire 							w_valid_15	;

wire	[IN_DATA_WITDH-1:0]	    w_a_16	 	= mem_data_0[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_16	 	= mem_data_9[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_16	;
wire 							w_valid_16	;

wire	[IN_DATA_WITDH-1:0]	    w_a_17	 	= mem_data_0[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_17	 	= mem_data_9[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_17	;
wire 							w_valid_17	;

wire	[IN_DATA_WITDH-1:0]	    w_a_18	 	= mem_data_0[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_18	 	= mem_data_10[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_18	;
wire 							w_valid_18	;

wire	[IN_DATA_WITDH-1:0]	    w_a_19	 	= mem_data_0[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_19	 	= mem_data_10[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_19	;
wire 							w_valid_19	;

wire	[IN_DATA_WITDH-1:0]	    w_a_20	 	= mem_data_0[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_20	 	= mem_data_11[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_20	;
wire 							w_valid_20	;

wire	[IN_DATA_WITDH-1:0]	    w_a_21	 	= mem_data_0[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_21	 	= mem_data_11[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_21	;
wire 							w_valid_21	;

wire	[IN_DATA_WITDH-1:0]	    w_a_22	 	= mem_data_0[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_22	 	= mem_data_12[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_22	;
wire 							w_valid_22	;

wire	[IN_DATA_WITDH-1:0]	    w_a_23	 	= mem_data_0[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_23	 	= mem_data_12[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_23	;
wire 							w_valid_23	;

wire	[IN_DATA_WITDH-1:0]	    w_a_24	 	= mem_data_0[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_24	 	= mem_data_13[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_24	;
wire 							w_valid_24	;

wire	[IN_DATA_WITDH-1:0]	    w_a_25	 	= mem_data_0[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_25	 	= mem_data_13[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_25	;
wire 							w_valid_25	;

wire	[IN_DATA_WITDH-1:0]	    w_a_26	 	= mem_data_0[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_26	 	= mem_data_14[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_26	;
wire 							w_valid_26	;

wire	[IN_DATA_WITDH-1:0]	    w_a_27	 	= mem_data_0[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_27	 	= mem_data_14[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_27	;
wire 							w_valid_27	;

wire	[IN_DATA_WITDH-1:0]	    w_a_28	 	= mem_data_0[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_28	 	= mem_data_15[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_28	;
wire 							w_valid_28	;

wire	[IN_DATA_WITDH-1:0]	    w_a_29	 	= mem_data_0[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_29	 	= mem_data_15[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_29	;
wire 							w_valid_29	;

wire	[IN_DATA_WITDH-1:0]	    w_a_30	 	= mem_data_0[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_30	 	= mem_data_16[(2*IN_DATA_WITDH)-1:(1*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_30	;
wire 							w_valid_30	;

wire	[IN_DATA_WITDH-1:0]	    w_a_31	 	= mem_data_0[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[IN_DATA_WITDH-1:0]	    w_b_31	 	= mem_data_16[(1*IN_DATA_WITDH)-1:(0*IN_DATA_WITDH)];
wire	[(4*IN_DATA_WITDH)-1:0] w_result_31	;
wire 							w_valid_31	;

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_0(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_0	 	),
	.i_wegt		(w_b_0	 	),
	.o_result	(w_result_0	),
	.o_valid	(w_valid_0	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_1(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_1	 	),
	.i_wegt		(w_b_1	 	),
	.o_result	(w_result_1	),
	.o_valid	(w_valid_1	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_2(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_2	 	),
	.i_wegt		(w_b_2	 	),
	.o_result	(w_result_2	),
	.o_valid	(w_valid_2	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_3(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_3	 	),
	.i_wegt		(w_b_3	 	),
	.o_result	(w_result_3	),
	.o_valid	(w_valid_3	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_4(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_4	 	),
	.i_wegt		(w_b_4	 	),
	.o_result	(w_result_4	),
	.o_valid	(w_valid_4	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_5(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_5	 	),
	.i_wegt		(w_b_5	 	),
	.o_result	(w_result_5	),
	.o_valid	(w_valid_5	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_6(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_6	 	),
	.i_wegt		(w_b_6	 	),
	.o_result	(w_result_6	),
	.o_valid	(w_valid_6	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_7(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_7	 	),
	.i_wegt		(w_b_7	 	),
	.o_result	(w_result_7	),
	.o_valid	(w_valid_7	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_8(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_8	 	),
	.i_wegt		(w_b_8	 	),
	.o_result	(w_result_8	),
	.o_valid	(w_valid_8	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_9(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_9	 	),
	.i_wegt		(w_b_9	 	),
	.o_result	(w_result_9	),
	.o_valid	(w_valid_9	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_10(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_10	 	),
	.i_wegt		(w_b_10 	),
	.o_result	(w_result_10 ),
	.o_valid	(w_valid_10	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_11(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_11	 	),
	.o_result	(w_result_11	),
	.o_valid	(w_valid_11	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_12(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_12	 	),
	.i_wegt		(w_b_12	 	),
	.o_result	(w_result_12	),
	.o_valid	(w_valid_12	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_13(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_13	 	),
	.i_wegt		(w_b_13	 	),
	.o_result	(w_result_13	),
	.o_valid	(w_valid_13	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_14(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_14	 	),
	.i_wegt		(w_b_14	 	),
	.o_result	(w_result_14),
	.o_valid	(w_valid_14	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_15(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_15	 	),
	.i_wegt		(w_b_15	 	),
	.o_result	(w_result_15),
	.o_valid	(w_valid_15	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_16(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_16	 	),
	.i_wegt		(w_b_16	 	),
	.o_result	(w_result_16),
	.o_valid	(w_valid_16	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_17(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_17	 	),
	.i_wegt		(w_b_17	 	),
	.o_result	(w_result_17),
	.o_valid	(w_valid_17	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_18(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_18	 	),
	.i_wegt		(w_b_18	 	),
	.o_result	(w_result_18),
	.o_valid	(w_valid_18	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_19(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_19	 	),
	.i_wegt		(w_b_19	 	),
	.o_result	(w_result_19),
	.o_valid	(w_valid_19	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_20(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_20	 	),
	.i_wegt		(w_b_20	 	),
	.o_result	(w_result_20),
	.o_valid	(w_valid_20	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_21(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_21	 	),
	.i_wegt		(w_b_21	 	),
	.o_result	(w_result_21),
	.o_valid	(w_valid_21	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_22(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_22	 	),
	.i_wegt		(w_b_22	 	),
	.o_result	(w_result_22),
	.o_valid	(w_valid_22	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_23(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_23	 	),
	.i_wegt		(w_b_23	 	),
	.o_result	(w_result_23),
	.o_valid	(w_valid_23	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_24(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_24	 	),
	.i_wegt		(w_b_24	 	),
	.o_result	(w_result_24),
	.o_valid	(w_valid_24	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_25(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_25	 	),
	.i_wegt		(w_b_25	 	),
	.o_result	(w_result_25),
	.o_valid	(w_valid_25	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_26(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_26	 	),
	.i_wegt		(w_b_26	 	),
	.o_result	(w_result_26),
	.o_valid	(w_valid_26	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_27(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_27	 	),
	.i_wegt		(w_b_27	 	),
	.o_result	(w_result_27),
	.o_valid	(w_valid_27	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_28(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_28	 	),
	.i_wegt		(w_b_28	 	),
	.o_result	(w_result_28),
	.o_valid	(w_valid_28	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_29(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_29	 	),
	.i_wegt		(w_b_29	 	),
	.o_result	(w_result_29),
	.o_valid	(w_valid_29	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_30(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_30	 	),
	.i_wegt		(w_b_30	 	),
	.o_result	(w_result_30),
	.o_valid	(w_valid_30	)
);

fully_connected_core
// Param
#(
	.IN_DATA_WITDH (IN_DATA_WITDH)
)
u_fully_connected_core_8b_31(
    .clk		(clk	 	),
    .reset_n	(reset_n 	),
	.i_run		(i_run		),
	.i_valid	(r_valid 	),
	.i_node		(w_a_31	 	),
	.i_wegt		(w_b_31	 	),
	.o_result	(w_result_31),
	.o_valid	(w_valid_31	)
);


assign result_valid = w_valid_0 & w_valid_1 & w_valid_2 & w_valid_3 & w_valid_4 & w_valid_5 & w_valid_6 & w_valid_7 & w_valid_8 & w_valid_9 & w_valid_10 & w_valid_11 & w_valid_12 & w_valid_13 & w_valid_14 & w_valid_15 & w_valid_16 & w_valid_17 & w_valid_18 & w_valid_19 & w_valid_20 & w_valid_21 & w_valid_22 & w_valid_23 & w_valid_24 & w_valid_25 & w_valid_26 & w_valid_27 & w_valid_28 & w_valid_29 & w_valid_30 & w_valid_31;
assign result_0 	= w_result_0;
assign result_1 	= w_result_1;
assign result_2 	= w_result_2;
assign result_3 	= w_result_3;
assign result_4 	= w_result_4;
assign result_5 	= w_result_5;
assign result_6 	= w_result_6;
assign result_7 	= w_result_7;
assign result_8 	= w_result_8;
assign result_9 	= w_result_9;
assign result_10 	= w_result_10;
assign result_11 	= w_result_11;
assign result_12 	= w_result_12;
assign result_13 	= w_result_13;
assign result_14 	= w_result_14;
assign result_15 	= w_result_15;
assign result_16 	= w_result_16;
assign result_17 	= w_result_17;
assign result_18 	= w_result_18;
assign result_19 	= w_result_19;
assign result_20 	= w_result_20;
assign result_21 	= w_result_21;
assign result_22 	= w_result_22;
assign result_23 	= w_result_23;
assign result_24 	= w_result_24;
assign result_25 	= w_result_25;
assign result_26 	= w_result_26;
assign result_27 	= w_result_27;
assign result_28 	= w_result_28;
assign result_29 	= w_result_29;
assign result_30 	= w_result_30;
assign result_31 	= w_result_31;

//// (lab21) no use write.  Step 8. Write Data to BRAM1
//assign addr_b1 	= addr_cnt_write;
//assign ce_b1 	= result_valid;
//assign we_b1 	= result_valid;
//assign d_b1		= result_value;

//assign q_b1; // no use

endmodule
