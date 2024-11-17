//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class defines the variables required for an execute_out
//    transaction.  Class variables to be displayed in waveform transaction
//    viewing are added to the transaction viewing stream in the add_to_wave
//    function.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class execute_out_transaction  extends uvmf_transaction_base;

  `uvm_object_utils( execute_out_transaction )

  bit [15:0] alu_out ;
  bit [1:0] w_ctrl ;
  bit mem_ctrl ;
  bit [15:0] M_data ;
  bit [2:0] dest_reg ;
  bit [2:0] src_reg1 ;
  bit [2:0] src_reg2 ;
  bit [15:0] IR_ex ;
  bit [2:0] nzp ;
  bit [15:0] pc_out ;

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
    return $sformatf("alu_out:0x%x w_ctrl:0x%x mem_ctrl:0x%x M_data:0x%x dest_reg:0x%x src_reg1:0x%x src_reg2:0x%x IR_ex:0x%x nzp:0x%x pc_out:0x%x ",alu_out,w_ctrl,mem_ctrl,M_data,dest_reg,src_reg1,src_reg2,IR_ex,nzp,pc_out);
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
    execute_out_transaction  RHS;
    if (!$cast(RHS,rhs)) return 0;
    // pragma uvmf custom do_compare begin
    // UVMF_CHANGE_ME : Eliminate comparison of variables not to be used for compare
    return (super.do_compare(rhs,comparer)
            &&(this.alu_out == RHS.alu_out)
            &&(this.w_ctrl == RHS.w_ctrl)
            &&(this.mem_ctrl == RHS.mem_ctrl)
            &&(this.M_data == RHS.M_data)
            &&(this.dest_reg == RHS.dest_reg)
            &&(this.src_reg1 == RHS.src_reg1)
            &&(this.src_reg2 == RHS.src_reg2)
            &&(this.IR_ex == RHS.IR_ex)
            &&(this.nzp == RHS.nzp)
            &&(this.pc_out == RHS.pc_out)
            );
    // pragma uvmf custom do_compare end
  endfunction

  //*******************************************************************
  // FUNCTION: do_copy()
  // This function is automatically called when the .copy() function
  // is called on this class.
  //
  virtual function void do_copy (uvm_object rhs);
    execute_out_transaction  RHS;
    if(!$cast(RHS,rhs))begin
      `uvm_fatal("CAST","Transaction cast in do_copy() failed!")
    end
    // pragma uvmf custom do_copy begin
    super.do_copy(rhs);
    this.alu_out = RHS.alu_out;
    this.w_ctrl = RHS.w_ctrl;
    this.mem_ctrl = RHS.mem_ctrl;
    this.M_data = RHS.M_data;
    this.dest_reg = RHS.dest_reg;
    this.src_reg1 = RHS.src_reg1;
    this.src_reg2 = RHS.src_reg2;
    this.IR_ex = RHS.IR_ex;
    this.nzp = RHS.nzp;
    this.pc_out = RHS.pc_out;
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
      transaction_view_h = $begin_transaction(transaction_viewing_stream_h,"execute_out_transaction",start_time);
    end
    super.add_to_wave(transaction_view_h);
    // pragma uvmf custom add_to_wave begin
    // UVMF_CHANGE_ME : Color can be applied to transaction entries based on content, example below
    // case()
    //   1 : $add_color(transaction_view_h,"red");
    //   default : $add_color(transaction_view_h,"grey");
    // endcase
    // UVMF_CHANGE_ME : Eliminate transaction variables not wanted in transaction viewing in the waveform viewer
    $add_attribute(transaction_view_h,alu_out,"alu_out");
    $add_attribute(transaction_view_h,w_ctrl,"w_ctrl");
    $add_attribute(transaction_view_h,mem_ctrl,"mem_ctrl");
    $add_attribute(transaction_view_h,M_data,"M_data");
    $add_attribute(transaction_view_h,dest_reg,"dest_reg");
    $add_attribute(transaction_view_h,src_reg1,"src_reg1");
    $add_attribute(transaction_view_h,src_reg2,"src_reg2");
    $add_attribute(transaction_view_h,IR_ex,"IR_ex");
    $add_attribute(transaction_view_h,nzp,"nzp");
    $add_attribute(transaction_view_h,pc_out,"pc_out");
    // pragma uvmf custom add_to_wave end
    $end_transaction(transaction_view_h,end_time);
    $free_transaction(transaction_view_h);
    `endif // QUESTA
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

