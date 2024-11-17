//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class records execute_in transaction information using
//       a covergroup named execute_in_transaction_cg.  An instance of this
//       coverage component is instantiated in the uvmf_parameterized_agent
//       if the has_coverage flag is set.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class execute_in_transaction_coverage  extends uvm_subscriber #(.T(execute_in_transaction ));

  `uvm_component_utils( execute_in_transaction_coverage )

  T coverage_trans;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  // ****************************************************************************
  covergroup execute_in_transaction_cg;
    // pragma uvmf custom covergroup begin
    // UVMF_CHANGE_ME : Add coverage bins, crosses, exclusions, etc. according to coverage needs.
    option.auto_bin_max=1024;
    option.per_instance=1;
    E_ctrl: coverpoint coverage_trans.E_ctrl;
    bp_alu_1: coverpoint coverage_trans.bp_alu_1;
    bp_alu_2: coverpoint coverage_trans.bp_alu_2;
    bp_mem_1: coverpoint coverage_trans.bp_mem_1;
    bp_mem_2: coverpoint coverage_trans.bp_mem_2;
    Instr: coverpoint coverage_trans.Instr;
    npc: coverpoint coverage_trans.npc;
    mem_ctrl: coverpoint coverage_trans.mem_ctrl;
    w_ctrl: coverpoint coverage_trans.w_ctrl;
    Mem_bp: coverpoint coverage_trans.Mem_bp;
    vsr1: coverpoint coverage_trans.vsr1;
    vsr2: coverpoint coverage_trans.vsr2;
    // pragma uvmf custom covergroup end
  endgroup

  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new(string name="", uvm_component parent=null);
    super.new(name,parent);
    execute_in_transaction_cg=new;
    `uvm_warning("COVERAGE_MODEL_REVIEW", "A covergroup has been constructed which may need review because of either generation or re-generation with merging.  Please note that transaction variables added as a result of re-generation and merging are not automatically added to the covergroup.  Remove this warning after the covergroup has been reviewed.")
  endfunction

  // ****************************************************************************
  // FUNCTION : build_phase()
  // This function is the standard UVM build_phase.
  //
  function void build_phase(uvm_phase phase);
    execute_in_transaction_cg.set_inst_name($sformatf("execute_in_transaction_cg_%s",get_full_name()));
  endfunction

  // ****************************************************************************
  // FUNCTION: write (T t)
  // This function is automatically executed when a transaction arrives on the
  // analysis_export.  It copies values from the variables in the transaction 
  // to local variables used to collect functional coverage.  
  //
  virtual function void write (T t);
    `uvm_info("COV","Received transaction",UVM_HIGH);
    coverage_trans = t;
    execute_in_transaction_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

