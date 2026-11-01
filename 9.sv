//Ques--> How do you use covergroup in SystemVerilog?

//A covergroup collects functional coverage from sampled values. 
//Define coverpoints for the signals or variables to track, 
//then define bins for the values or ranges you want to cover.

module coverage_example (
  input logic       clk,
  input logic [1:0] opcode
);

  covergroup opcode_cg_t @(posedge clk);
    cp_opcode: coverpoint opcode {
      bins idle  = {2'b00};
      bins read  = {2'b01};
      bins write = {2'b10};
      bins other = {2'b11};
    }
  endgroup

  opcode_cg_t opcode_cg = new();

endmodule


//The covergroup instance samples opcode on each rising edge of clk. 
//For explicit sampling, define the covergroup without an event and call opcode_cg.sample() 
//at the desired observation point.