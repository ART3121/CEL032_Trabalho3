module counter_md13 (
    input             clk,
    input             rst_n,   
    output reg  [3:0] count    
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= 4'd0;
        end else if (count == 4'd12) begin
            count <= 4'd0;
        end else begin
            count <= count + 4'd1;
        end
    end

endmodule