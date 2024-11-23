module traffic_light(
	input			sys_clk,
	input			sys_rst_n,
	input			sys_clk_1s,
	output	[3:0]	light_t,
	output	[2:0]	light_ctrl
	);
/* PARAM */
// Global Parameter
parameter [2:0]   G_T  = 'd10,
				  Y_T  = 'd5,
				  R_T  = 'd15;
// Local Parameter
localparam [3:0]  IDLE = 3'd0,
				  G    = 3'd1,
				  Y    = 3'd2,
				  R    = 3'd3;

/* local var */
reg [3:0] cur_st;
reg [3:0] nxt_st;

/* State Machine Part */
// First Machine: State Register
always @(posedge sys_clk or posedge sys_rst_n) begin
	if (sys_rst_n) begin
		// reset
		cur_st <= IDLE;
	end
	else begin
		cur_st <= nxt_st;
	end
end
// Second Machine: State Transfer
always @(cur_st or sys_rst_n or light_t) begin
if (sys_rst_n) begin
	nxt_st <= IDLE;
end
	case(cur_st)
		IDLE	:nxt_st<=(light_t==4'd1)?G:IDLE;
		G 		:
		Y 		:
		R  		:
	endcase
end
endmodule