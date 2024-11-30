//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class can be used to provide stimulus when an interface
//              has been configured to run in a responder mode. It
//              will never finish by default, always going back to the driver
//              and driver BFM for the next transaction with which to respond.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class instruction_memory_control_instr_sequence
  extends instruction_memory_responder_sequence ;

  `uvm_object_utils( instruction_memory_control_instr_sequence )

  // pragma uvmf custom class_item_additional begin
    // Do not make a memory model - you will miss out on coverage due to backward branches 
  // pragma uvmf custom class_item_additional end

  function new(string name = "instruction_memory_control_instr_sequence");
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
        
    //BR instrunctions (512x7)
    repeat(3584) begin
    req.randomize() with {opcode == BR;};
    req.Instr_Dout[8:0] = req.PCoffset9;
    req.Instr_Dout[11:9] = req.cnd_flags;
    req.Instr_Dout[15:12] = req.opcode;

    assert(req.Instr_Dout[15:12] == 4'b0000);
    
    start_item(req);
    finish_item(req);
    end


    //JUMP Instructions (8)
    repeat(8) begin
    req.randomize() with {opcode == JMP;};
    req.Instr_Dout[5:0] = 6'b000000;
    req.Instr_Dout[8:6] = req.BaseR;
    req.Instr_Dout[11:9] = 3'b000;
    req.Instr_Dout[15:12] = req.opcode;

    assert(req.Instr_Dout[15:12] == 4'b1100);
    
    start_item(req);
    finish_item(req);
    end
      // pragma uvmf custom body end
    //end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

