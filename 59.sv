// Code a 4:2 priority encoder using case with unique  

module priority_encoder(
    input logic [3:0] req,
    output logic valid,
    output logic [1:0] code
);

always_comb begin
    valid = 1'b1;
    code = 2'b00;

    unique casez (req)
        4'b1???: code = 2'b11;
        4'b01??: code = 2'b10;
        4'b001?: code = 2'b01;
        4'b0001: code = 2'b00;
        default: begin
            valid = 1'b0;
            code = 2'b00;
        end
    endcase
end
endmodule

