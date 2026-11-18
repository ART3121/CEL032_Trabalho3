module register ( // SI PO
    input i,
    input clk,
    input pre,
    input clr,
    output [3:0]q
);

dff u0_dff (
    .d(i),
    .clk(clk),
    .pre(pre),
    .clr(clr),
    .q(q[0])
    );
dff u1_dff (
    .d(q[0]),
    .clk(clk),
    .pre(pre),
    .clr(clr),
    .q(q[1])
);
dff u2_dff (
    .d(q[1]),
    .clk(clk),
    .pre(pre),
    .clr(clr),
    .q(q[2])
);
dff u3_dff (
    .d(q[2]),
    .clk(clk),
    .pre(pre),
    .clr(clr),
    .q(q[3])
);
endmodule
