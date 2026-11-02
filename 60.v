typedef struct packed {
  logic        enable;
  logic [31:0] timeout_cycles;
} watchdog_cfg_t;

module watchdog_timer (
  input  logic         clk,
  input  logic         rst_n,
  input  logic         kick,
  input  watchdog_cfg_t cfg,
  output logic         timeout_o
);

  logic [31:0] count_q;

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      count_q   <= '0;
      timeout_o <= 1'b0;
    end else if (!cfg.enable || kick) begin
      count_q   <= '0;
      timeout_o <= 1'b0;
    end else if (!timeout_o) begin
      if (cfg.timeout_cycles == 0) begin
        count_q   <= '0;
        timeout_o <= 1'b1;
      end else if (count_q >= cfg.timeout_cycles - 1'b1) begin
        count_q   <= '0;
        timeout_o <= 1'b1;
      end else begin
        count_q <= count_q + 1'b1;
      end
    end
  end

endmodule