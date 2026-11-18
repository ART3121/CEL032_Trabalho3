module dff (
    input d,
    input clk,
    input pre,
    input clr,
    output reg q
);
always @(negedge clk or negedge clr or negedge pre) 
begin
if (!clr)
    q <= 0;
else if (!pre)
    q <= 1;
else
    q <= d;
end

endmodule
