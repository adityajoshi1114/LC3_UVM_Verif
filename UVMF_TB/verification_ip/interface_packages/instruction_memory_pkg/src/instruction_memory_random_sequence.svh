//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the instruction_memory transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a instruction_memory_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class instruction_memory_random_sequence 
  extends instruction_memory_sequence_base ;

  `uvm_object_utils( instruction_memory_random_sequence )

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  //*****************************************************************
  function new(string name = "");
    super.new(name);
  endfunction: new

  // ****************************************************************************
  // TASK : body()
  // This task is automatically executed when this sequence is started using the 
  // start(sequencerHandle) task.
  //
  task body();
  
      // Construct the transaction
      req=instruction_memory_transaction::type_id::create("req");
      start_item(req);
      // Randomize the transaction
      if(!req.randomize()) `uvm_fatal("SEQ", "instruction_memory_random_sequence::body()-instruction_memory_transaction randomization failed")
      // Send the transaction to the instruction_memory_driver_bfm via the sequencer and instruction_memory_driver.
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: instruction_memory_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

