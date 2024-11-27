//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface performs the decode_out signal monitoring.
//      It is accessed by the uvm decode_out monitor through a virtual
//      interface handle in the decode_out configuration.  It monitors the
//      signals passed in through the port connection named bus of
//      type decode_out_if.
//
//     Input signals from the decode_out_if are assigned to an internal input
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
//                   blocks until an operation on the decode_out bus is complete.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import decode_out_pkg_hdl::*;
import decode_out_pkg::*;


interface decode_out_monitor_bfm 
  ( decode_out_if  bus );

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


 decode_out_transaction  
                      monitored_trans;
 

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  tri clock_i;
  tri reset_i;
  tri  enable_decode_i;
  tri [1:0] W_Control_i;
  tri  Mem_Control_i;
  tri [5:0] E_Control_i;
  tri [15:0] IR_i;
  tri [15:0] npc_out_i;
  assign clock_i = bus.clock;
  assign reset_i = bus.reset;
  assign enable_decode_i = bus.enable_decode;
  assign W_Control_i = bus.W_Control;
  assign Mem_Control_i = bus.Mem_Control;
  assign E_Control_i = bus.E_Control;
  assign IR_i = bus.IR;
  assign npc_out_i = bus.npc_out;

  // Proxy handle to UVM monitor
  decode_out_pkg::decode_out_monitor  proxy;

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
      //@(posedge clock_i);  
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
    function void configure(decode_out_configuration 
                          
                         decode_out_configuration_arg
                         );  
    initiator_responder = decode_out_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
  task do_monitor();
    //
    // Available struct members:
    //     //    monitored_trans.W_Control
    //     //    monitored_trans.Mem_Control
    //     //    monitored_trans.E_Control
    //     //    monitored_trans.IR
    //     //    monitored_trans.npc_out
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge clock_i);
    //    
    //    How to assign a transaction variable, named xyz, from a signal.   
    //    All available input signals listed.
    //      monitored_trans.xyz = enable_decode_i;  //     
    //      monitored_trans.xyz = W_Control_i;  //    [1:0] 
    //      monitored_trans.xyz = Mem_Control_i;  //     
    //      monitored_trans.xyz = E_Control_i;  //    [5:0] 
    //      monitored_trans.xyz = IR_i;  //    [15:0] 
    //      monitored_trans.xyz = npc_out_i;  //    [15:0] 
    // pragma uvmf custom do_monitor begin
    // UVMF_CHANGE_ME : Implement protocol monitoring.  The commented reference code 
    // below are examples of how to capture signal values and assign them to 
    // structure members.  All available input signals are listed.  The 'while' 
    // code example shows how to wait for a synchronous flow control signal.  This
    // task should return when a complete transfer has been observed.  Once this task is
    // exited with captured values, it is then called again to wait for and observe 
    // the next transfer. One clock cycle is consumed between calls to do_monitor.
    
    // Startup
    if (reset_i == 1) begin 
      do_wait_for_reset();
      @(posedge enable_decode_i);
      @(posedge clock_i); // One cycle delay since its decode_out
    end
    // Ideally decode enable should be high
    if (enable_decode_i != 1'b1) begin 
   // Monitor 1 transaction and then wait
      finish_monitoring();
      while(enable_decode_i != 1'b1) begin
        @(posedge clock_i);
      end
      @(posedge clock_i); // Adding another posedge because its decode_out
    end else begin 
      finish_monitoring();
    end
    // pragma uvmf custom do_monitor end
  endtask         

  task finish_monitoring ();
    monitored_trans.start_time = $time;
    @(negedge clock_i);
    monitored_trans.W_Control = W_Control_i;
    monitored_trans.Mem_Control = Mem_Control_i;
    monitored_trans.E_Control = E_Control_i;
    monitored_trans.IR = IR_i;
    monitored_trans.npc_out = npc_out_i;
    @(posedge clock_i);
    monitored_trans.end_time = $time;
    proxy.notify_transaction( monitored_trans );
    #1; // To capture values slightly after posedge
  endtask
  
 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end
