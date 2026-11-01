//Ques--> How do you use modport inside an interface?

//Declare modports inside the interface, then specify the appropriate modport in each module’s 
//interface port declaration. Directions are from the connected module’s perspective.


interface handshake_if;
  logic req;
  logic grant;

  modport initiator (
    output req,
    input  grant
  );

  modport target (
    input  req,
    output grant
  );
endinterface

module initiator_module(handshake_if.initiator bus);
  // Drives bus.req and reads bus.grant
endmodule

module target_module(handshake_if.target bus);
  // Reads bus.req and drives bus.grant
endmodule
//A modport defines how a module may access the interface signals; 
//it does not create or drive the signals itself.