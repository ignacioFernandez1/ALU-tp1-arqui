module test_DUT; // No tiene puertos
  //DUT I/Os
  reg A, B, C, D;
  wire x, y;
  // DUT instantiation 
  modulo_compuerta2 dut(.A(A), .B(B), .C(C), .D(D), .x(x), .y(y)); 
  //Stimulus
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    A = 0; 
  	B = 1; 
  	C = 1;
    D = 1;
    #1
    D = 0;
    #1
    A = 1;

  end
//   Analysis
//   initial $monitor("time=%2d A=%b, B=%b, C=%b, D=%b\n x=%b\n y=%b",$time, A, B,C,D,x,y);
  
endmodule