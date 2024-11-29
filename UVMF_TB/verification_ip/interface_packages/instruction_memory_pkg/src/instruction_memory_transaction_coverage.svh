//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class records instruction_memory transaction information using
//       a covergroup named instruction_memory_transaction_cg.  An instance of this
//       coverage component is instantiated in the uvmf_parameterized_agent
//       if the has_coverage flag is set.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class instruction_memory_transaction_coverage  extends uvm_subscriber #(.T(instruction_memory_transaction ));

  `uvm_component_utils( instruction_memory_transaction_coverage )

  T coverage_trans;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  // ****************************************************************************
  // covergroup instruction_memory_transaction_cg;
  //   // pragma uvmf custom covergroup begin
  //   // UVMF_CHANGE_ME : Add coverage bins, crosses, exclusions, etc. according to coverage needs.
  //   option.auto_bin_max=1024;
  //   option.per_instance=1;
  //   PC: coverpoint coverage_trans.PC;
  //   Imem_en: coverpoint coverage_trans.Imem_en;
  //   cmp_instr: coverpoint coverage_trans.cmp_instr;
  //   opcode: coverpoint coverage_trans.opcode;
  //   src1: coverpoint coverage_trans.src1;
  //   src2: coverpoint coverage_trans.src2;
  //   dest: coverpoint coverage_trans.dest;
  //   imm5: coverpoint coverage_trans.imm5;
  //   PCoffset9: coverpoint coverage_trans.PCoffset9;
  //   BaseR: coverpoint coverage_trans.BaseR;
  //   cnd_flags: coverpoint coverage_trans.cnd_flags;
  //   Instr_Dout: coverpoint coverage_trans.Instr_Dout;
  //   // pragma uvmf custom covergroup end
  // endgroup

  covergroup alu_cg;
      option.per_instance = 1;
      Instr_dout_bit  : coverpoint coverage_trans.Instr_Dout[5];
      opcode          : coverpoint coverage_trans.opcode;
      src1            : coverpoint coverage_trans.src1;
      src2            : coverpoint coverage_trans.src2;
      dest            : coverpoint coverage_trans.dest;
      imm5            : coverpoint coverage_trans.imm5;
    
    // Cross for Register Adds 
    add_reg_cross : cross src1,src2,dest,opcode,Instr_dout_bit
      {
        ignore_bins b1 = binsof(Instr_dout_bit) intersect {1} || binsof(opcode) intersect {0,[2:15]};
      }

    // Cross for Add immediates
    add_imm_cross : cross src1,imm5,dest,opcode,Instr_dout_bit
      {
        ignore_bins b1 = binsof(Instr_dout_bit) intersect {0} || binsof(opcode) intersect {0,[2:15]};
      }

    // Cross for Register ANDs 
    and_reg_cross : cross src1,src2,dest,opcode,Instr_dout_bit
      {
        ignore_bins b1 = binsof(Instr_dout_bit) intersect {1} || binsof(opcode) intersect {[0:4],[6:15]};
      }

    // Cross for AND immediates
    and_imm_cross : cross src1,imm5,dest,opcode,Instr_dout_bit
      {
        ignore_bins b1 = binsof(Instr_dout_bit) intersect {0} || binsof(opcode) intersect {[0:4],[6:15]};
      }

    // Cross for NOT instructions
    not_cross : cross src1,dest,opcode
      {
        ignore_bins b1 = binsof(opcode) intersect {[0:8],[10:15]};
      }
  endgroup


  covergroup memory_cg;
    option.per_instance = 1;
    opcode    : coverpoint coverage_trans.opcode;
    BaseR     : coverpoint coverage_trans.BaseR;
    PCoffset9 : coverpoint coverage_trans.PCoffset9
    {
      bins all [] = {[0:511]};
    }
    PCoffset6 : coverpoint coverage_trans.PCoffset6;
    dest      : coverpoint coverage_trans.dest;
    src       : coverpoint coverage_trans.src;


    // Cross for load PC relative instructions
    load_PC_rel_cross : cross PCoffset9,dest,opcode
      {
        ignore_bins b2 = binsof(opcode) intersect {[0:1],[3:15]};
      }

    // Cross for load Register relative instructions
    load_reg_rel_cross : cross PCoffset6,dest,opcode,BaseR
      {
        ignore_bins b2 = binsof(opcode) intersect {[0:5],[7:15]};
      }

    // Cross for load indirect instructions
    load_ind_cross : cross PCoffset9,dest,opcode
      {
        ignore_bins b2 = binsof(opcode) intersect {[0:9],[11:15]};
      }

    // Cross for load indirect instructions
    load_eff_addr_cross : cross PCoffset9,dest,opcode
      {
        ignore_bins b2 = binsof(opcode) intersect {[0:13],15};
      }

    // Cross for Store PC relative instructions
    store_PC_rel_cross : cross PCoffset9,src,opcode
      {
        ignore_bins b2 = binsof(opcode) intersect {[0:2],[4:15]};
      }

    // Cross for Store Register relative instructions
    store_reg_rel_cross : cross PCoffset6,src,opcode,BaseR
      {
        ignore_bins b2 = binsof(opcode) intersect {[0:6],[8:15]};
      }

    // Cross for Store indirect instructions
    store_ind_cross : cross PCoffset9,src,opcode
      {
        ignore_bins b2 = binsof(opcode) intersect {[0:10],[12:15]};
      }

  endgroup


  covergroup control_cg;
    option.per_instance = 1;
    opcode    : coverpoint coverage_trans.opcode;
    PCoffset9 : coverpoint coverage_trans.PCoffset9
    {
      bins all [] = {[0:511]};
    }
    cnd_flags : coverpoint coverage_trans.cnd_flags;
    BaseR     : coverpoint coverage_trans.BaseR;

    // Cross for Branch instructions
    branch_cross : cross PCoffset9,cnd_flags,opcode
      {
        ignore_bins b3 = binsof(opcode) intersect {[1:15]};
      }

    // Cross for Jump instructions
    jump_cross : cross BaseR,opcode
      {
        ignore_bins b3 = binsof(opcode) intersect {[0:11],[13:15]};
      }
  endgroup

  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new(string name="", uvm_component parent=null);
    super.new(name,parent);
    //instruction_memory_transaction_cg=new;
    alu_cg=new;
    memory_cg=new;
    control_cg=new;
    `uvm_warning("COVERAGE_MODEL_REVIEW", "A covergroup has been constructed which may need review because of either generation or re-generation with merging.  Please note that transaction variables added as a result of re-generation and merging are not automatically added to the covergroup.  Remove this warning after the covergroup has been reviewed.")
  endfunction

  // ****************************************************************************
  // FUNCTION : build_phase()
  // This function is the standard UVM build_phase.
  //
  function void build_phase(uvm_phase phase);
    alu_cg.set_inst_name($sformatf("ALU_transaction_cg_%s",get_full_name()));
    memory_cg.set_inst_name($sformatf("Memory_transaction_cg_%s",get_full_name()));
    control_cg.set_inst_name($sformatf("Control_transaction_cg_%s",get_full_name()));
    //instruction_memory_transaction_cg.set_inst_name($sformatf("instruction_memory_transaction_cg_%s",get_full_name()));
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
    //instruction_memory_transaction_cg.sample();
    alu_cg.sample();
    memory_cg.sample();
    control_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end


