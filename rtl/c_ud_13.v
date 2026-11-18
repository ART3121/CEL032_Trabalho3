`timescale 1ns / 1ps

module c_ud_13 (
    input  ud, // high up, low down
    input clk, // low
    input clr, // low
    output [3:0]q
);
    wire rst = ~(q[3] & q[2] & q[0]); // 13_10 => 1101_2 ; 
    tff u_tff0 (
        .q(q[0]),
        .clr(clr & rst),
        .pre(1'd1),
        .t(1'd1),
        .clk(clk)
    );
    tff u_tff1 (
        .q(q[1]),
        .clr(clr & rst),
        .t((ud & q[0]) | ~(ud | q[0])),
        .pre(1'd1),
        .clk(clk)
    );
    tff u_tff2 (
        .q(q[2]),
        .clr(clr & rst),
        .pre(1'd1),
        .t((ud & q[0] & q[1]) | ~(ud | q[0] | q[1])),
        .clk(clk)
    );
    tff u_tff3 (
        .q(q[3]),
        .clr(clr & rst),
        .pre(1'd1),
        .t((ud &  q[0] & q[1] & q[2]) | ~(ud | q[0] | q[1] | q[2])),
        .clk(clk)
    );
endmodule
