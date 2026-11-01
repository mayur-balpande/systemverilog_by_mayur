//Override a module parameter in its instance’s parameter list. 
//Named assignment is usually clearest:

module sized_value #(
  parameter int WIDTH = 8
) (
  output logic [WIDTH-1:0] value
);
  assign value = '0;
endmodule

logic [15:0] value;

sized_value #(.WIDTH(16)) u_value (
  .value(value)
);

//The instance uses WIDTH = 16 instead of the default value 8. 
//Positional parameter assignment is also allowed, but named assignment makes the mapping explicit. 
//A localparam cannot be overridden.