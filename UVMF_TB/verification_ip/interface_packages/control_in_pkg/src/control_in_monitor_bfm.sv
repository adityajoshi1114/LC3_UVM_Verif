//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface performs the control_in signal monitoring.
//      It is accessed by the uvm control_in monitor through a virtual
//      interface handle in the control_in configuration.  It monitors the
//      signals passed in through the port connection named bus of
//      type control_in_if.
//
//     Input signals from the control_in_if are assigned to an internal input
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
//                   blocks until an operation on the control_in bus is complete.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import control_in_pkg_hdl::*;
import control_in_pkg::*;


interface control_in_monitor_bfm 
  ( control_in_if  bus );

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


 control_in_transaction  
                      monitored_trans;
 

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  tri clock_i;
  tri reset_i;
  tri  complete_data_i;
  tri  complete_instr_i;
  tri [15:0] IR_i;
  tri [2:0] NZP_i;
  tri [2:0] psr_i;
  tri [15:0] IR_Exec_i;
  tri [15:0] IMem_dout_i;
  assign clock_i = bus.clock;
  assign reset_i = bus.reset;
  assign complete_data_i = bus.complete_data;
  assign complete_instr_i = bus.complete_instr;
  assign IR_i = bus.IR;
  assign NZP_i = bus.NZP;
  assign psr_i = bus.psr;
  assign IR_Exec_i = bus.IR_Exec;
  assign IMem_dout_i = bus.IMem_dout;

  // Proxy handle to UVM monitor
  control_in_pkg::control_in_monitor  proxy;

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
    wait ( reset_i === 1 ) ;                                                              
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
      @(posedge clock_i);  
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
    function void configure(control_in_configuration 
                          
                         control_in_configuration_arg
                         );  
    initiator_responder = control_in_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
  task do_monitor();
    //
    // Available struct members:
    //     //    monitored_trans.complete_data
    //     //    monitored_trans.complete_instr
    //     //    monitored_trans.IR
    //     //    monitored_trans.NZP
    //     //    monitored_trans.psr
    //     //    monitored_trans.IR_Exec
    //     //    monitored_trans.IMem_dout
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge clock_i);
    //    
    //    How to assign a transaction variable, named xyz, from a signal.   
    //    All available input signals listed.
    //      monitored_trans.xyz = complete_data_i;  //     
    //      monitored_trans.xyz = complete_instr_i;  //     
    //      monitored_trans.xyz = IR_i;  //    [15:0] 
    //      monitored_trans.xyz = NZP_i;  //    [2:0] 
    //      monitored_trans.xyz = psr_i;  //    [2:0] 
    //      monitored_trans.xyz = IR_Exec_i;  //    [15:0] 
    //      monitored_trans.xyz = IMem_dout_i;  //    [15:0] 
    // pragma uvmf custom do_monitor begin
    // UVMF_CHANGE_ME : Implement protocol monitoring.  The commented reference code 
    // below are examples of how to capture signal values and assign them to 
    // structure members.  All available input signals are listed.  The 'while' 
    // code example shows how to wait for a synchronous flow control signal.  This
    // task should return when a complete transfer has been observed.  Once this task is
    // exited with captured values, it is then called again to wait for and observe 
    // the next transfer. One clock cycle is consumed between calls to do_monitor.
    monitored_trans.start_time = $time;
    @(posedge clock_i);
    monitored_trans.complete_data = complete_data_i;
    monitored_trans.complete_instr = complete_instr_i;
    monitored_trans.IR = IR_i;
    monitored_trans.NZP = NZP_i;
    monitored_trans.psr = psr_i;
    monitored_trans.IR_Exec = IR_Exec_i;
    monitored_trans.IMem_dout = IMem_dout_i;
    @(posedge clock_i);
    monitored_trans.end_time = $time;
    proxy.notify_transaction( monitored_trans ); 


    // @(posedge clock_i);
    // @(posedge clock_i);
    // @(posedge clock_i);

    // pragma uvmf custom do_monitor end
  endtask         
  
 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

