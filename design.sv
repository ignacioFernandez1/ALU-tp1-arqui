module ALU
  #(
    parameter BUS_WIDTH,
  )
  (d0, d1, opcode, out);
  
  parameter OPCODE_WIDTH = 6;
  
  // inputs
  input [BUS_WIDTH-1:0] d0;
  input [BUS_WIDTH-1:0] d1;
  input [OPCODE_WIDTH-1:0] opcode;
  
  // outputs
  output [BUS_WIDTH-1:0] out;

  assign out = 10;
  
endmodule