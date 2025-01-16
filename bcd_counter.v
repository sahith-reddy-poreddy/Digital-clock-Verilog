module bcd_counter(
    input wire clk,
    input wire reset,
    input wire enable,
    output reg [3:0] tens,  // BCD tens place
    output reg [3:0] units  // BCD units place
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            tens <= 4'd0;
            units <= 4'd0;
        end else if (enable) begin
            if (units == 4'd9) begin
                units <= 4'd0;
                if (tens == 4'd5) // For 0-59 range
                    tens <= 4'd0;
                else
                    tens <= tens + 1;
            end else begin
                units <= units + 1;
            end
        end
    end
endmodule
