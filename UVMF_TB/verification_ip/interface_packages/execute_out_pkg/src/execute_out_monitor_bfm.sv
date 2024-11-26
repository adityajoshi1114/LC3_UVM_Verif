//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface performs the execute_out signal monitoring.
//      It is accessed by the uvm execute_out monitor through a virtual
//      interface handle in the execute_out configuration.  It monitors the
//      signals passed in through the port connection named bus of
//      type execute_out_if.
//
//     Input signals from the execute_out_if are assigned to an internal input
//     signal with a _i suffix.  The _i signal should be used for sampling.
//
//     The input signal connections are as follows:
//       bus.signal -> signal_i 
//
//      Interface functions and tasks used by UVM components:
//             monitor(inout TRANS_T txn);
//                   This task receives the transaction, txn, from the
//                   UVM monitor and then populates variables in txn
//                   from values observed on bus activity.  This task
//                   blocks until an operation on the execute_out bus is complete.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import execute_out_pkg_hdl::*;
import execute_out_pkg::*;


interface execute_out_monitor_bfm 
  ( execute_out_if  bus );

`ifndef XRTL
// This code is to aid in debugging parameter mismatches between the BFM and its corresponding agent.
// Enable this debug by setting UVM_VERBOSITY to UVM_DEBUG
// Setting UVM_VERBOSITY to UVM_DEBUG causes all BFM's and all agents to display their parameter settings.
// All of the messages from this feature have a UVM messaging id value of "CFG"
// The transcript or run.log can be parsed to ensure BFM parameter settings match its corresponding agents parameter settings.
import uvm_pkg::*;
`include "uvm_macros.svh"
initial begin : bfm_vs_agent_parameter_debug
  `uvm_info("CFG", 
      $psprintf("The BFM at '%m' has the following parameters: ", ),
      UVM_DEBUG)
end
`endif


 execute_out_transaction  
                      monitored_trans;
 

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  tri clock_i;
  tri reset_i;
  tri [1:0] W_Control_out_i;
  tri  Mem_Control_out_i;
  tri [15:0] aluout_i;
  tri [15:0] pcout_i;
  tri [2:0] dr_i;
  tri [2:0] sr1_i;
  tri [2:0] sr2_i;
  tri [15:0] IR_Exec_i;
  tri [2:0] NZP_i;
  tri [15:0] M_data_i;
  tri  en_ex_i;
  assign clock_i = bus.clock;
  assign reset_i = bus.reset;
  assign W_Control_out_i = bus.W_Control_out;
  assign Mem_Control_out_i = bus.Mem_Control_out;
  assign aluout_i = bus.aluout;
  assign pcout_i = bus.pcout;
  assign dr_i = bus.dr;
  assign sr1_i = bus.sr1;
  assign sr2_i = bus.sr2;
  assign IR_Exec_i = bus.IR_Exec;
  assign NZP_i = bus.NZP;
  assign M_data_i = bus.M_data;
  assign en_ex_i = bus.en_ex;

  // Proxy handle to UVM monitor
  execute_out_pkg::execute_out_monitor  proxy;

  // pragma uvmf custom interface_item_additional begin
  // pragma uvmf custom interface_item_additional end
  
  //******************************************************************                         
  task wait_for_reset(); 
    @(posedge clock_i) ;                                                                    
    do_wait_for_reset();                                                                   
  endtask                                                                                   

  // ****************************************************************************              
  task do_wait_for_reset(); 
  // pragma uvmf custom reset_condition begin
    wait ( reset_i === 0 ) ;                                                              
    @(posedge clock_i) ;                                                                    
  // pragma uvmf custom reset_condition end                                                                
  endtask    

  //******************************************************************                         
 
  task wait_for_num_clocks(input int unsigned count); 
    @(posedge clock_i);  
                                                                   
    repeat (count-1) @(posedge clock_i);                                                    
  endtask      

  //******************************************************************                         
  event go;                                                                                 
  function void start_monitoring();  
    -> go;
  endfunction                                                                               
  
  // ****************************************************************************              
  initial begin                                                                             
    @go;                                                                                   
    forever begin                                                                        
      monitored_trans = new("monitored_trans");
      do_monitor( );
    end                                                                                    
  end                                                                                       

  //******************************************************************
  // The configure() function is used to pass agent configuration
  // variables to the monitor BFM.  It is called by the monitor within
  // the agent at the beginning of the simulation.  It may be called 
  // during the simulation if agent configuration variables are updated
  // and the monitor BFM needs to be aware of the new configuration 
  // variables.
  //
    function void configure(execute_out_configuration 
                          
                         execute_out_configuration_arg
                         );  
    initiator_responder = execute_out_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
  task do_monitor();
    //
    // Available struct members:
    //     //    monitored_trans.alu_out
    //     //    monitored_trans.w_ctrl
    //     //    monitored_trans.mem_ctrl
    //     //    monitored_trans.M_data
    //     //    monitored_trans.dest_reg
    //     //    monitored_trans.src_reg1
    //     //    monitored_trans.src_reg2
    //     //    monitored_trans.IR_ex
    //     //    monitored_trans.nzp
    //     //    monitored_trans.pc_out
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge clock_i);
    //    
    //    How to assign a transaction variable, named xyz, from a signal.   
    //    All available input signals listed.
    //      monitored_trans.xyz = W_Control_out_i;  //    [1:0] 
    //      monitored_trans.xyz = Mem_Control_out_i;  //     
    //      monitored_trans.xyz = aluout_i;  //    [15:0] 
    //      monitored_trans.xyz = pcout_i;  //    [15:0] 
    //      monitored_trans.xyz = dr_i;  //    [2:0] 
    //      monitored_trans.xyz = sr1_i;  //    [2:0] 
    //      monitored_trans.xyz = sr2_i;  //    [2:0] 
    //      monitored_trans.xyz = IR_Exec_i;  //    [15:0] 
    //      monitored_trans.xyz = NZP_i;  //    [2:0] 
    //      monitored_trans.xyz = M_data_i;  //    [15:0] 
    //      monitored_trans.xyz = en_ex_i;  //     
    // pragma uvmf custom do_monitor begin
    // UVMF_CHANGE_ME : Implement protocol monitoring.  The commented reference code 
    // below are examples of how to capture signal values and assign them to 
    // structure members.  All available input signals are listed.  The 'while' 
    // code example shows how to wait for a synchronous flow control signal.  This
    // task should return when a complete transfer has been observed.  Once this task is
    // exited with captured values, it is then called again to wait for and observe 
    // the next transfer. One clock cycle is consumed between calls to do_monitor.

    // First transaction
    if (reset_i == 1) begin 
      #1; // To ensure the assertion below works 
      assert(!en_ex_i); // enable cannot go high without reset going high
      do_wait_for_reset();
      @(posedge en_ex_i);
      @(negedge clock_i);
      finish_monitoring();
    end else begin // Further transactions
      if (en_ex_i) begin 
        finish_monitoring();
      end else begin // If enable goes low in between
        @(posedge en_ex_i);
        @(negedge clock_i);
        finish_monitoring(); 
      end
    end

  endtask         

  task finish_monitoring();
    // Capture asynchronous outputs here 
    monitored_trans.src_reg1 = sr1_i;
    monitored_trans.src_reg2 = sr2_i;
    monitored_trans.start_time = $time;
    // Capture synchronous outputs here 
    @(negedge clock_i);
    monitored_trans.alu_out = aluout_i;
    monitored_trans.w_ctrl  =  W_Control_out_i;
    monitored_trans.mem_ctrl  =  Mem_Control_out_i;
    monitored_trans.M_data  =  M_data_i;
    monitored_trans.dest_reg  =  dr_i;
    monitored_trans.IR_ex = IR_Exec_i;
    monitored_trans.nzp = NZP_i;
    monitored_trans.pc_out  =  pcout_i;
    monitored_trans.end_time = $time;
    proxy.notify_transaction( monitored_trans ); 
  endtask
  
 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

