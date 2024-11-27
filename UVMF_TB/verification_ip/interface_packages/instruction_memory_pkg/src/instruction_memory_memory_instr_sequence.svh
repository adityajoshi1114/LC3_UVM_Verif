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
class instruction_memory_memory_instr_sequence
  extends instruction_memory_responder_sequence ;

  `uvm_object_utils( instruction_memory_memory_instr_sequence )

  // pragma uvmf custom class_item_additional begin
    // Do not make a memory model - you will miss out on coverage due to backward branches 
  // pragma uvmf custom class_item_additional end

  function new(string name = "instruction_memory_memory_instr_sequence");
    super.new(name);
  endfunction

  task body();
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
      
      //`uvm_info("SEQ",$sformatf("Processed txn: %s",req.convert2string()),UVM_HIGH)


        //LD instrunctions (512x8)
        repeat(4096) begin
        req.randomize() with {opcode == LD;};
        req.Instr_dout[8:0] = req.PCOffset9;
        req.Instr_dout[11:9] = req.dest;
        req.Instr_dout[15:12] = req.opcode;

        assert(Instr_dout[15:12] == 4'b0010) else $error("LD Opcode is not set");
        
        start_item(req);
        finish_item(req);
        end


        //LDR instrunctions (64x8x8)
        repeat(4096) begin
        req.randomize() with {opcode == LDR;};
        req.Instr_dout[5:0] = req.PCoffset6;
        eq.Instr_dout[8:6] = req.BaseR;
        req.Instr_dout[11:9] = req.dest;
        req.Instr_dout[15:12] = req.opcode;

        assert(Instr_dout[15:12] == 4'b0110) else $error("LDR Opcode is not set");
        
        start_item(req);
        finish_item(req);
        end


        //LDI instrunctions (512x8)
        repeat(4096) begin
        req.randomize() with {opcode == LDI;};
        req.Instr_dout[8:0] = req.PCOffset9;
        req.Instr_dout[11:9] = req.dest;
        req.Instr_dout[15:12] = req.opcode;

        assert(Instr_dout[15:12] == 4'b1010) else $error("LDI Opcode is not set");
        
        start_item(req);
        finish_item(req);
        end

        //LDA instrunctions (512x8)
        repeat(4096) begin
        req.randomize() with {opcode == LDA;};
        req.Instr_dout[8:0] = req.PCOffset9;
        req.Instr_dout[11:9] = req.dest;
        req.Instr_dout[15:12] = req.opcode;

        assert(Instr_dout[15:12] == 4'b1110) else $error("LDA Opcode is not set");
        
        start_item(req);
        finish_item(req);
        end


        //ST instrunctions (512x8)
        repeat(4096) begin
        req.randomize() with {opcode == ST;};
        req.Instr_dout[8:0] = req.PCOffset9;
        req.Instr_dout[11:9] = req.src;
        req.Instr_dout[15:12] = req.opcode;

        assert(Instr_dout[15:12] == 4'b0011) else $error("ST Opcode is not set");
        
        start_item(req);
        finish_item(req);
        end


        //STR instrunctions (64x8x8)
        repeat(4096) begin
        req.randomize() with {opcode == STR;};
        req.Instr_dout[5:0] = req.PCoffset6;
        req.Instr_dout[8:6] = req.BaseR;
        req.Instr_dout[11:9] = req.src;
        req.Instr_dout[15:12] = req.opcode;

        assert(Instr_dout[15:12] == 4'b0111) else $error("STR Opcode is not set");
        
        start_item(req);
        finish_item(req);
        end

        //STI instrunctions (512x8)
        repeat(4096) begin
        req.randomize() with {opcode == STI;};
        req.Instr_dout[8:0] = req.PCOffset9;
        req.Instr_dout[11:9] = req.src;
        req.Instr_dout[15:12] = req.opcode;

        assert(Instr_dout[15:12] == 4'b1011) else $error("STI Opcode is not set");
        
        start_item(req);
        finish_item(req);
        end


      // pragma uvmf custom body end
    //end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

