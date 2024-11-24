module traffic_light_optimized (
    input               sys_clk,
    input               sys_rst_p,
    input               sys_clk_1s,
    output reg  [7:0]   light_t,    // Time counter output
    output reg  [2:0]   light_ctrl  // Traffic light control (RGB)
);

// Timing parameters (in seconds)
localparam [7:0] GREEN_TIME  = 8'd20,
                 YELLOW_TIME = 8'd17,
                 RED_TIME    = 8'd14;

// State encoding using one-hot encoding
localparam [3:0]
                 GREEN  = 4'b0010,
                 YELLOW = 4'b0100,
                 RED    = 4'b1000;

// State registers
reg [3:0] current_state, next_state;

// First block: Sequential state register
always @(posedge sys_clk or posedge sys_rst_p) begin
    if (sys_rst_p)
        current_state <= GREEN;
    else
        current_state <= next_state;
end

// Second block: Next state logic
always @(*) begin
    case (current_state)
        GREEN:  next_state = (light_t == 4'd2) ? YELLOW : GREEN;
        YELLOW: next_state = (light_t == 4'd2) ? RED    : YELLOW;
        RED:    next_state = (light_t == 4'd2) ? GREEN  : RED;
        default:next_state = GREEN;
    endcase
end

// Third block: Output logic and timing control
always @(posedge sys_clk_1s or posedge sys_rst_p) begin
    if (sys_rst_p) begin
        light_ctrl <= 3'b001;  // Default to green
        light_t    <= GREEN_TIME;
    end else begin
        case (current_state)
            GREEN: begin
                light_ctrl <= 3'b001;  // Green light
                light_t    <= (light_t == 4'd1) ? GREEN_TIME  : light_t - 1'd1;
            end
            YELLOW: begin
                light_ctrl <= 3'b010;  // Yellow light
                light_t    <= (light_t == 4'd1) ? YELLOW_TIME : light_t - 1'd1;
            end
            RED: begin
                light_ctrl <= 3'b100;  // Red light
                light_t    <= (light_t == 4'd1) ? RED_TIME    : light_t - 1'd1;
            end
            default: begin
                light_ctrl <= 3'b001;  // Default to green
                light_t    <= GREEN_TIME;
            end
        endcase
    end
end

endmodule