`timescale 1ns / 1ps

module register_tb;

    reg        i;
    reg        clk;
    reg        pre;
    reg        clr;
    wire [3:0] q;

    register dut (
        .i  (i),
        .clk(clk),
        .pre(pre),
        .clr(clr),
        .q  (q)
    );

    // Clock de 10 ns.
    always #5 clk = ~clk;

    initial begin
        $dumpfile("register_tb.fst");
        $dumpvars(0, register_tb);
        clk = 0;
        pre = 1;
        clr = 0;
        i = 1;
        #5;
        clr = 1;
        #5;
        i = 0;
        #5;
        i = 0;
        #5;
        i = 1;
        #5;
        i = 0;
        #15;
        i = 1;
        #15;
        #100;
        $finish;
    end

endmodule
