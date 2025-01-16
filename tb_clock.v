`timescale 1ns/1ps

module digital_clock_tb;
    reg clk;                   // 50 MHz clock signal
    reg reset;                 // Reset signal
    wire [3:0] sec_tens;       // Tens place of seconds
    wire [3:0] sec_units;      // Units place of seconds
    wire [3:0] min_tens;       // Tens place of minutes
    wire [3:0] min_units;      // Units place of minutes
    wire [3:0] hr_tens;        // Tens place of hours
    wire [3:0] hr_units;       // Units place of hours

    digital_clock uut (
        .clk(clk),
        .reset(reset),
        .sec_tens(sec_tens),
        .sec_units(sec_units),
        .min_tens(min_tens),
        .min_units(min_units),
        .hr_tens(hr_tens),
        .hr_units(hr_units)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;  
    end

    initial begin
        reset = 1;             
        #100 reset = 0;       

        #500000000;  

        $stop;  
    end

endmodule
