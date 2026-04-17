module tb_sar_10bit;

reg clk = 0;
always #5 clk = ~clk;

reg rst, start;
reg comp_out;

wire [9:0] sar_out;
wire done;

sar_adc_10bit uut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .comp_out(comp_out),
    .sar_out(sar_out),
    .done(done)
);

initial begin
    rst = 1; start = 0; comp_out = 1;
    #10 rst = 0;

    #10 start = 1;
    #10 start = 0;

    // simulate comparator decisions
    repeat (10) begin
        #10 comp_out = $random % 2;
    end

    #200 $finish;
end

endmodule
