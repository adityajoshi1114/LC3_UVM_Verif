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
class instruction_memory_responder_sequence 
  extends instruction_memory_sequence_base ;

  `uvm_object_utils( instruction_memory_responder_sequence )

  // pragma uvmf custom class_item_additional begin
    // Do not make a memory model - you will miss out on coverage due to backward branches 
  // pragma uvmf custom class_item_additional end

  function new(string name = "instruction_memory_responder_sequence");
    super.new(name);
  endfunction

  virtual task body();
    req=instruction_memory_transaction::type_id::create("req");
    //forever begin
      start_item(req);
      finish_item(req);
      // pragma uvmf custom body begin
      // UVMF_CHANGE_ME : Do something here with the resulting req item.  The
      // finish_item() call above will block until the req transaction is ready
      // to be handled by the responder sequence.
      // If this was an item that required a response, the expectation is
      // that the response should be populated within this transaction now.
      `uvm_info("SEQ",$sformatf("Processed txn: %s",req.convert2string()),UVM_HIGH)
      
      // Fill in Reg File
      req.Instr_Dout[15:12] = 4'ha;
      req.Instr_Dout[8:0]  = 9'b101000010;
      for (int i = 0; i<8 ; i ++) begin 
        req.Instr_Dout[11:9]  = i;
        start_item(req);
        finish_item(req);
      end

      // Do add Imm on all Regs to check
      req.Instr_Dout[15:12] = 4'h1;
      req.Instr_Dout[5] = 1'b1;
      req.Instr_Dout[11:9] = 3'b000;
      for (int i = 0; i<8; i++) begin  
        req.Instr_Dout[8:6] = i;
        start_item(req);
        finish_item(req);
      end

      // pragma uvmf custom body end
    
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

