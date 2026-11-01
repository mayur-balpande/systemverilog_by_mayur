//Write a D flip-flop with synchronous reset using always_ff.

module dff_sync(
    input logic clk,
    input logic rst_n,
    input logic d,
    output logic q
);

always_ff @(posedge clk) begin
    if (!rst_n) begin
        q <= 1'b0;
    end
    else begin
        q <= d;
    end
end
endmodule