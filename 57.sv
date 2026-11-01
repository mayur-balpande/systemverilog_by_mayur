 //Use modport to separate read/write signals in interface.


 interface simple_bus;
 logic [7:0] addr;
 logic [31:0] write_data;
 logic [31:0] read_data;
 logic read_en;
 logic write_en;
 logic ready;

 modport initiator(
    output addr, write_data, read_en, write_en,
    input read_data, ready
 );

 modport target(
    input addr, write_data, read_en, write_en,
    output read_data, ready
 );
 endinterface