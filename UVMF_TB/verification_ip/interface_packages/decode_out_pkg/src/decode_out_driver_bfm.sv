//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
//    This interface performs the decode_out signal driving.  It is
//     accessed by the uvm decode_out driver through a virtual interface
//     handle in the decode_out configuration.  It drives the singals passed
//     in through the port connection named bus of type decode_out_if.
//
//     Input signals from the decode_out_if are assigned to an internal input
//     signal with a _i suffix.  The _i signal should be used for sampling.
//
//     The input signal connections are as follows:
//       bus.signal -> signal_i 
//
//     This bfm drives signals with a _o suffix.  These signals
//     are driven onto signals within decode_out_if based on INITIATOR/RESPONDER and/or
//     ARBITRATION/GRANT status.  
//
//     The output signal connections are as follows:
//        signal_o -> bus.signal
//
//                                                                                           
//      Interface functions and tasks used by UVM components:
//
//             configure:
//                   This function gets configuration attributes from the
//                   UVM driver to set any required BFM configuration
//                   variables such as 'initiator_responder'.                                       
//                                                                                           
//             initiate_and_get_response:
//                   This task is used to perform signaling activity for initiating
//                   a protocol transfer.  The task initiates the transfer, using
//                   input data from the initiator struct.  Then the task captures
//                   response data, placing the data into the response struct.
//                   The response struct is returned to the driver class.
//
//             respond_and_wait_for_next_transfer:
//                   This task is used to complete a current transfer as a responder
//                   and then wait for the initiator to start the next transfer.
//                   The task uses data in the responder struct to drive protocol
//                   signals to complete the transfer.  The task then waits for 
//                   the next transfer.  Once the next transfer begins, data from
//                   the initiator is placed into the initiator struct and sent
//                   to the responder sequence for processing to determine 
//                   what data to respond with.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import decode_out_pkg_hdl::*;
import decode_out_pkg::*;

interface decode_out_driver_bfm 
  (decode_out_if bus);

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

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  tri clock_i;
  tri reset_i;

  // Signal list (all signals are capable of being inputs and outputs for the sake
  // of supporting both INITIATOR and RESPONDER mode operation. Expectation is that 
  // directionality in the config file was from the point-of-view of the INITIATOR

  // INITIATOR mode input signals
  tri  enable_decode_i;
  reg  enable_decode_o = 'b0;
  tri [1:0] W_Control_i;
  reg [1:0] W_Control_o = 'b0;
  tri  Mem_Control_i;
  reg  Mem_Control_o = 'b0;
  tri [5:0] E_Control_i;
  reg [5:0] E_Control_o = 'b0;
  tri [15:0] IR_i;
  reg [15:0] IR_o = 'b0;
  tri [15:0] npc_out_i;
  reg [15:0] npc_out_o = 'b0;

  // INITIATOR mode output signals

  // Bi-directional signals
  

  assign clock_i = bus.clock;
  assign reset_i = bus.reset;

  // These are signals marked as 'input' by the config file, but the signals will be
  // driven by this BFM if put into RESPONDER mode (flipping all signal directions around)
  assign enable_decode_i = bus.enable_decode;
  assign bus.enable_decode = (initiator_responder == RESPONDER) ? enable_decode_o : 'bz;
  assign W_Control_i = bus.W_Control;
  assign bus.W_Control = (initiator_responder == RESPONDER) ? W_Control_o : 'bz;
  assign Mem_Control_i = bus.Mem_Control;
  assign bus.Mem_Control = (initiator_responder == RESPONDER) ? Mem_Control_o : 'bz;
  assign E_Control_i = bus.E_Control;
  assign bus.E_Control = (initiator_responder == RESPONDER) ? E_Control_o : 'bz;
  assign IR_i = bus.IR;
  assign bus.IR = (initiator_responder == RESPONDER) ? IR_o : 'bz;
  assign npc_out_i = bus.npc_out;
  assign bus.npc_out = (initiator_responder == RESPONDER) ? npc_out_o : 'bz;


  // These are signals marked as 'output' by the config file, but the outputs will
  // not be driven by this BFM unless placed in INITIATOR mode.

  // Proxy handle to UVM driver
  decode_out_pkg::decode_out_driver   proxy;


  // ****************************************************************************
// pragma uvmf custom reset_condition_and_response begin
  // Always block used to return signals to reset value upon assertion of reset
  always @( negedge reset_i )
     begin
       // RESPONDER mode output signals
       enable_decode_o <= 'b0;
       W_Control_o <= 'b0;
       Mem_Control_o <= 'b0;
       E_Control_o <= 'b0;
       IR_o <= 'b0;
       npc_out_o <= 'b0;
       // INITIATOR mode output signals
       // Bi-directional signals
 
     end    
// pragma uvmf custom reset_condition_and_response end

  // pragma uvmf custom interface_item_additional begin
  // pragma uvmf custom interface_item_additional end

  //******************************************************************
  // The configure() function is used to pass agent configuration
  // variables to the driver BFM.  It is called by the driver within
  // the agent at the beginning of the simulation.  It may be called 
  // during the simulation if agent configuration variables are updated
  // and the driver BFM needs to be aware of the new configuration 
  // variables.
  //

  function void configure(decode_out_configuration 
                         
                         decode_out_configuration_arg
                         );  
    initiator_responder = decode_out_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction                                                                             

// pragma uvmf custom initiate_and_get_response begin
// ****************************************************************************
// UVMF_CHANGE_ME
// This task is used by an initator.  The task first initiates a transfer then
// waits for the responder to complete the transfer.
    task initiate_and_get_response( decode_out_transaction 
                                  
                                  initiator_trans  
                                  );
       // 
       // Variables within the initiator_trans:
       //   logic [1:0] W_Control ;
       //   logic Mem_Control ;
       //   logic [5:0] E_Control ;
       //   logic [15:0] IR ;
       //   logic [15:0] npc_out ;
       //
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clock_i);
       //    
       //    How to assign a initiator_trans variable, named xyz, from a signal.   
       //    All available initiator input and inout signals listed.
       //    Initiator input signals:
       //      initiator_trans.xyz = enable_decode_i;  //     
       //      initiator_trans.xyz = W_Control_i;  //    [1:0] 
       //      initiator_trans.xyz = Mem_Control_i;  //     
       //      initiator_trans.xyz = E_Control_i;  //    [5:0] 
       //      initiator_trans.xyz = IR_i;  //    [15:0] 
       //      initiator_trans.xyz = npc_out_i;  //    [15:0] 
       //    Initiator inout signals:
       //    How to assign a signal, named xyz, from a initiator_trans varaiable.   
       //    All available initiator output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Initiator output signals:
       //    Initiator inout signals:
    // Initiate a transfer using the data received.
    @(posedge clock_i);
    @(posedge clock_i);
    // Wait for the responder to complete the transfer then place the responder data into 
    // initiator_trans.
    @(posedge clock_i);
    @(posedge clock_i);
  endtask        
// pragma uvmf custom initiate_and_get_response end

// pragma uvmf custom respond_and_wait_for_next_transfer begin
// ****************************************************************************
// The first_transfer variable is used to prevent completing a transfer in the 
// first call to this task.  For the first call to this task, there is not
// current transfer to complete.
bit first_transfer=1;

// UVMF_CHANGE_ME
// This task is used by a responder.  The task first completes the current 
// transfer in progress then waits for the initiator to start the next transfer.
  
  task respond_and_wait_for_next_transfer( decode_out_transaction 
                                         
                                         responder_trans  
                                         );     
  // Variables within the responder_trans:
  //   logic [1:0] W_Control ;
  //   logic Mem_Control ;
  //   logic [5:0] E_Control ;
  //   logic [15:0] IR ;
  //   logic [15:0] npc_out ;
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clock_i);
       //    
       //    How to assign a responder_trans member, named xyz, from a signal.   
       //    All available responder input and inout signals listed.
       //    Responder input signals
       //    Responder inout signals
       //    How to assign a signal from a responder_trans member named xyz.   
       //    All available responder output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       ///   Responder output signals
       //      enable_decode_o <= responder_trans.xyz;  //     
       //      W_Control_o <= responder_trans.xyz;  //    [1:0] 
       //      Mem_Control_o <= responder_trans.xyz;  //     
       //      E_Control_o <= responder_trans.xyz;  //    [5:0] 
       //      IR_o <= responder_trans.xyz;  //    [15:0] 
       //      npc_out_o <= responder_trans.xyz;  //    [15:0] 
       //    Responder inout signals
    

  @(posedge clock_i);
  if (!first_transfer) begin
    // Perform transfer response here.   
    // Reply using data recieved in the responder_trans.
    @(posedge clock_i);
    // Reply using data recieved in the transaction handle.
    @(posedge clock_i);
  end
    // Wait for next transfer then gather info from intiator about the transfer.
    // Place the data into the responder_trans handle.
    @(posedge clock_i);
    @(posedge clock_i);
    first_transfer = 0;
  endtask
// pragma uvmf custom respond_and_wait_for_next_transfer end

 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

