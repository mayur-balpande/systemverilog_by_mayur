//Create an interface for a simple AXI-lite bus

interface axi_lite_if #(
    parameter int ADDR_WIDTH = 32,
    parameter int DATA_WIDTH = 32
);
    logic ACLK;
    logic ARESETn;

    logic [ADDR_WIDTH-1:0] AWADDR;
    logic [2:0] AWPROT;
    logic AWVALID;
    logic AWREADY;

    logic [DATA_WIDTH-1:0] WDATA;
    logic [DATA_WIDTH/8-1:0] WSTRB;
    logic WVALID;
    logic WREADY;

    logic[1:0] BRESP;
    logic BVALID;
    logic BREADY;

    logic [ADDR_WIDTH-1:0] ARADDR;
    logic [2:0] ARPROT;
    logic ARVALID;
    logic ARREADY;

    logic [DATA_WIDTH-1:0] RDATA;
    logic [1:0] RRESP;
    logic RVALID;
    logic RREADY;

    modport master(
        input ACLK, ARESETn,
        output AWADDR, AWPROT, AWVALID, 
        input AWREADY,
        output WDATA, WSTRB, WVALID,
        input WREADY,
        input BRESP, BVALID,
        output BREADY,
        output ARADDR, ARPROT, ARVALID,
        input ARREADY,
        input RDATA, RRESP, RVALID,
        output RREADY
    );

    modport slave (
        input ACLK, ARESETn,
        input AWADDR, AWPROT, AWVALID,
        output AWREADY,
        input WDATA, WSTRB, WVALID,
        output WREADY,
        output BRESP, BVALID,
        input BREADY,
        input ARADDR, ARPROT, ARVALID,
        output ARREADY,
        output RDATA, RRESP, RVALID,
        input RREADY
    );

endinterface

