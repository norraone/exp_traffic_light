module top(
	input sys_clk,
	input sys_rst_p,
	output [3:0] sel,
	output [6:0] seg,
	output [2:0] light_ctrl
	);

wire sys_clk_1hz;
wire [3:0] carry_light_t;

clk_div_1Hz #(.DIVISOR(26'd50000000)) inst_clk_div_1Hz (
	.sys_clk(sys_clk), 
	.sys_rst_p(sys_rst_p), 
	.clk_1hz(clk_1hz)
	);
traffic_light_optimized inst_traffic_light_optimized
	(
		.sys_clk    (sys_clk),
		.sys_rst_p  (sys_rst_p),
		.sys_clk_1s (sys_clk_1s),
		.light_t    (carry_light_t),
		.light_ctrl (light_ctrl)
	);
display_4 #(.CNT_MAX(49999)) inst_display_4 (
	.clk(sys_clk), 
	.rst(sys_rst_p), 
	.data(carry_light_t), 
	.sel(sel), 
	.seg(seg));

endmodule