module digital_clock(
    input wire clk,          // 50 MHz clock input
    input wire reset,        // Reset signal
    output wire [3:0] sec_tens, sec_units,  // Seconds tens and units
    output wire [3:0] min_tens, min_units,  // Minutes tens and units
    output wire [3:0] hr_tens, hr_units     // Hours tens and units
);
    wire clk_1hz;

    clock_divider cd(.clk(clk), .reset(reset), .clk_1hz(clk_1hz));

    wire sec_enable;
    bcd_counter seconds(.clk(clk_1hz), .reset(reset), .enable(1'b1), .tens(sec_tens), .units(sec_units));
    assign sec_enable = (sec_tens == 4'd5 && sec_units == 4'd9);  // Enable next counter at 59 seconds

    wire min_enable;
    bcd_counter minutes(.clk(clk_1hz), .reset(reset), .enable(sec_enable), .tens(min_tens), .units(min_units));
    assign min_enable = (min_tens == 4'd5 && min_units == 4'd9 && sec_tens == 4'd5 && sec_units == 4'd9);  // Enable next counter at 59 minutes

    hours_counter hours(.clk(clk_1hz), .reset(reset), .enable(min_enable), .tens(hr_tens), .units(hr_units));
endmodule
