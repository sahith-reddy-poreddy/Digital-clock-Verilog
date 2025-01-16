module hours_counter(
    input wire clk,
    input wire reset,
    input wire enable,
    output reg [3:0] tens,  // Tens place for hours
    output reg [3:0] units  // Units place for hours
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            tens <= 4'd0;
            units <= 4'd0;
        end else if (enable) begin
            if (units == 4'd9) begin
                units <= 4'd0;
                if (tens == 4'd2) begin
                    tens <= 4'd0;
                end else if (tens == 4'd0 && units == 4'd9) begin
                    tens <= tens + 1;
                end
                else if(tens == 4'd1 && units ==4'd1) begin
                    tens <= 0;
                    units <= 0;
                end
            end else begin
                units <= units + 1;
            end
        end
    end
endmodule
