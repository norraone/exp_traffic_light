module traffic_light(
	input				sys_clk,
	input				sys_rst_p,
	input				sys_clk_1s,
	output reg	[3:0]	light_t,
	output reg	[2:0]	light_ctrl
	);
/* PARAM */
// Global Parameter
parameter [3:0]   G_T  = 4'd10,
				  Y_T  = 4'd5,
				  R_T  = 4'd15;
// Local Parameter
localparam [3:0]  IDLE = 4'b0001,
				  G    = 4'b0010,
				  Y    = 4'b0100,
				  R    = 4'b1000;

/* local var */
reg [3:0] cur_st;
reg [3:0] nxt_st;

/* State Machine Part */
// First Machine: State Register
always @(posedge sys_clk or posedge sys_rst_p) begin
	if (sys_rst_p) begin
		// reset
		cur_st <= IDLE;
	end
	else begin
		cur_st <= nxt_st;
	end
end
// Second Machine: State Transfer
always @(posedge sys_clk_1s or posedge sys_rst_p) begin
if (sys_rst_p) begin
	nxt_st <= IDLE;
end
	case(cur_st)
		IDLE	:nxt_st<=(light_t==4'd2)?G:IDLE;
		G 		:nxt_st<=(light_t==4'd2)?Y:G;
		Y 		:nxt_st<=(light_t==4'd2)?R:Y;
		R  		:nxt_st<=(light_t==4'd2)?G:R;
		default :nxt_st<=IDLE;
	endcase
end
// Third Machine: Output Control for next state
always @(posedge sys_clk_1s or posedge sys_rst_p) begin
if (sys_rst_p) begin
	light_ctrl <= 3'b001;
	light_t    <= G_T;
end
    case(nxt_st)
        IDLE:begin
	            light_ctrl <= 3'b000;
	            if (light_t==4'd1) light_t<=G_T;
	            else light_t<=light_t-1;
        	end
        G 	:begin
	            light_ctrl <= 3'b001;
	            if (light_t==4'd1) light_t<=G_T;
	            else light_t<=light_t-1;
        	end
        Y 	:begin
	            light_ctrl <= 3'b010;
	            if (light_t==4'd1) light_t<=Y_T;
	            else light_t<=light_t-1;
        	end
        R 	:begin
	            light_ctrl <= 3'b100;
	            if (light_t==4'd1) light_t<=R_T;
	            else light_t<=light_t-1;
        	end
        default:
            light_ctrl <= 3'b001;
    endcase
end
endmodule