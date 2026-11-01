//Create a 2:1 mux using always_comb.


module mux_2x1(
    input logic a,
    input logic b,
    input logic sel,
    output logic y
);

always_comb begin
    case (sel)
        1'b0: y = a;
        1'b1: y = b;
        default: y = 1'bx;
    endcase
end
endmodule