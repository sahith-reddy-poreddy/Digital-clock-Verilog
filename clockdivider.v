module clock_divider(
    input wire clk,      // Main clock signal, e.g., 50 MHz
    input wire reset,    // Reset signal
    output reg clk_1hz   // 1 Hz clock output
);
    reg [25:0] counter;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 26'd0;
            clk_1hz <= 0;
        end else if (counter == 26'd1) begin // Adjust if the main clock isn't 50 MHz
            clk_1hz <= ~clk_1hz;
            counter <= 26'd0;
        end else begin
            counter <= counter + 1;
        end
    end
endmodule
