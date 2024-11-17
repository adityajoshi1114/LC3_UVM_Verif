//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: THis is the configuration for the LC3 environment.
//  it contains configuration classes for each agent.  It also contains
//  environment level configuration variables.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class LC3_env_configuration 
extends uvmf_environment_configuration_base;

  `uvm_object_utils( LC3_env_configuration )


//Constraints for the configuration variables:


  covergroup LC3_configuration_cg;
    // pragma uvmf custom covergroup begin
    option.auto_bin_max=1024;
    // pragma uvmf custom covergroup end
  endgroup

typedef fetch_env_configuration fe_env_config_t;
rand fe_env_config_t fe_env_config;

typedef decode_env_configuration de_env_config_t;
rand de_env_config_t de_env_config;

typedef execute_env_configuration ex_env_config_t;
rand ex_env_config_t ex_env_config;

typedef write_back_env_configuration wb_env_config_t;
rand wb_env_config_t wb_env_config;

typedef control_env_configuration ctrl_env_config_t;
rand ctrl_env_config_t ctrl_env_config;

typedef memaccess_env_configuration memacc_env_config_t;
rand memacc_env_config_t memacc_env_config;


    typedef instruction_memory_configuration Instruction_config_t;
    rand Instruction_config_t Instruction_config;

    typedef data_memory_configuration Data_config_t;
    rand Data_config_t Data_config;


    string                fe_env_interface_names[];
    uvmf_active_passive_t fe_env_interface_activity[];
    string                de_env_interface_names[];
    uvmf_active_passive_t de_env_interface_activity[];
    string                ex_env_interface_names[];
    uvmf_active_passive_t ex_env_interface_activity[];
    string                wb_env_interface_names[];
    uvmf_active_passive_t wb_env_interface_activity[];
    string                ctrl_env_interface_names[];
    uvmf_active_passive_t ctrl_env_interface_activity[];
    string                memacc_env_interface_names[];
    uvmf_active_passive_t memacc_env_interface_activity[];


  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(LC3_env_configuration)) LC3_vsqr_t;
  LC3_vsqr_t vsqr;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

// ****************************************************************************
// FUNCTION : new()
// This function is the standard SystemVerilog constructor.
// This function constructs the configuration object for each agent in the environment.
//
  function new( string name = "" );
    super.new( name );

   fe_env_config = fe_env_config_t::type_id::create("fe_env_config");
   de_env_config = de_env_config_t::type_id::create("de_env_config");
   ex_env_config = ex_env_config_t::type_id::create("ex_env_config");
   wb_env_config = wb_env_config_t::type_id::create("wb_env_config");
   ctrl_env_config = ctrl_env_config_t::type_id::create("ctrl_env_config");
   memacc_env_config = memacc_env_config_t::type_id::create("memacc_env_config");

    Instruction_config = Instruction_config_t::type_id::create("Instruction_config");
    Data_config = Data_config_t::type_id::create("Data_config");


    LC3_configuration_cg=new;
    `uvm_warning("COVERAGE_MODEL_REVIEW", "A covergroup has been constructed which may need review because of either generation or re-generation with merging.  Please note that configuration variables added as a result of re-generation and merging are not automatically added to the covergroup.  Remove this warning after the covergroup has been reviewed.")

  // pragma uvmf custom new begin
  // pragma uvmf custom new end
  endfunction

// ****************************************************************************
// FUNCTION : set_vsqr()
// This function is used to assign the vsqr handle.
  virtual function void set_vsqr( LC3_vsqr_t vsqr);
     this.vsqr = vsqr;
  endfunction : set_vsqr

// ****************************************************************************
// FUNCTION: post_randomize()
// This function is automatically called after the randomize() function 
// is executed.
//
  function void post_randomize();
    super.post_randomize();
    // pragma uvmf custom post_randomize begin
    // pragma uvmf custom post_randomize end
  endfunction
  
// ****************************************************************************
// FUNCTION: convert2string()
// This function converts all variables in this class to a single string for
// logfile reporting. This function concatenates the convert2string result for
// each agent configuration in this configuration class.
//
  virtual function string convert2string();
    // pragma uvmf custom convert2string begin
    return {
     
     "\n", Instruction_config.convert2string,
     "\n", Data_config.convert2string,
     "\n", fe_env_config.convert2string,
     "\n", de_env_config.convert2string,
     "\n", ex_env_config.convert2string,
     "\n", wb_env_config.convert2string,
     "\n", ctrl_env_config.convert2string,
     "\n", memacc_env_config.convert2string

       };
    // pragma uvmf custom convert2string end
  endfunction
// ****************************************************************************
// FUNCTION: initialize();
// This function configures each interface agents configuration class.  The 
// sim level determines the active/passive state of the agent.  The environment_path
// identifies the hierarchy down to and including the instantiation name of the
// environment for this configuration class.  Each instance of the environment 
// has its own configuration class.  The string interface names are used by 
// the agent configurations to identify the virtual interface handle to pull from
// the uvm_config_db.  
//
  function void initialize(uvmf_sim_level_t sim_level, 
                                      string environment_path,
                                      string interface_names[],
                                      uvm_reg_block register_model = null,
                                      uvmf_active_passive_t interface_activity[] = {}
                                     );

    super.initialize(sim_level, environment_path, interface_names, register_model, interface_activity);

  // Interface initialization for sub-environments
    fe_env_interface_names    = new[2];
    fe_env_interface_activity = new[2];

    fe_env_interface_names     = interface_names[0:1];
    fe_env_interface_activity  = interface_activity[0:1];
    de_env_interface_names    = new[2];
    de_env_interface_activity = new[2];

    de_env_interface_names     = interface_names[2:3];
    de_env_interface_activity  = interface_activity[2:3];
    ex_env_interface_names    = new[2];
    ex_env_interface_activity = new[2];

    ex_env_interface_names     = interface_names[4:5];
    ex_env_interface_activity  = interface_activity[4:5];
    wb_env_interface_names    = new[2];
    wb_env_interface_activity = new[2];

    wb_env_interface_names     = interface_names[6:7];
    wb_env_interface_activity  = interface_activity[6:7];
    ctrl_env_interface_names    = new[2];
    ctrl_env_interface_activity = new[2];

    ctrl_env_interface_names     = interface_names[8:9];
    ctrl_env_interface_activity  = interface_activity[8:9];
    memacc_env_interface_names    = new[2];
    memacc_env_interface_activity = new[2];

    memacc_env_interface_names     = interface_names[10:11];
    memacc_env_interface_activity  = interface_activity[10:11];


  // Interface initialization for local agents
     Instruction_config.initialize( interface_activity[12], {environment_path,".Instruction"}, interface_names[12]);
     Instruction_config.initiator_responder = RESPONDER;
     // Instruction_config.has_coverage = 1;
     Data_config.initialize( interface_activity[13], {environment_path,".Data"}, interface_names[13]);
     Data_config.initiator_responder = RESPONDER;
     // Data_config.has_coverage = 1;


     fe_env_config.initialize( sim_level, {environment_path,".fe_env"}, fe_env_interface_names, null,   fe_env_interface_activity);
     de_env_config.initialize( sim_level, {environment_path,".de_env"}, de_env_interface_names, null,   de_env_interface_activity);
     ex_env_config.initialize( sim_level, {environment_path,".ex_env"}, ex_env_interface_names, null,   ex_env_interface_activity);
     wb_env_config.initialize( sim_level, {environment_path,".wb_env"}, wb_env_interface_names, null,   wb_env_interface_activity);
     ctrl_env_config.initialize( sim_level, {environment_path,".ctrl_env"}, ctrl_env_interface_names, null,   ctrl_env_interface_activity);
     memacc_env_config.initialize( sim_level, {environment_path,".memacc_env"}, memacc_env_interface_names, null,   memacc_env_interface_activity);



  // pragma uvmf custom initialize begin
  // pragma uvmf custom initialize end

  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

