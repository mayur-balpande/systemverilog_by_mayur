//Design a clock divider by N using parameter.

module clock_divider #( parameter N = 2)(
    input logic clk,
    input logic rst_n,
    output wire clk_div
);

localparam int unsigned COUNT_W = (N <= 1) ? 1 : $clog2(N);
localparam int unsigned LOW_CYCLES = (N + 1) / 2;
localparam int unsigned HIGH_CYCLES = N / 2;

generate
    if (N == 1) begin : gen_bypass
        assign clk_div = clk;
    end 
    else begin : gen_divider
        logic [COUNT_W-1:0] count_q;
        logic clk_div_q;

        assign clk_div = clk_div_q;
        always_ff @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                count_q <= '0;
                clk_div_q <= 1'b0;
            end
            else if (!clk_div_q && (count_q == LOW_CYCLES -1 ) || (clk_div_q && count_q == HIGH_CYCLES -1)) begin
                count_q <= '0;
                clk_div_q <= ~clk_div_q;
            end 
            else begin
                count_q <= count_q + 1'b1;
            end
        end
    end
    
endgenerate
endmodule