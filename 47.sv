//Create a 3-state FSM using typedef enum logic

module fsm_3state(
    input logic clk,
    input logic rst_n,
    input logic start,
    input logic finish,
    output logic done_o
);

typedef enum logic [1:0] {
    ST_IDLE,
    ST_BUSY,
    ST_DONE
} state_t;

state_t state_q, state_d;

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) 
    state_q <= ST_IDLE;
    else
    state_q <= state_d;
end

always_comb begin
    state_d = state_q;

    unique case (state_q)
        ST_IDLE: if (start) state_d = ST_BUSY;
        ST_BUSY: if (finish) state_d = ST_DONE;
        ST_DONE: state_d = ST_IDLE;
        default: state_d = ST_IDLE;
    endcase
end

always_comb begin
    done_o = (state_q == ST_DONE);
end
endmodule

    