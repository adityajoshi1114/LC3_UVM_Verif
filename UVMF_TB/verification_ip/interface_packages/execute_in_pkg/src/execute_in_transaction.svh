//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class defines the variables required for an execute_in
//    transaction.  Class variables to be displayed in waveform transaction
//    viewing are added to the transaction viewing stream in the add_to_wave
//    function.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class execute_in_transaction  extends uvmf_transaction_base;

  `uvm_object_utils( execute_in_transaction )

  bit [5:0] E_ctrl ;
  bit bp_alu_1 ;
  bit bp_alu_2 ;
  bit bp_mem_1 ;
  bit bp_mem_2 ;
  bit [15:0] Instr ;
  bit [15:0] npc ;
  bit mem_ctrl ;
  bit [1:0] w_ctrl ;
  bit [15:0] Mem_bp ;
  bit [15:0] vsr1 ;
  bit [15:0] vsr2 ;

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
    return $sformatf("E_ctrl:0x%x bp_alu_1:0x%x bp_alu_2:0x%x bp_mem_1:0x%x bp_mem_2:0x%x Instr:0x%x npc:0x%x mem_ctrl:0x%x w_ctrl:0x%x Mem_bp:0x%x vsr1:0x%x vsr2:0x%x ",E_ctrl,bp_alu_1,bp_alu_2,bp_mem_1,bp_mem_2,Instr,npc,mem_ctrl,w_ctrl,Mem_bp,vsr1,vsr2);
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
    execute_in_transaction  RHS;
    if (!$cast(RHS,rhs)) return 0;
    // pragma uvmf custom do_compare begin
    // UVMF_CHANGE_ME : Eliminate comparison of variables not to be used for compare
    return (super.do_compare(rhs,comparer)
            &&(this.E_ctrl == RHS.E_ctrl)
            &&(this.bp_alu_1 == RHS.bp_alu_1)
            &&(this.bp_alu_2 == RHS.bp_alu_2)
            &&(this.bp_mem_1 == RHS.bp_mem_1)
            &&(this.bp_mem_2 == RHS.bp_mem_2)
            &&(this.Instr == RHS.Instr)
            &&(this.npc == RHS.npc)
            &&(this.mem_ctrl == RHS.mem_ctrl)
            &&(this.w_ctrl == RHS.w_ctrl)
            &&(this.Mem_bp == RHS.Mem_bp)
            &&(this.vsr1 == RHS.vsr1)
            &&(this.vsr2 == RHS.vsr2)
            );
    // pragma uvmf custom do_compare end
  endfunction

  //*******************************************************************
  // FUNCTION: do_copy()
  // This function is automatically called when the .copy() function
  // is called on this class.
  //
  virtual function void do_copy (uvm_object rhs);
    execute_in_transaction  RHS;
    if(!$cast(RHS,rhs))begin
      `uvm_fatal("CAST","Transaction cast in do_copy() failed!")
    end
    // pragma uvmf custom do_copy begin
    super.do_copy(rhs);
    this.E_ctrl = RHS.E_ctrl;
    this.bp_alu_1 = RHS.bp_alu_1;
    this.bp_alu_2 = RHS.bp_alu_2;
    this.bp_mem_1 = RHS.bp_mem_1;
    this.bp_mem_2 = RHS.bp_mem_2;
    this.Instr = RHS.Instr;
    this.npc = RHS.npc;
    this.mem_ctrl = RHS.mem_ctrl;
    this.w_ctrl = RHS.w_ctrl;
    this.Mem_bp = RHS.Mem_bp;
    this.vsr1 = RHS.vsr1;
    this.vsr2 = RHS.vsr2;
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
      transaction_view_h = $begin_transaction(transaction_viewing_stream_h,"execute_in_transaction",start_time);
    end
    super.add_to_wave(transaction_view_h);
    // pragma uvmf custom add_to_wave begin
    // UVMF_CHANGE_ME : Color can be applied to transaction entries based on content, example below
    // case()
    //   1 : $add_color(transaction_view_h,"red");
    //   default : $add_color(transaction_view_h,"grey");
    // endcase
    // UVMF_CHANGE_ME : Eliminate transaction variables not wanted in transaction viewing in the waveform viewer
    $add_attribute(transaction_view_h,E_ctrl,"E_ctrl");
    $add_attribute(transaction_view_h,bp_alu_1,"bp_alu_1");
    $add_attribute(transaction_view_h,bp_alu_2,"bp_alu_2");
    $add_attribute(transaction_view_h,bp_mem_1,"bp_mem_1");
    $add_attribute(transaction_view_h,bp_mem_2,"bp_mem_2");
    $add_attribute(transaction_view_h,Instr,"Instr");
    $add_attribute(transaction_view_h,npc,"npc");
    $add_attribute(transaction_view_h,mem_ctrl,"mem_ctrl");
    $add_attribute(transaction_view_h,w_ctrl,"w_ctrl");
    $add_attribute(transaction_view_h,Mem_bp,"Mem_bp");
    $add_attribute(transaction_view_h,vsr1,"vsr1");
    $add_attribute(transaction_view_h,vsr2,"vsr2");
    // pragma uvmf custom add_to_wave end
    $end_transaction(transaction_view_h,end_time);
    $free_transaction(transaction_view_h);
    `endif // QUESTA
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

