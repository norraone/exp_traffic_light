
�
Sourcing tcl script '%s'
201*common2C
/C:/Xilinx/Vivado/2022.2/scripts/Vivado_init.tcl2default:defaultZ17-201h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental D:/FPGA/exp_traffic_light/src/TRAFFIC_LIGHT/TRAFFIC_LIGHT.srcs/utils_1/imports/synth_1/top.dcp2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2r
^D:/FPGA/exp_traffic_light/src/TRAFFIC_LIGHT/TRAFFIC_LIGHT.srcs/utils_1/imports/synth_1/top.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
p
Command: %s
53*	vivadotcl2?
+synth_design -top top -part xc7a35tcpg236-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-349h px� 
V
Loading part %s157*device2#
xc7a35tcpg236-12default:defaultZ21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
42default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
`
#Helper process launched with PID %s4824*oasys2
204762default:defaultZ8-7075h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2[
EC:/Xilinx/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
�
%s*synth2�
yStarting RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:04 . Memory (MB): peak = 2205.059 ; gain = 410.188
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2
top2default:default2
 2default:default29
#D:/FPGA/exp_traffic_light/src/top.v2default:default2
12default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
clk_div_1Hz2default:default2
 2default:default2?
)D:/FPGA/exp_traffic_light/src/clock_div.v2default:default2
12default:default8@Z8-6157h px� 
i
%s
*synth2Q
=	Parameter DIVISOR bound to: 26'b10111110101111000010000000 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
clk_div_1Hz2default:default2
 2default:default2
02default:default2
12default:default2?
)D:/FPGA/exp_traffic_light/src/clock_div.v2default:default2
12default:default8@Z8-6155h px� 
�
module '%s' not found439*oasys2+
traffic_light_optimized2default:default29
#D:/FPGA/exp_traffic_light/src/top.v2default:default2
172default:default8@Z8-439h px� 
�
!failed synthesizing module '%s'%s4496*oasys2
top2default:default2
 2default:default29
#D:/FPGA/exp_traffic_light/src/top.v2default:default2
12default:default8@Z8-6156h px� 
�
%s*synth2�
yFinished RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:05 . Memory (MB): peak = 2294.109 ; gain = 499.238
2default:defaulth px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
142default:default2
02default:default2
02default:default2
32default:defaultZ4-41h px� 
N

%s failed
30*	vivadotcl2 
synth_design2default:defaultZ4-43h px� 
�
Command failed: %s
69*common2Y
ESynthesis failed - please see the console or run log file for details2default:defaultZ17-69h px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Sun Nov 24 15:35:26 20242default:defaultZ17-206h px� 


End Record