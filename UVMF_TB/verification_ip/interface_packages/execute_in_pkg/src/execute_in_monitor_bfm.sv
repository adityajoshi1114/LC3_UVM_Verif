//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface performs the execute_in signal monitoring.
//      It is accessed by the uvm execute_in monitor through a virtual
//      interface handle in the execute_in configuration.  It monitors the
//      signals passed in through the port connection named bus of
//      type execute_in_if.
//
//     Input signals from the execute_in_if are assigned to an internal input
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
//                   blocks until an operation on the execute_in bus is complete.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import execute_in_pkg_hdl::*;
import execute_in_pkg::*;


interface execute_in_monitor_bfm 
  ( execute_in_if  bus );

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


 execute_in_transaction  
                      monitored_trans;
 

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  tri clock_i;
  tri reset_i;
  tri  enable_execute_i;
  tri [5:0] E_control_i;
  tri [15:0] IR_i;
  tri [15:0] Mem_Bypass_Val_i;
  tri [15:0] npc_in_i;
  tri [15:0] VSR1_i;
  tri [15:0] VSR2_i;
  tri  bypass_alu_1_i;
  tri  bypass_alu_2_i;
  tri  bypass_mem_1_i;
  tri  bypass_mem_2_i;
  tri  Mem_Control_in_i;
  tri [1:0] W_Control_in_i;
  assign clock_i = bus.clock;
  assign reset_i = bus.reset;
  assign enable_execute_i = bus.enable_execute;
  assign E_control_i = bus.E_control;
  assign IR_i = bus.IR;
  assign Mem_Bypass_Val_i = bus.Mem_Bypass_Val;
  assign npc_in_i = bus.npc_in;
  assign VSR1_i = bus.VSR1;
  assign VSR2_i = bus.VSR2;
  assign bypass_alu_1_i = bus.bypass_alu_1;
  assign bypass_alu_2_i = bus.bypass_alu_2;
  assign bypass_mem_1_i = bus.bypass_mem_1;
  assign bypass_mem_2_i = bus.bypass_mem_2;
  assign Mem_Control_in_i = bus.Mem_Control_in;
  assign W_Control_in_i = bus.W_Control_in;

  // Proxy handle to UVM monitor
  execute_in_pkg::execute_in_monitor  proxy;

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
    function void configure(execute_in_configuration 
                          
                         execute_in_configuration_arg
                         );  
    initiator_responder = execute_in_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
  task do_monitor();
    //
    // Available struct members:
    //     //    monitored_trans.E_ctrl
    //     //    monitored_trans.bp_alu_1
    //     //    monitored_trans.bp_alu_2
    //     //    monitored_trans.bp_mem_1
    //     //    monitored_trans.bp_mem_2
    //     //    monitored_trans.Instr
    //     //    monitored_trans.npc
    //     //    monitored_trans.mem_ctrl
    //     //    monitored_trans.w_ctrl
    //     //    monitored_trans.Mem_bp
    //     //    monitored_trans.vsr1
    //     //    monitored_trans.vsr2
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge clock_i);
    //    
    //    How to assign a transaction variable, named xyz, from a signal.   
    //    All available input signals listed.
    //      monitored_trans.xyz = enable_execute_i;  //     
    //      monitored_trans.xyz = E_control_i;  //    [5:0] 
    //      monitored_trans.xyz = IR_i;  //    [15:0] 
    //      monitored_trans.xyz = Mem_Bypass_Val_i;  //    [15:0] 
    //      monitored_trans.xyz = npc_in_i;  //    [15:0] 
    //      monitored_trans.xyz = VSR1_i;  //    [15:0] 
    //      monitored_trans.xyz = VSR2_i;  //    [15:0] 
    //      monitored_trans.xyz = bypass_alu_1_i;  //     
    //      monitored_trans.xyz = bypass_alu_2_i;  //     
    //      monitored_trans.xyz = bypass_mem_1_i;  //     
    //      monitored_trans.xyz = bypass_mem_2_i;  //     
    //      monitored_trans.xyz = Mem_Control_in_i;  //     
    //      monitored_trans.xyz = W_Control_in_i;  //    [1:0] 
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
      assert(!enable_execute_i);
      do_wait_for_reset();
      @(posedge enable_execute_i);
      finish_monitoring();
    end else begin // Further transactions
      if (enable_execute_i) begin // If enable is high 
        finish_monitoring();
      end else begin 
        @(posedge enable_execute_i);
        finish_monitoring();
      end
    end
    
    // pragma uvmf custom do_monitor end
    
  endtask         

  task finish_monitoring();
    monitored_trans.start_time = $time;
    @(negedge clock_i);    // Capture values at negedge
    monitored_trans.E_ctrl    = E_control_i;
    monitored_trans.bp_alu_1  = bypass_alu_1_i;
    monitored_trans.bp_alu_2  = bypass_alu_2_i;
    monitored_trans.bp_mem_1  = bypass_mem_1_i;
    monitored_trans.bp_mem_2  = bypass_mem_2_i;
    monitored_trans.Instr     = IR_i;
    monitored_trans.npc       = npc_in_i;
    monitored_trans.mem_ctrl  = Mem_Control_in_i;
    monitored_trans.w_ctrl    = W_Control_in_i;
    monitored_trans.Mem_bp    = Mem_Bypass_Val_i;
    monitored_trans.vsr1      = VSR1_i;
    monitored_trans.vsr2      = VSR2_i;
    @(posedge clock_i);   // Move to end of transaction
    monitored_trans.end_time  = $time;
    proxy.notify_transaction( monitored_trans ); 
    #1;   // To capture enable value slightly after posedge
    endtask
  
 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

