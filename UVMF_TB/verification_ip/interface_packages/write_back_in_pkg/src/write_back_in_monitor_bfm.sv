//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface performs the write_back_in signal monitoring.
//      It is accessed by the uvm write_back_in monitor through a virtual
//      interface handle in the write_back_in configuration.  It monitors the
//      signals passed in through the port connection named bus of
//      type write_back_in_if.
//
//     Input signals from the write_back_in_if are assigned to an internal input
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
//                   blocks until an operation on the write_back_in bus is complete.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import write_back_in_pkg_hdl::*;
import write_back_in_pkg::*;


interface write_back_in_monitor_bfm 
  ( write_back_in_if  bus );

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


 write_back_in_transaction  
                      monitored_trans;
 

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  tri clock_i;
  tri reset_i;
  tri  enable_writeback_i;
  tri [15:0] aluout_in_i;
  tri [15:0] memout_i;
  tri [2:0] sr1_i;
  tri [2:0] sr2_i;
  tri [2:0] dr_i;
  tri [15:0] npc_i;
  tri [15:0] pcout_in_i;
  tri [1:0] W_control_i;
  assign clock_i = bus.clock;
  assign reset_i = bus.reset;
  assign enable_writeback_i = bus.enable_writeback;
  assign aluout_in_i = bus.aluout_in;
  assign memout_i = bus.memout;
  assign sr1_i = bus.sr1;
  assign sr2_i = bus.sr2;
  assign dr_i = bus.dr;
  assign npc_i = bus.npc;
  assign pcout_in_i = bus.pcout_in;
  assign W_control_i = bus.W_control;

  // Proxy handle to UVM monitor
  write_back_in_pkg::write_back_in_monitor  proxy;

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
    function void configure(write_back_in_configuration 
                          
                         write_back_in_configuration_arg
                         );  
    initiator_responder = write_back_in_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
  task do_monitor();
    //
    // Available struct members:
    //     //    monitored_trans.npc
    //     //    monitored_trans.W_control
    //     //    monitored_trans.aluout
    //     //    monitored_trans.pcout
    //     //    monitored_trans.memout
    //     //    monitored_trans.enable_writeback
    //     //    monitored_trans.dr
    //     //    monitored_trans.sr1
    //     //    monitored_trans.sr2
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge clock_i);
    //    
    //    How to assign a transaction variable, named xyz, from a signal.   
    //    All available input signals listed.
    //      monitored_trans.xyz = enable_writeback_i;  //     
    //      monitored_trans.xyz = aluout_in_i;  //    [15:0] 
    //      monitored_trans.xyz = memout_i;  //    [15:0] 
    //      monitored_trans.xyz = sr1_i;  //    [2:0] 
    //      monitored_trans.xyz = sr2_i;  //    [2:0] 
    //      monitored_trans.xyz = dr_i;  //    [2:0] 
    //      monitored_trans.xyz = npc_i;  //    [15:0] 
    //      monitored_trans.xyz = pcout_in_i;  //    [15:0] 
    //      monitored_trans.xyz = W_control_i;  //    [1:0] 
    // pragma uvmf custom do_monitor begin
    // UVMF_CHANGE_ME : Implement protocol monitoring.  The commented reference code 
    // below are examples of how to capture signal values and assign them to 
    // structure members.  All available input signals are listed.  The 'while' 
    // code example shows how to wait for a synchronous flow control signal.  This
    // task should return when a complete transfer has been observed.  Once this task is
    // exited with captured values, it is then called again to wait for and observe 
    // the next transfer. One clock cycle is consumed between calls to do_monitor.
    // First Transaction 
    if (reset_i === 1) begin
      do_wait_for_reset();
    end 
    finish_monitoring();
    // pragma uvmf custom do_monitor end
  endtask      

  task finish_monitoring();
    monitored_trans.start_time = $time;
    @(negedge clock_i); // Capture stable values
    monitored_trans.enable_writeback=enable_writeback_i;	
    monitored_trans.aluout = aluout_in_i;
    monitored_trans.memout = memout_i;
    monitored_trans.sr1 = sr1_i;
    monitored_trans.sr2 = sr2_i;
    monitored_trans.dr = dr_i;
    monitored_trans.npc = npc_i;
    monitored_trans.pcout = pcout_in_i;
    monitored_trans.W_control = W_control_i;
    @(posedge clock_i);
    monitored_trans.end_time = $time;
    proxy.notify_transaction( monitored_trans ); 
  endtask   
  
 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end
