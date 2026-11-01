//Write a 4-bit adder using typedef struct packed.

package adder_types_pkg;
typedef struct packed {
    logic [3:0] a;
    logic [3:0] b;
} adder_operands_t;

typedef struct packed {
    logic carry;
    logic [3:0] sum;
}
   adder_result_t; 
endpackage

module adder_4bit(
    input adder_types_pkg::adder_operands_t operands,
    output var adder_types_pkg::adder_result_t result);

always_comb begin
    {result.carry, result.sum} = {1'b0, operands.a} + {1'b0, operands.b};
end
endmodule