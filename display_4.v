module display_4(
    input               clk,
    input               rst,
    input   [15:0]      data,
    output reg  [3:0]   sel,
    output reg  [6:0]   seg
);

// PARAMETER DEFINE
parameter CNT_MAX = 'd49999;

// REG DEFINE
reg [15:0]  data_reg;   // 数据寄存器，存储输入的数据
reg [15:0]  cnt_1ms;    // 1ms计数器
reg         flag_1ms;   // 1ms标志
reg [3:0]   cnt_sel;    // 扫描计数器，用于控制数码管的位选
reg [3:0]   sel_reg;    // 位选寄存器
reg [3:0]   data_disp;  // 显示数据，存储当前需要显示的数码管数据

// MAIN CODE
always @(posedge clk or posedge rst) begin
    if (rst) begin
        // reset
        data_reg <= 16'b0;
    end
    else begin
        data_reg <= data;
    end
end

// CNT_1MS
always @(posedge clk or posedge rst)
    if (rst)
        cnt_1ms <= 16'd0;
    else if (cnt_1ms == CNT_MAX)
        cnt_1ms <= 16'd0;
    else
        cnt_1ms <= cnt_1ms + 1'b1;

// FLAG 1MS
always @(posedge clk or posedge rst)
    if (rst)
        flag_1ms <= 1'b0;
    else if (cnt_1ms == CNT_MAX - 1'b1)
        flag_1ms <= 1'b1;
    else
        flag_1ms <= 1'b0;

// CNT_SEL
always @(posedge clk or posedge rst)
    if (rst)
        cnt_sel <= 4'd0;
    else if ((cnt_sel == 4'd3) && (flag_1ms == 1'b1))
        cnt_sel <= 4'd0;
    else if (flag_1ms == 1'b1)
        cnt_sel <= cnt_sel + 1'b1;
    else
        cnt_sel <= cnt_sel;

// 扫描控制，更新位选寄存器
always @(posedge clk or posedge rst)
    if (rst)
        sel_reg <= 4'b0111;
    else if (flag_1ms == 1'b1)
        sel_reg <= {sel_reg[2:0], sel_reg[3]};
    else
        sel_reg <= sel_reg;

// 显示数据，根据扫描计数器的值选择显示的数据
always @(posedge clk or posedge rst)
    if (rst)
        data_disp <= 4'b0;
    else if (flag_1ms == 1'b1)
        case(cnt_sel)
            4'd0: data_disp <= data_reg[3:0];    // 显示第1位
            4'd1: data_disp <= data_reg[7:4];    // 显示第2位
            4'd2: data_disp <= data_reg[11:8];   // 显示第3位
            4'd3: data_disp <= data_reg[15:12];  // 显示第4位
            default: data_disp <= 4'b0;
        endcase
    else
        data_disp <= data_disp;

// 根据显示数据，更新数码管的段选信号
always @(posedge clk or posedge rst)
    if (rst)
        seg <= 7'b1111111;
    else
        case(data_disp)
            4'd0: seg <= 7'b1000000; // 显示0
            4'd1: seg <= 7'b1111001; // 显示1
            4'd2: seg <= 7'b0100100; // 显示2
            4'd3: seg <= 7'b0110000; // 显示3
            4'd4: seg <= 7'b0011001; // 显示4
            4'd5: seg <= 7'b0010010; // 显示5
            4'd6: seg <= 7'b0000010; // 显示6
            4'd7: seg <= 7'b1111000; // 显示7
            4'd8: seg <= 7'b0000000; // 显示8
            4'd9: seg <= 7'b0010000; // 显示9
            default: seg <= 7'b1111111;
        endcase

// sel: 更新位选信号
always @(posedge clk or posedge rst)
    if (rst)
        sel <= 4'b1111;
    else
        sel <= sel_reg;

endmodule