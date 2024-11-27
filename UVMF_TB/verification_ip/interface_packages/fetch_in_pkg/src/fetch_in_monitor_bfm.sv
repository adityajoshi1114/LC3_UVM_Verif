//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface performs the fetch_in signal monitoring.
//      It is accessed by the uvm fetch_in monitor through a virtual
//      interface handle in the fetch_in configuration.  It monitors the
//      signals passed in through the port connection named bus of
//      type fetch_in_if.
//
//     Input signals from the fetch_in_if are assigned to an internal input
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
//                   blocks until an operation on the fetch_in bus is complete.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import fetch_in_pkg_hdl::*;
import fetch_in_pkg::*;


interface fetch_in_monitor_bfm 
  ( fetch_in_if  bus );

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


 fetch_in_transaction  
                      monitored_trans;
 

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  tri clock_i;
  tri reset_i;
  tri  enable_updatePC_i;
  tri  enable_fetch_i;
  tri [15:0] taddr_i;
  tri  br_taken_i;
  assign clock_i = bus.clock;
  assign reset_i = bus.reset;
  assign enable_updatePC_i = bus.enable_updatePC;
  assign enable_fetch_i = bus.enable_fetch;
  assign taddr_i = bus.taddr;
  assign br_taken_i = bus.br_taken;

  // Proxy handle to UVM monitor
  fetch_in_pkg::fetch_in_monitor  proxy;

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
      proxy.notify_transaction( monitored_trans ); 
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
    function void configure(fetch_in_configuration 
                          
                         fetch_in_configuration_arg
                         );  
    initiator_responder = fetch_in_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
  task do_monitor();
    //
    // Available struct members:
    //     //    monitored_trans.Enable_updatePC
    //     //    monitored_trans.Enable_fetch
    //     //    monitored_trans.Taddr
    //     //    monitored_trans.Br_taken
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge clock_i);
    //    
    //    How to assign a transaction variable, named xyz, from a signal.   
    //    All available input signals listed.
    //      monitored_trans.xyz = enable_updatePC_i;  //     
    //      monitored_trans.xyz = enable_fetch_i;  //     
    //      monitored_trans.xyz = taddr_i;  //    [15:0] 
    //      monitored_trans.xyz = br_taken_i;  //     
    // pragma uvmf custom do_monitor begin
    // UVMF_CHANGE_ME : Implement protocol monitoring.  The commented reference code 
    // below are examples of how to capture signal values and assign them to 
    // structure members.  All available input signals are listed.  The 'while' 
    // code example shows how to wait for a synchronous flow control signal.  This
    // task should return when a complete transfer has been observed.  Once this task is
    // exited with captured values, it is then called again to wait for and observe 
    // the next transfer. One clock cycle is consumed between calls to do_monitor.
    // Wait for Reset
    if (reset_i == 1) begin 
      do_wait_for_reset();
    end
    // Wait for enable
    while(enable_fetch_i != 1'b1) begin
      @(posedge clock_i);
    end
    monitored_trans.start_time = $time;
    @(negedge clock_i);   // To capture stable values
    monitored_trans.Taddr           = taddr_i;
    //monitored_trans.Enable_fetch    = enable_fetch_i;
    monitored_trans.Br_taken        = br_taken_i;
    monitored_trans.Enable_updatePC = enable_updatePC_i;
    @(posedge clock_i);
    monitored_trans.end_time = $time;
    #1; // One of the outputs is produced asynchronously
    monitored_trans.Enable_fetch    = enable_fetch_i;
    // pragma uvmf custom do_monitor end
  endtask         
  
 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

