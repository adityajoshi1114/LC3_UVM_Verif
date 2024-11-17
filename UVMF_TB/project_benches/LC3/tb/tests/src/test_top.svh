//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
// Description: This top level UVM test is the base class for all
//     future tests created for this project.
//
//     This test class contains:
//          Configuration:  The top level configuration for the project.
//          Environment:    The top level environment for the project.
//          Top_level_sequence:  The top level sequence for the project.
//                                        
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

typedef LC3_env_configuration LC3_env_configuration_t;
typedef LC3_environment LC3_environment_t;

class test_top extends uvmf_test_base #(.CONFIG_T(LC3_env_configuration_t), 
                                        .ENV_T(LC3_environment_t), 
                                        .TOP_LEVEL_SEQ_T(LC3_bench_sequence_base));

  `uvm_component_utils( test_top );


  string interface_names[] = {
    fe_env_in_agent_BFM /* fe_env_in_agent     [0] */ , 
    fe_env_out_agent_BFM /* fe_env_out_agent     [1] */ , 
    de_env_agent_in_BFM /* de_env_agent_in     [2] */ , 
    de_env_agent_out_BFM /* de_env_agent_out     [3] */ , 
    ex_env_agent_in_BFM /* ex_env_agent_in     [4] */ , 
    ex_env_agent_out_BFM /* ex_env_agent_out     [5] */ , 
    wb_env_agent_in_BFM /* wb_env_agent_in     [6] */ , 
    wb_env_agent_out_BFM /* wb_env_agent_out     [7] */ , 
    ctrl_env_agent_in_BFM /* ctrl_env_agent_in     [8] */ , 
    ctrl_env_agent_out_BFM /* ctrl_env_agent_out     [9] */ , 
    memacc_env_agent_in_BFM /* memacc_env_agent_in     [10] */ , 
    memacc_env_agent_out_BFM /* memacc_env_agent_out     [11] */ , 
    Instruction_BFM /* Instruction     [12] */ , 
    Data_BFM /* Data     [13] */ 
};

uvmf_active_passive_t interface_activities[] = { 
    PASSIVE /* fe_env_in_agent     [0] */ , 
    PASSIVE /* fe_env_out_agent     [1] */ , 
    PASSIVE /* de_env_agent_in     [2] */ , 
    PASSIVE /* de_env_agent_out     [3] */ , 
    PASSIVE /* ex_env_agent_in     [4] */ , 
    PASSIVE /* ex_env_agent_out     [5] */ , 
    PASSIVE /* wb_env_agent_in     [6] */ , 
    PASSIVE /* wb_env_agent_out     [7] */ , 
    PASSIVE /* ctrl_env_agent_in     [8] */ , 
    PASSIVE /* ctrl_env_agent_out     [9] */ , 
    PASSIVE /* memacc_env_agent_in     [10] */ , 
    PASSIVE /* memacc_env_agent_out     [11] */ , 
    ACTIVE /* Instruction     [12] */ , 
    ACTIVE /* Data     [13] */   };


  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  // FUNCTION: new()
  // This is the standard systemVerilog constructor.  All components are 
  // constructed in the build_phase to allow factory overriding.
  //
  function new( string name = "", uvm_component parent = null );
     super.new( name ,parent );
  endfunction



  // ****************************************************************************
  // FUNCTION: build_phase()
  // The construction of the configuration and environment classes is done in
  // the build_phase of uvmf_test_base.  Once the configuraton and environment
  // classes are built then the initialize call is made to perform the
  // following: 
  //     Monitor and driver BFM virtual interface handle passing into agents
  //     Set the active/passive state for each agent
  // Once this build_phase completes, the build_phase of the environment is
  // executed which builds the agents.
  //
  virtual function void build_phase(uvm_phase phase);
// pragma uvmf custom build_phase_pre_super begin
// pragma uvmf custom build_phase_pre_super end
    super.build_phase(phase);
    // pragma uvmf custom configuration_settings_post_randomize begin
    // pragma uvmf custom configuration_settings_post_randomize end
    configuration.initialize(NA, "uvm_test_top.environment", interface_names, null, interface_activities);
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

