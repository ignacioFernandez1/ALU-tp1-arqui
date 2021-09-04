module alu
  #(
    parameter N_BITS = 8
  )
  (
    input wire [N_BITS-1:0]d0, 
    input wire [N_BITS-1:0]d1, 
    input wire [5:0]opcode, 
    output reg [N_BITS-1:0]out
  );

  always @(*) begin
    case (opcode)
      6'b100000: out = d0 + d1; // add (+)
      6'b100010: out = d0 - d1; // sub (-)
      6'b100100: out = d0 & d1; // and (&)
      6'b100101: out = d0 | d1; // or (|)
      6'b100110: out = d0 ^ d1; // xor (^)
      //sra,srl
      6'b100111: out = ~(d0 | d1); // nor (^-)
      default: out = 8'b0000_0000;
    endcase
  end
  
endmodule