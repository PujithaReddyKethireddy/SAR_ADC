module sar_adc_10bit (
    input clk,
    input rst,
    input start,
    input comp_out,

    output reg [9:0] sar_out,
    output reg done
);

reg [3:0] bit_idx;       // 0 to 9
reg [9:0] sar_reg;
reg busy;

// ==========================
// MAIN CONTROL
// ==========================
always @(posedge clk or posedge rst) begin
    if (rst) begin
        sar_reg <= 0;
        sar_out <= 0;
        bit_idx <= 0;
        done <= 0;
        busy <= 0;
    end else begin

        // START CONVERSION
        if (start && !busy) begin
            busy <= 1;
            bit_idx <= 9;        // MSB first
            sar_reg <= 0;
            done <= 0;
        end

        // RUN SAR
        else if (busy) begin

            // Try current bit = 1
            sar_reg[bit_idx] <= 1;

            // Comparator decision (from previous cycle)
            if (comp_out == 0)
                sar_reg[bit_idx] <= 0;

            // Move to next bit
            if (bit_idx == 0) begin
                busy <= 0;
                sar_out <= sar_reg;
                done <= 1;
            end else begin
                bit_idx <= bit_idx - 1;
            end
        end

        else begin
            done <= 0;
        end
    end
end

endmodule
