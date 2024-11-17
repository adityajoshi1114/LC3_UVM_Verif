//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: This environment contains all agents, predictors and
// scoreboards required for the block level design.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class LC3_environment  extends uvmf_environment_base #(
    .CONFIG_T( LC3_env_configuration 
  ));
  `uvm_component_utils( LC3_environment )

  typedef fetch_environment fe_env_t;
  fe_env_t fe_env;
   
  typedef decode_environment de_env_t;
  de_env_t de_env;
   
  typedef execute_environment ex_env_t;
  ex_env_t ex_env;
   
  typedef write_back_environment wb_env_t;
  wb_env_t wb_env;
   
  typedef control_environment ctrl_env_t;
  ctrl_env_t ctrl_env;
   
  typedef memaccess_environment memacc_env_t;
  memacc_env_t memacc_env;
   




  typedef instruction_memory_agent  Instruction_t;
  Instruction_t Instruction;

  typedef data_memory_agent  Data_t;
  Data_t Data;








  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(LC3_env_configuration)) LC3_vsqr_t;
  LC3_vsqr_t vsqr;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
 
// ****************************************************************************
// FUNCTION : new()
// This function is the standard SystemVerilog constructor.
//
  function new( string name = "", uvm_component parent = null );
    super.new( name, parent );
  endfunction

// ****************************************************************************
// FUNCTION: build_phase()
// This function builds all components within this environment.
//
  virtual function void build_phase(uvm_phase phase);
// pragma uvmf custom build_phase_pre_super begin
// pragma uvmf custom build_phase_pre_super end
    super.build_phase(phase);
    fe_env = fe_env_t::type_id::create("fe_env",this);
    fe_env.set_config(configuration.fe_env_config);
    de_env = de_env_t::type_id::create("de_env",this);
    de_env.set_config(configuration.de_env_config);
    ex_env = ex_env_t::type_id::create("ex_env",this);
    ex_env.set_config(configuration.ex_env_config);
    wb_env = wb_env_t::type_id::create("wb_env",this);
    wb_env.set_config(configuration.wb_env_config);
    ctrl_env = ctrl_env_t::type_id::create("ctrl_env",this);
    ctrl_env.set_config(configuration.ctrl_env_config);
    memacc_env = memacc_env_t::type_id::create("memacc_env",this);
    memacc_env.set_config(configuration.memacc_env_config);
    Instruction = Instruction_t::type_id::create("Instruction",this);
    Instruction.set_config(configuration.Instruction_config);
    Data = Data_t::type_id::create("Data",this);
    Data.set_config(configuration.Data_config);

    vsqr = LC3_vsqr_t::type_id::create("vsqr", this);
    vsqr.set_config(configuration);
    configuration.set_vsqr(vsqr);

    // pragma uvmf custom build_phase begin
    // pragma uvmf custom build_phase end
  endfunction

// ****************************************************************************
// FUNCTION: connect_phase()
// This function makes all connections within this environment.  Connections
// typically inclue agent to predictor, predictor to scoreboard and scoreboard
// to agent.
//
  virtual function void connect_phase(uvm_phase phase);
// pragma uvmf custom connect_phase_pre_super begin
// pragma uvmf custom connect_phase_pre_super end
    super.connect_phase(phase);
    // pragma uvmf custom reg_model_connect_phase begin
    // pragma uvmf custom reg_model_connect_phase end
  endfunction

// ****************************************************************************
// FUNCTION: end_of_simulation_phase()
// This function is executed just prior to executing run_phase.  This function
// was added to the environment to sample environment configuration settings
// just before the simulation exits time 0.  The configuration structure is 
// randomized in the build phase before the environment structure is constructed.
// Configuration variables can be customized after randomization in the build_phase
// of the extended test.
// If a sequence modifies values in the configuration structure then the sequence is
// responsible for sampling the covergroup in the configuration if required.
//
  virtual function void start_of_simulation_phase(uvm_phase phase);
     configuration.LC3_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

