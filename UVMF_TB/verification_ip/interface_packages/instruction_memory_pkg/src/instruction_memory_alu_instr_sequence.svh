class instruction_memory_alu_instr_sequence extends instruction_memory_responder_sequence;
  `uvm_object_utils( instruction_memory_alu_instr_sequence )

  function new(string name = "instruction_memory_alu_instr_sequence");
    super.new(name);
  endfunction

task body();
   
   req=instruction_memory_transaction::type_id::create("req");
   // Load the Reg File
   start_item(req);
   finish_item(req);
   req.Instr_Dout[15:12] = 4'ha;
   req.Instr_Dout[8:0]  = 9'b101000010;
   for (int i = 0; i<8 ; i ++) begin 
      req.Instr_Dout[11:9]  = i;
      start_item(req);
      finish_item(req);
   end
   
   //ADD 2 source registers
   repeat(600) begin
      req.randomize() with {opcode == ADD;};
      req.Instr_Dout[2:0] = req.src2;
      req.Instr_Dout[5:3] = 3'b000;
      req.Instr_Dout[8:6] = req.src1;
      req.Instr_Dout[11:9] = req.dest;
      req.Instr_Dout[15:12] = req.opcode;

      assert(req.Instr_Dout[15:12] == 4'b0001);
      start_item(req);
      finish_item(req);
   end
   // ADD Source Register and ADD Immediate
   repeat(2200) begin
      req.randomize() with {opcode == ADD;};
      req.Instr_Dout[4:0] = req.imm5;
      req.Instr_Dout[5] = 1'b1;
      req.Instr_Dout[8:6] = req.src1;
      req.Instr_Dout[11:9] = req.dest;
      req.Instr_Dout[15:12] = req.opcode;

      assert(req.Instr_Dout[15:12] == 4'b0001);
      start_item(req);
      finish_item(req);
   end
   // AND 2 source Register
   repeat(600) begin
      req.randomize() with {opcode == AND;};
      req.Instr_Dout[2:0] = req.src2;
      req.Instr_Dout[5:3] = 3'b000;
      req.Instr_Dout[8:6] = req.src1;
      req.Instr_Dout[11:9] = req.dest;
      req.Instr_Dout[15:12] = req.opcode;

      assert(req.Instr_Dout[15:12] == 4'b0101);
      start_item(req);
      finish_item(req);
   end
   // AND Source Register and AND Immediate
   repeat(2200) begin
      req.randomize() with {opcode == AND;};
      req.Instr_Dout[4:0] = req.imm5;
      req.Instr_Dout[5] = 1'b1;
      req.Instr_Dout[8:6] = req.src1;
      req.Instr_Dout[11:9] = req.dest;
      req.Instr_Dout[15:12] = req.opcode;

      assert(req.Instr_Dout[15:12] == 4'b0101);
      start_item(req);
      finish_item(req);
   end
  // NOT operation
   repeat(100) begin
     req.randomize() with {opcode == NOT;};
     req.Instr_Dout[5:0] = 6'b111111;;
     req.Instr_Dout[8:6] = req.src1;
     req.Instr_Dout[11:9] = req.dest;
     req.Instr_Dout[15:12] = req.opcode;

     assert(req.Instr_Dout[15:12] == 4'b1001);
     start_item(req);
     finish_item(req);
  end
endtask
endclass

