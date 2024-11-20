//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------                     
//               
// Description: This top level module instantiates all synthesizable
//    static content.  This and tb_top.sv are the two top level modules
//    of the simulation.  
//
//    This module instantiates the following:
//        DUT: The Design Under Test
//        Interfaces:  Signal bundles that contain signals connected to DUT
//        Driver BFM's: BFM's that actively drive interface signals
//        Monitor BFM's: BFM's that passively monitor interface signals
//
//----------------------------------------------------------------------

//----------------------------------------------------------------------
//

module hdl_top;

import LC3_parameters_pkg::*;
import uvmf_base_pkg_hdl::*;

// pragma uvmf custom clock_generator begin
  bit clk;
  // Instantiate a clk driver 
  initial begin
    clk = 0;
    #20ns;
    forever begin
      clk = ~clk;
      #5ns;
    end
  end
// pragma uvmf custom clock_generator end

// pragma uvmf custom reset_generator begin
  bit rst;
  // Instantiate a rst driver
  initial begin
    rst = 0; 
    #250ns;
    rst =  1; 
  end
// pragma uvmf custom reset_generator end

  // pragma uvmf custom module_item_additional begin
   tri [15:0] PC, Instr, data_addr, data_o, data_i;
   tri  Imem_en, Dmem_en, cmp_i, cmp_d; 
  // pragma uvmf custom module_item_additional end

  // Instantiate the signal bundle, monitor bfm and driver bfm for each interface.
  // The signal bundle, _if, contains signals to be connected to the DUT.
  // The monitor, monitor_bfm, observes the bus, _if, and captures transactions.
  // The driver, driver_bfm, drives transactions onto the bus, _if.
  fetch_in_if  fe_env_in_agent_bus(
     // pragma uvmf custom fe_env_in_agent_bus_connections begin
     .clock(clk), .reset(rst)
     // pragma uvmf custom fe_env_in_agent_bus_connections end
     );
  fetch_out_if  fe_env_out_agent_bus(
     // pragma uvmf custom fe_env_out_agent_bus_connections begin
     .clock(clk), .reset(rst)
     // pragma uvmf custom fe_env_out_agent_bus_connections end
     );
  decode_in_if  de_env_agent_in_bus(
     // pragma uvmf custom de_env_agent_in_bus_connections begin
     .clock(clk), .reset(rst)
     // pragma uvmf custom de_env_agent_in_bus_connections end
     );
  decode_out_if  de_env_agent_out_bus(
     // pragma uvmf custom de_env_agent_out_bus_connections begin
     .clock(clk), .reset(rst)
     // pragma uvmf custom de_env_agent_out_bus_connections end
     );
  execute_in_if  ex_env_agent_in_bus(
     // pragma uvmf custom ex_env_agent_in_bus_connections begin
     .clock(clk), .reset(rst)
     // pragma uvmf custom ex_env_agent_in_bus_connections end
     );
  execute_out_if  ex_env_agent_out_bus(
     // pragma uvmf custom ex_env_agent_out_bus_connections begin
     .clock(clk), .reset(rst)
     // pragma uvmf custom ex_env_agent_out_bus_connections end
     );
  write_back_in_if  wb_env_agent_in_bus(
     // pragma uvmf custom wb_env_agent_in_bus_connections begin
     .clock(clk), .reset(rst)
     // pragma uvmf custom wb_env_agent_in_bus_connections end
     );
  write_back_out_if  wb_env_agent_out_bus(
     // pragma uvmf custom wb_env_agent_out_bus_connections begin
     .clock(clk), .reset(rst)
     // pragma uvmf custom wb_env_agent_out_bus_connections end
     );
  control_in_if  ctrl_env_agent_in_bus(
     // pragma uvmf custom ctrl_env_agent_in_bus_connections begin
     .clock(clk), .reset(rst)
     // pragma uvmf custom ctrl_env_agent_in_bus_connections end
     );
  control_out_if  ctrl_env_agent_out_bus(
     // pragma uvmf custom ctrl_env_agent_out_bus_connections begin
     .clock(clk), .reset(rst)
     // pragma uvmf custom ctrl_env_agent_out_bus_connections end
     );
  memaccess_in_if  memacc_env_agent_in_bus(
     // pragma uvmf custom memacc_env_agent_in_bus_connections begin
     .clock(clk), .reset(rst)
     // pragma uvmf custom memacc_env_agent_in_bus_connections end
     );
  memaccess_out_if  memacc_env_agent_out_bus(
     // pragma uvmf custom memacc_env_agent_out_bus_connections begin
     .clock(clk), .reset(rst)
     // pragma uvmf custom memacc_env_agent_out_bus_connections end
     );
  instruction_memory_if  Instruction_bus(
     // pragma uvmf custom Instruction_bus_connections begin
     .clock(clk), .reset(rst), .PC(PC), .instrmem_rd(Imem_en), .instr_dout(Instr), .complete_instr(cmp_i)
     // pragma uvmf custom Instruction_bus_connections end
     );
  data_memory_if  Data_bus(
     // pragma uvmf custom Data_bus_connections begin
     .clock(clk), .reset(rst), .complete_data(cmp_d), .Data_dout(data_o), .Data_din(data_i), .Data_rd(Dmem_en), .Data_addr(data_addr)
     // pragma uvmf custom Data_bus_connections end
     );
  fetch_in_monitor_bfm  fe_env_in_agent_mon_bfm(fe_env_in_agent_bus);
  fetch_out_monitor_bfm  fe_env_out_agent_mon_bfm(fe_env_out_agent_bus);
  decode_in_monitor_bfm  de_env_agent_in_mon_bfm(de_env_agent_in_bus);
  decode_out_monitor_bfm  de_env_agent_out_mon_bfm(de_env_agent_out_bus);
  execute_in_monitor_bfm  ex_env_agent_in_mon_bfm(ex_env_agent_in_bus);
  execute_out_monitor_bfm  ex_env_agent_out_mon_bfm(ex_env_agent_out_bus);
  write_back_in_monitor_bfm  wb_env_agent_in_mon_bfm(wb_env_agent_in_bus);
  write_back_out_monitor_bfm  wb_env_agent_out_mon_bfm(wb_env_agent_out_bus);
  control_in_monitor_bfm  ctrl_env_agent_in_mon_bfm(ctrl_env_agent_in_bus);
  control_out_monitor_bfm  ctrl_env_agent_out_mon_bfm(ctrl_env_agent_out_bus);
  memaccess_in_monitor_bfm  memacc_env_agent_in_mon_bfm(memacc_env_agent_in_bus);
  memaccess_out_monitor_bfm  memacc_env_agent_out_mon_bfm(memacc_env_agent_out_bus);
  instruction_memory_monitor_bfm  Instruction_mon_bfm(Instruction_bus);
  data_memory_monitor_bfm  Data_mon_bfm(Data_bus);
  instruction_memory_driver_bfm  Instruction_drv_bfm(Instruction_bus);
  data_memory_driver_bfm  Data_drv_bfm(Data_bus);

  // pragma uvmf custom dut_instantiation begin
  // UVMF_CHANGE_ME : Add DUT and connect to signals in _bus interfaces listed above
  // Instantiate your DUT here
  // These DUT's instantiated to show verilog and vhdl instantiation
   LC3    LC3_inst (	.clock(clk), .reset(rst), .pc(PC), .instrmem_rd(Imem_en), .Instr_dout(Instr), .Data_addr(data_addr), .complete_instr(cmp_i), .complete_data(cmp_d),  
				         .Data_din(data_i), .Data_dout(data_o), .Data_rd(Dmem_en)			
			          );
  // pragma uvmf custom dut_instantiation end

  initial begin      import uvm_pkg::uvm_config_db;
    // The monitor_bfm and driver_bfm for each interface is placed into the uvm_config_db.
    // They are placed into the uvm_config_db using the string names defined in the parameters package.
    // The string names are passed to the agent configurations by test_top through the top level configuration.
    // They are retrieved by the agents configuration class for use by the agent.
    uvm_config_db #( virtual fetch_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , fe_env_in_agent_BFM , fe_env_in_agent_mon_bfm ); 
    uvm_config_db #( virtual fetch_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , fe_env_out_agent_BFM , fe_env_out_agent_mon_bfm ); 
    uvm_config_db #( virtual decode_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , de_env_agent_in_BFM , de_env_agent_in_mon_bfm ); 
    uvm_config_db #( virtual decode_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , de_env_agent_out_BFM , de_env_agent_out_mon_bfm ); 
    uvm_config_db #( virtual execute_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , ex_env_agent_in_BFM , ex_env_agent_in_mon_bfm ); 
    uvm_config_db #( virtual execute_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , ex_env_agent_out_BFM , ex_env_agent_out_mon_bfm ); 
    uvm_config_db #( virtual write_back_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , wb_env_agent_in_BFM , wb_env_agent_in_mon_bfm ); 
    uvm_config_db #( virtual write_back_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , wb_env_agent_out_BFM , wb_env_agent_out_mon_bfm ); 
    uvm_config_db #( virtual control_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , ctrl_env_agent_in_BFM , ctrl_env_agent_in_mon_bfm ); 
    uvm_config_db #( virtual control_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , ctrl_env_agent_out_BFM , ctrl_env_agent_out_mon_bfm ); 
    uvm_config_db #( virtual memaccess_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , memacc_env_agent_in_BFM , memacc_env_agent_in_mon_bfm ); 
    uvm_config_db #( virtual memaccess_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , memacc_env_agent_out_BFM , memacc_env_agent_out_mon_bfm ); 
    uvm_config_db #( virtual instruction_memory_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , Instruction_BFM , Instruction_mon_bfm ); 
    uvm_config_db #( virtual data_memory_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , Data_BFM , Data_mon_bfm ); 
    uvm_config_db #( virtual instruction_memory_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , Instruction_BFM , Instruction_drv_bfm  );
    uvm_config_db #( virtual data_memory_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , Data_BFM , Data_drv_bfm  );
  end

endmodule

// pragma uvmf custom external begin
// pragma uvmf custom external end

