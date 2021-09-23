`timescale 1ns / 1ps


module test_DUT;
  
  parameter N_BITS = 8;
  
  //DUT I/Os
  reg [N_BITS-1:0]A;
  reg [N_BITS-1:0]B;
  reg [5:0]opcode;
  wire [N_BITS-1:0]out;
  
  // DUT instantiation 
  alu #(.N_BITS(N_BITS)) dut (.d0(A), .d1(B), .opcode(opcode), .out(out)); 
  
  //Stimulus
    integer seed;

  initial begin
    //ADD
    #10
    seed = $urandom();
    $srandom(seed);
    
    A = $urandom % 128;
    B = $urandom % 128;
    opcode = 6'b100000;
    $display("A %d, B: %d",A,B);
    #100
    if (out == A + B) $display("[TEST][PASSED][ADD] %d + %d = %d",A, B, out);
    else $display("[TEST][FAILED] Bad value for ADD operation %b + %b != %b", A, B, out);
    
    // SUB
    #100
    A = $urandom % 128;
    B = $urandom % 128;
    opcode = 6'b100010;
	#100
    if (out == A - B) $display("[TEST][PASSED][SUB] %d - %d = %d",A, B, out);
    else $display("[TEST][FAILED] Bad value for SUB operation %b - %b != %b", A, B, out);
    
    // AND
    #100
    A = $urandom % 128;
    B = $urandom % 128;
    opcode = 6'b100100;
	#100
	
    if (out == (A & B)) $display("[TEST][PASSED][AND] %b & %b = %b",A, B, out);
    else $display("[TEST][FAILED] Bad value for AND operation %b & %b != %b",A, B, out);
    
    // OR
    #100
    A = $urandom % 128;
    B = $urandom % 128;
    opcode = 6'b100101;
	#100
    if (out == (A | B)) $display("[TEST][PASSED][OR] %b | %b = %b",A, B, out);
    else $display("[TEST][FAILED] Bad value for OR operation %b | %b != %b", A, B, out);
    
    // XOR
    #100
    A = $urandom % 128;
    B = $urandom % 128;
    opcode = 6'b100110;
	#100
    if (out == (A ^ B)) $display("[TEST][PASSED][XOR] %b ^ %b = %b",A, B, out);
    else $display("[TEST][FAILED] Bad value for XOR operation %b ^ %b != %b", A, B, out);
    
    // SRA
    #100
    A = $urandom % 128;
    B = $urandom % 128;
    opcode = 6'b000011;
	#100
    if (out ==(A >>> B)) $display("[TEST][PASSED][SRA] %b >>> %b = %b",A, B, out);
    else $display("[TEST][FAILED] Bad value for SRA operation %b >>> %b != %b", A, B, out);
    
    // SRL
    #100
    A = $urandom % 128;
    B = $urandom % 128;
    opcode = 6'b000010;
	#100
    if (out == (A >> B)) $display("[TEST][PASSED][SRL] %b >> %b = %b",A, B, out);
    else $display("[TEST][FAILED] Bad value for SRA operation %b >> %b != %b", A, B, out);
    
    // NOR
    #100
    A = $urandom % 128;
    B = $urandom % 128;
    opcode = 6'b100111;
	#100
    if (out == ~(A | B)) $display("[TEST][PASSED][NOR] %b ^- %b = %b",A, B, out);
    else $display("[TEST][FAILED] Bad value for NOR operation %b ^- %b != %b ", A, B, out);
    
    #100 
    $finish;
    
  end
  
  // Analysis
  // initial $monitor("time=%2d A=%b, B=%b,opcode=%b, out=%b",$time, A, B,opcode,out);
  
endmodule