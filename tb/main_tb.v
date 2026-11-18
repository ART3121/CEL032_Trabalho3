`timescale 1ns / 1ps

module main_tb;

    reg        e;
    reg        s;
    reg        r;
    reg clk;
    wire       l0_vm;
    wire       l1_vd;
    wire       l2_am;
    wire [3:0] u_7seg;
    wire [3:0] registro;

    main dut (
        .e       (e),
        .s       (s),
        .r       (r),
        .l0_vm   (l0_vm),
        .l1_vd   (l1_vd),
        .l2_am   (l2_am),
        .u_7seg  (u_7seg),
        .registro(registro),
        .clk(clk)
    );
    always #5 clk = ~clk;
    initial begin
        $dumpfile("main_tb.fst");
        $dumpvars(0, main_tb);
        clk = 0;
        s = 1;
        e = 1;
        r = 0;
        #3;
        r = 1;
        e = 0;
        #3;
        e = 1;
        #3;
        s = 0;
        #3;
        s = 1;
        #3;
        s = 0;
        #3;
        s = 1;
        e = 0;
        #3;
        e = 1;


        #100;
        $finish;
    end

endmodule
