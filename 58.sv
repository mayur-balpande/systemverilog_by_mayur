//Model a bus arbiter using typedef enum logic.

module bus_arbiter(
    input logic clk,
    input logic rst_n,
    input logic req0,
    input logic req1,
    input logic transfer_done,
    output logic gnt0,
    output logic gnt1
);

typedef enum logic [1:0] {
    IDLE,
    MASTER0,
    MASTER1
} arb_state_t;

arb_state_t state_q, state_d;

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n)
    state_q <= IDLE;
    else
    state_q <= state_d;
end

always_comb begin
    state_d = state_q;
    gnt0 = 1'b0;
    gnt1 = 1'b0;
    unique case(state_q)
        IDLE: begin
            if (req0) state_d = MASTER0;
            else if (req1) state_d = MASTER1;
        end

        MASTER0: begin
            gnt0 = 1'b1;
            if (transfer_done) state_d = IDLE;
        end

        MASTER1: begin
            gnt1 = 1'b1;
            if (transfer_done) state_d = IDLE;
        end

        default: state_d = IDLE;
    endcase
end
endmodule