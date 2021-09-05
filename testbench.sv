
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
  initial begin
    // ADD
    A = 1;
    B = 1;
    opcode = 6'b100000;
    #1
    if (out == 2) $display("[TEST][PASSED][ADD]");
    else $display("[TEST][FAILED] Bad value for ADD operation %b + %b != %b", A, B, out);
    
    // SUB
    #10
    A = 4;
    B = 1;
    opcode = 6'b100010;
	#1
    if (out == 3) $display("[TEST][PASSED][SUB]");
    else $display("[TEST][FAILED] Bad value for SUB operation %b - %b != %b", A, B, out);
    
    // AND
    #10
    A = 3;
    B = 2;
    opcode = 6'b100100;
	#1
    if (out == 2) $display("[TEST][PASSED][AND]");
    else $display("[TEST][FAILED] Bad value for AND operation %b & %b != %b", A, B, out);
    
    // OR
    #10
    A = 4;
    B = 3;
    opcode = 6'b100101;
	#1
    if (out == 7) $display("[TEST][PASSED][OR]");
    else $display("[TEST][FAILED] Bad value for OR operation %b | %b != %b", A, B, out);
    
    // XOR
    #10
    A = 3;
    B = 1;
    opcode = 6'b100110;
	#1
    if (out == 2) $display("[TEST][PASSED][XOR]");
    else $display("[TEST][FAILED] Bad value for XOR operation %b ^ %b != %b", A, B, out);
    
    // SRA
    #10
    A = 12;
    B = 1;
    opcode = 6'b000011;
	#1
    if (out == 6) $display("[TEST][PASSED][SRA]");
    else $display("[TEST][FAILED] Bad value for SRA operation %b >>> %b != %b", A, B, out);
    
    // SRL
    #10
    A = 12;
    B = 1;
    opcode = 6'b000010;
	#1
    if (out == 6) $display("[TEST][PASSED][SRL]");
    else $display("[TEST][FAILED] Bad value for SRA operation %b >> %b != %b", A, B, out);
    
    // NOR
    #10
    A = {{N_BITS-1{1'b1}}, {1'b0}};
    B = A;
    opcode = 6'b100111;
	#1
    if (out == 1) $display("[TEST][PASSED][NOR]");
    else $display("[TEST][FAILED] Bad value for NOR operation %b ^- %b != %b", A, B, out);
    
  end
  
  // Analysis
  // initial $monitor("time=%2d A=%b, B=%b,opcode=%b, out=%b",$time, A, B,opcode,out);
  
endmodule