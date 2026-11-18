`timescale 1ns / 1ps

module tff (
    input t,
    input clk,
    input pre,
    input clr,
    output reg q
);
always @(negedge clk or negedge clr or negedge pre) 
begin
if (!clr)
    q <= 1'd0;
else if (!pre)
    q <= 1'd1;
else if (t)
    q <= ~q;
else
    q <= q;
end

endmodule
