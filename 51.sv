//Create a packed struct for a packet header

typedef struct packed {
    logic [3:0] version;
    logic [3:0] packet_type;
    logic [7:0] flages;
    logic [15:0] payload_length;
    logic [15:0] source_id;
    logic [15:0] destination_id;
}
packet_header_t;