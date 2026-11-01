//Write a state machine using typedef enum with unique case

module fsm_controller(
    input logic clk,
    input logic rst_n,
    input logic start,
    input logic finish,
    output logic done
);

typedef enum logic [1:0]{
    IDLE,
    BUSY,
    COMPLETE
} state_t;

state_t state_q, state_d;

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n)
    state_q <= IDLE;
    else
    state_q <= state_d;
end

always_comb begin
    state_d = state_q;
    unique case (state_q)
        IDLE: if (start) state_d = BUSY;
        BUSY: if (finish) state_d = COMPLETE;
        COMPLETE: state_d = IDLE;
        default: state_d = IDLE;
    endcase
    done = (state_q == COMPLETE);
end
endmodule