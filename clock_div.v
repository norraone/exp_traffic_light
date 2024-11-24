module clk_div_1Hz(
    input           sys_clk,    // 100MHz input clock
    input           sys_rst_p,  // Active high reset
    output reg      clk_1hz     // 1Hz output clock
);

// Counter needs to count to 50M to create 1Hz from 100MHz
// log2(50M) = 26 bits needed
reg [25:0] counter;

// 50M = 50,000,000 in decimal = 32'h2FAF080
parameter DIVISOR = 26'd50000000;

always @(posedge sys_clk or posedge sys_rst_p) begin
    if (sys_rst_p) begin
        counter <= 26'd0;
        clk_1hz <= 1'b0;
    end
    else begin
        if (counter == DIVISOR - 1) begin
            counter <= 26'd0;
            clk_1hz <= ~clk_1hz;  // Toggle the output
        end
        else begin
            counter <= counter + 1'b1;
        end
    end
end

endmodule