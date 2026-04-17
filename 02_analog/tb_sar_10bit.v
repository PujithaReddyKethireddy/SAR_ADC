module tb_sar_10bit;

reg clk = 0;
always #5 clk = ~clk;   // 100 MHz clock

reg rst;
reg start;
reg comp_out;

wire [9:0] sar_out;
wire done;

// Instantiate DUT
sar_adc_10bit uut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .comp_out(comp_out),
    .sar_out(sar_out),
    .done(done)
);

// ==========================
// DUMP FOR WAVEFORM
// ==========================
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_sar_10bit);
end

// ==========================
// TEST SEQUENCE
// ==========================
initial begin
    $display("Starting SAR ADC Testbench");

    rst = 1;
    start = 0;
    comp_out = 1;

    #10 rst = 0;

    // Start conversion
    #10 start = 1;
    #10 start = 0;

    // Simulate comparator decisions (10 cycles)
    repeat (10) begin
        #10 comp_out = $random % 2;
    end

    // Wait for completion
    #50;

    $display("Final Output = %b", sar_out);

    #20 $finish;
end

endmodule
