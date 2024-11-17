//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// DESCRIPTION: This package contains test level parameters
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//


package LC3_parameters_pkg;

  import uvmf_base_pkg_hdl::*;

  // pragma uvmf custom package_imports_additional begin 
  // pragma uvmf custom package_imports_additional end


  // These parameters are used to uniquely identify each interface.  The monitor_bfm and
  // driver_bfm are placed into and retrieved from the uvm_config_db using these string 
  // names as the field_name. The parameter is also used to enable transaction viewing 
  // from the command line for selected interfaces using the UVM command line processing.
  parameter string fe_env_in_agent_BFM  = "fe_env_in_agent_BFM"; /* [0] */
  parameter string fe_env_out_agent_BFM  = "fe_env_out_agent_BFM"; /* [1] */
  parameter string de_env_agent_in_BFM  = "de_env_agent_in_BFM"; /* [2] */
  parameter string de_env_agent_out_BFM  = "de_env_agent_out_BFM"; /* [3] */
  parameter string ex_env_agent_in_BFM  = "ex_env_agent_in_BFM"; /* [4] */
  parameter string ex_env_agent_out_BFM  = "ex_env_agent_out_BFM"; /* [5] */
  parameter string wb_env_agent_in_BFM  = "wb_env_agent_in_BFM"; /* [6] */
  parameter string wb_env_agent_out_BFM  = "wb_env_agent_out_BFM"; /* [7] */
  parameter string ctrl_env_agent_in_BFM  = "ctrl_env_agent_in_BFM"; /* [8] */
  parameter string ctrl_env_agent_out_BFM  = "ctrl_env_agent_out_BFM"; /* [9] */
  parameter string memacc_env_agent_in_BFM  = "memacc_env_agent_in_BFM"; /* [10] */
  parameter string memacc_env_agent_out_BFM  = "memacc_env_agent_out_BFM"; /* [11] */
  parameter string Instruction_BFM  = "Instruction_BFM"; /* [12] */
  parameter string Data_BFM  = "Data_BFM"; /* [13] */

  // pragma uvmf custom package_item_additional begin
  // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

