module top_level (
    input        entry,
    input        out,
    input        rst,
    input        clk,
    output       LED_VM,
    output       LED_VD,
    output       LED_AM,
    output [3:0] u_7seg,
    output [3:0] registro

);

    wire o = ~(u_7seg[0] | u_7seg[1] | u_7seg[2] | u_7seg[3]); // 1 se estacionamento vazio
    wire l = ~u_7seg[0] & ~u_7seg[1] & u_7seg[2] & u_7seg[3]; // 1 se estacionamento lotado

    wire e0 = ~(entry | l); // entrada autorizada = 1
    wire s0 = ~(out | o); // saida autorizada   = 1


    assign LED_VM = l;         // LED vermelho, lotado
    assign LED_AM = o;         // LED amarelo , vazio
    assign LED_VD = ~(l | o);  // LED verde

    register u0_reg ( // registrador 4 bits SIPO
        .i(e0),
        .clk(s0 ^ e0),
        .clr(r),
        .pre(1'd1),
        .q(registro[3:0])
    );

    c_ud_13 u0_cud13 ( // contador U/D MOD13
        .ud(e0),
        .clk(s0 ^ e0),
        .clr(r),
        .q(u_7seg[3:0])
    );

endmodule
