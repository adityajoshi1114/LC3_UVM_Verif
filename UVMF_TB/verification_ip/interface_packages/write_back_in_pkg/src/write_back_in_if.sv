//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the write_back_in interface signals.
//      It is instantiated once per write_back_in bus.  Bus Functional Models, 
//      BFM's named write_back_in_driver_bfm, are used to drive signals on the bus.
//      BFM's named write_back_in_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(write_back_in_bus.enable_writeback), // Agent output 
// .dut_signal_port(write_back_in_bus.aluout_in), // Agent output 
// .dut_signal_port(write_back_in_bus.memout), // Agent output 
// .dut_signal_port(write_back_in_bus.sr1), // Agent output 
// .dut_signal_port(write_back_in_bus.sr2), // Agent output 
// .dut_signal_port(write_back_in_bus.dr), // Agent output 
// .dut_signal_port(write_back_in_bus.npc), // Agent output 
// .dut_signal_port(write_back_in_bus.pcout_in), // Agent output 
// .dut_signal_port(write_back_in_bus.W_control), // Agent output 

import uvmf_base_pkg_hdl::*;
import write_back_in_pkg_hdl::*;

interface  write_back_in_if 

  (
  input tri clock, 
  input tri reset,
  inout tri  enable_writeback,
  inout tri [15:0] aluout_in,
  inout tri [15:0] memout,
  inout tri [2:0] sr1,
  inout tri [2:0] sr2,
  inout tri [2:0] dr,
  inout tri [15:0] npc,
  inout tri [15:0] pcout_in,
  inout tri [1:0] W_control
  );

modport monitor_port 
  (
  input clock,
  input reset,
  input enable_writeback,
  input aluout_in,
  input memout,
  input sr1,
  input sr2,
  input dr,
  input npc,
  input pcout_in,
  input W_control
  );

modport initiator_port 
  (
  input clock,
  input reset,
  output enable_writeback,
  output aluout_in,
  output memout,
  output sr1,
  output sr2,
  output dr,
  output npc,
  output pcout_in,
  output W_control
  );

modport responder_port 
  (
  input clock,
  input reset,  
  input enable_writeback,
  input aluout_in,
  input memout,
  input sr1,
  input sr2,
  input dr,
  input npc,
  input pcout_in,
  input W_control
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

