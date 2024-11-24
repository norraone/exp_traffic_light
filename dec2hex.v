module decimal_to_hex(
    input [7:0] decimal_in,     // 8-bit decimal input (0-99)
    output reg [7:0] hex_out    // 8-bit hex output
);

reg [3:0] tens;
reg [3:0] ones;
reg [7:0] temp;

always @(*) begin
    // Extract tens and ones digits
    tens = decimal_in / 10;
    ones = decimal_in % 10;
    
    // Combine into hex format
    temp = {tens, ones};
    
    // Convert BCD to hex
    hex_out = (tens * 8'd16) + ones;
end

endmodule