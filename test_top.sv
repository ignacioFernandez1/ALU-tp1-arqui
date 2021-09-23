`timescale 1ns / 1ps


module test_top;   
 
    parameter N_BITS = 8;
      
    reg i_clock = 1;
    reg [N_BITS-1:0] data_bus;
    reg bt_1;
    reg bt_2;
    reg bt_3;
    wire [N_BITS-1:0] leds;

    // DUT instantiation 
    top #(.N_BITS(N_BITS)) dut (.i_clock(i_clock), .data_bus(data_bus), .bt_1(bt_1), .bt_2(bt_2), .bt_3(bt_3), .leds(leds)); 
  
   initial begin
   
        #100
        data_bus = 1;
        bt_1 = 1;
        
        #100 
        
        bt_1 = 0;
        data_bus = 1;
        bt_2 = 1;
       
        #100
        
        bt_2 = 0;
        data_bus = 6'b100000;
        bt_3 = 1;
        
        #100     
        
        $display("Valor leds = %b", leds);
        
        bt_3 = 0; 
        data_bus = 35;
        bt_1 = 1;
        
        #100 
        
        bt_1 = 0;
        data_bus = 20;
        bt_2 = 1;
       
        #100 
        
        bt_2 = 0;
        data_bus = 6'b100010;
        bt_3 = 1;
        
        #100     
        
        $display("Valor leds = %b", leds);
   
        bt_3 = 0; 
        data_bus = 100;
        bt_1 = 1;
        
        #100
        
        bt_1 = 0;  
            
        #3 
        $finish;   
   end
   
   always 
   #20 i_clock = ~i_clock;
   
endmodule
