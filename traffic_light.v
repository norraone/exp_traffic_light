module traffic_light(
	input sys_clk,
	input sys_rst_n,
	input sys_clk_1s,
	output [3:0] light_t,
	output [2:0] light_ctrl
	)
/* PARAM */