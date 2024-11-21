//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface performs the memaccess_in signal monitoring.
//      It is accessed by the uvm memaccess_in monitor through a virtual
//      interface handle in the memaccess_in configuration.  It monitors the
//      signals passed in through the port connection named bus of
//      type memaccess_in_if.
//
//     Input signals from the memaccess_in_if are assigned to an internal input
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
//                   blocks until an operation on the memaccess_in bus is complete.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import memaccess_in_pkg_hdl::*;
import memaccess_in_pkg::*;


interface memaccess_in_monitor_bfm 
  ( memaccess_in_if  bus );

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


 memaccess_in_transaction  
                      monitored_trans;
 

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  tri clock_i;
  tri reset_i;
  tri [15:0] M_Data_i;
  tri [15:0] M_Addr_i;
  tri  M_Control_i;
  tri [1:0] mem_state_i;
  tri [15:0] DMem_dout_i;
  assign clock_i = bus.clock;
  assign reset_i = bus.reset;
  assign M_Data_i = bus.M_Data;
  assign M_Addr_i = bus.M_Addr;
  assign M_Control_i = bus.M_Control;
  assign mem_state_i = bus.mem_state;
  assign DMem_dout_i = bus.DMem_dout;

  // Proxy handle to UVM monitor
  memaccess_in_pkg::memaccess_in_monitor  proxy;

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
    function void configure(memaccess_in_configuration 
                          
                         memaccess_in_configuration_arg
                         );  
    initiator_responder = memaccess_in_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
  task do_monitor();
    //
    // Available struct members:
    //     //    monitored_trans.M_Data
    //     //    monitored_trans.M_Addr
    //     //    monitored_trans.M_Control
    //     //    monitored_trans.mem_state
    //     //    monitored_trans.DMem_dout
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge clock_i);
    //    
    //    How to assign a transaction variable, named xyz, from a signal.   
    //    All available input signals listed.
    //      monitored_trans.xyz = M_Data_i;  //    [15:0] 
    //      monitored_trans.xyz = M_Addr_i;  //    [15:0] 
    //      monitored_trans.xyz = M_Control_i;  //     
    //      monitored_trans.xyz = mem_state_i;  //    [1:0] 
    //      monitored_trans.xyz = DMem_dout_i;  //    [15:0] 
    // pragma uvmf custom do_monitor begin
    // UVMF_CHANGE_ME : Implement protocol monitoring.  The commented reference code 
    // below are examples of how to capture signal values and assign them to 
    // structure members.  All available input signals are listed.  The 'while' 
    // code example shows how to wait for a synchronous flow control signal.  This
    // task should return when a complete transfer has been observed.  Once this task is
    // exited with captured values, it is then called again to wait for and observe 
    // the next transfer. One clock cycle is consumed between calls to do_monitor.
    monitored_trans.start_time = $time;
    // @(posedge clock_i);
    // @(posedge clock_i);
    // @(posedge clock_i);
    // @(posedge clock_i);
    // monitored_trans.end_time = $time;
    // pragma uvmf custom do_monitor end
    while (reset_i === 1'b1) @(posedge clock_i);
    monitored_trans.mem_state = mem_state_i;  
    monitored_trans.M_Control = M_Control_i;  
    monitored_trans.M_Data = M_Data_i;  
    monitored_trans.M_Addr = M_Addr_i;  
    monitored_trans.DMem_dout = DMem_dout_i; 
    monitored_trans.end_time  = $time;
    proxy.notify_transaction( monitored_trans );
  endtask         
  
 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

