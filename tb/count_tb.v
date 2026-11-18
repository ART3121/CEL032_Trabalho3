`timescale 1ns / 1ps

module count_tb;

    reg        ud;
    reg        clk;
    reg        clr;
    wire [3:0] q;

    c_ud_13 dut (
        .ud (ud),
        .clk(clk),
        .clr(clr),
        .q  (q)
    );

    // Clock de 10 ns.
    always #5 clk = ~clk;

    initial begin
        $dumpfile("count_tb.fst");
        $dumpvars(0, count_tb);
        clr = 0;
        clk = 0;
        ud = 1;
        #3;
        clr = 1;
        #60;
        ud = 0;
        #150;
        $finish;
    end

endmodule
