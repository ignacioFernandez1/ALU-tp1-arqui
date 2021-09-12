`timescale 1ns / 1ps

module top  
    #(
    parameter N_BITS = 8
     )
    (
    input wire i_clock,
    input [N_BITS-1:0] data_bus,
    input bt_1,
    input bt_2,
    input bt_3,
    output [N_BITS-1:0] leds
    );
  

  reg [N_BITS-1:0] data_A;
  reg [N_BITS-1:0] data_B;
  reg [5:0] op;
  
  // DUT instantiation 
  alu #(.N_BITS(N_BITS)) dut (.d0(data_A), .d1(data_B), .opcode(op), .out(leds)); 
    
  always @(posedge i_clock) begin: top
    if (bt_1) data_A <= data_bus;
    if (bt_2) data_B <= data_bus;
    if (bt_3) op <= data_bus;
    
  end
          
    
     
endmodule
