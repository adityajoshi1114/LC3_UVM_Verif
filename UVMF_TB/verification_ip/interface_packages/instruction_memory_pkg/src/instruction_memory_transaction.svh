//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class defines the variables required for an instruction_memory
//    transaction.  Class variables to be displayed in waveform transaction
//    viewing are added to the transaction viewing stream in the add_to_wave
//    function.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class instruction_memory_transaction  extends uvmf_transaction_base;

  `uvm_object_utils( instruction_memory_transaction )

  bit [15:0] PC ;
  bit Imem_en ;
  bit cmp_instr ;
  rand opcode_t opcode ;
  rand reg_t src1 ;
  rand reg_t src2 ;
  rand reg_t dest ;
  rand reg_t src ;
  rand bit [4:0] imm5 ;
  rand bit [8:0] PCoffset9 ;
  rand bit [5:0] PCoffset6 ;
  rand reg_t BaseR ;
  rand nzp_t cnd_flags ;
  bit [15:0] Instr_Dout ;

  //Constraints for the transaction variables:

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new( string name = "" );
    super.new( name );
  endfunction

  // ****************************************************************************
  // FUNCTION: convert2string()
  // This function converts all variables in this class to a single string for 
  // logfile reporting.
  //
  virtual function string convert2string();
    // pragma uvmf custom convert2string begin
    // UVMF_CHANGE_ME : Customize format if desired.
    return $sformatf("PC:0x%x Imem_en:0x%x cmp_instr:0x%x opcode:0x%x src1:0x%x src2:0x%x dest:0x%x imm5:0x%x PCoffset9:0x%x BaseR:0x%x cnd_flags:0x%x Instr_Dout:0x%x ",PC,Imem_en,cmp_instr,opcode,src1,src2,dest,imm5,PCoffset9,BaseR,cnd_flags,Instr_Dout);
    // pragma uvmf custom convert2string end
  endfunction

  //*******************************************************************
  // FUNCTION: do_print()
  // This function is automatically called when the .print() function
  // is called on this class.
  //
  virtual function void do_print(uvm_printer printer);
    // pragma uvmf custom do_print begin
    // UVMF_CHANGE_ME : Current contents of do_print allows for the use of UVM 1.1d, 1.2 or P1800.2.
    // Update based on your own printing preference according to your preferred UVM version
    $display(convert2string());
    // pragma uvmf custom do_print end
  endfunction

  //*******************************************************************
  // FUNCTION: do_compare()
  // This function is automatically called when the .compare() function
  // is called on this class.
  //
  virtual function bit do_compare (uvm_object rhs, uvm_comparer comparer);
    instruction_memory_transaction  RHS;
    if (!$cast(RHS,rhs)) return 0;
    // pragma uvmf custom do_compare begin
    // UVMF_CHANGE_ME : Eliminate comparison of variables not to be used for compare
    return (super.do_compare(rhs,comparer)
            &&(this.PC == RHS.PC)
            &&(this.Imem_en == RHS.Imem_en)
            &&(this.cmp_instr == RHS.cmp_instr)
            &&(this.opcode == RHS.opcode)
            &&(this.src1 == RHS.src1)
            &&(this.src2 == RHS.src2)
            &&(this.dest == RHS.dest)
            &&(this.imm5 == RHS.imm5)
            &&(this.PCoffset9 == RHS.PCoffset9)
            &&(this.BaseR == RHS.BaseR)
            &&(this.cnd_flags == RHS.cnd_flags)
            &&(this.Instr_Dout == RHS.Instr_Dout)
            );
    // pragma uvmf custom do_compare end
  endfunction

  //*******************************************************************
  // FUNCTION: do_copy()
  // This function is automatically called when the .copy() function
  // is called on this class.
  //
  virtual function void do_copy (uvm_object rhs);
    instruction_memory_transaction  RHS;
    if(!$cast(RHS,rhs))begin
      `uvm_fatal("CAST","Transaction cast in do_copy() failed!")
    end
    // pragma uvmf custom do_copy begin
    super.do_copy(rhs);
    this.PC = RHS.PC;
    this.Imem_en = RHS.Imem_en;
    this.cmp_instr = RHS.cmp_instr;
    this.opcode = RHS.opcode;
    this.src1 = RHS.src1;
    this.src2 = RHS.src2;
    this.dest = RHS.dest;
    this.imm5 = RHS.imm5;
    this.PCoffset9 = RHS.PCoffset9;
    this.BaseR = RHS.BaseR;
    this.cnd_flags = RHS.cnd_flags;
    this.Instr_Dout = RHS.Instr_Dout;
    // pragma uvmf custom do_copy end
  endfunction

  // ****************************************************************************
  // FUNCTION: add_to_wave()
  // This function is used to display variables in this class in the waveform 
  // viewer.  The start_time and end_time variables must be set before this 
  // function is called.  If the start_time and end_time variables are not set
  // the transaction will be hidden at 0ns on the waveform display.
  // 
  virtual function void add_to_wave(int transaction_viewing_stream_h);
    `ifdef QUESTA
    if (transaction_view_h == 0) begin
      transaction_view_h = $begin_transaction(transaction_viewing_stream_h,"instruction_memory_transaction",start_time);
    end
    super.add_to_wave(transaction_view_h);
    // pragma uvmf custom add_to_wave begin
    // UVMF_CHANGE_ME : Color can be applied to transaction entries based on content, example below
    // case()
    //   1 : $add_color(transaction_view_h,"red");
    //   default : $add_color(transaction_view_h,"grey");
    // endcase
    // UVMF_CHANGE_ME : Eliminate transaction variables not wanted in transaction viewing in the waveform viewer
    $add_attribute(transaction_view_h,PC,"PC");
    $add_attribute(transaction_view_h,Imem_en,"Imem_en");
    $add_attribute(transaction_view_h,cmp_instr,"cmp_instr");
    $add_attribute(transaction_view_h,opcode,"opcode");
    $add_attribute(transaction_view_h,src1,"src1");
    $add_attribute(transaction_view_h,src2,"src2");
    $add_attribute(transaction_view_h,dest,"dest");
    $add_attribute(transaction_view_h,imm5,"imm5");
    $add_attribute(transaction_view_h,PCoffset9,"PCoffset9");
    $add_attribute(transaction_view_h,BaseR,"BaseR");
    $add_attribute(transaction_view_h,cnd_flags,"cnd_flags");
    $add_attribute(transaction_view_h,Instr_Dout,"Instr_Dout");
    // pragma uvmf custom add_to_wave end
    $end_transaction(transaction_view_h,end_time);
    $free_transaction(transaction_view_h);
    `endif // QUESTA
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

