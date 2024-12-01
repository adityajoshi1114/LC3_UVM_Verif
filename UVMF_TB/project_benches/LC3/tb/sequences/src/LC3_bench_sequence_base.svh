//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// Description: This file contains the top level and utility sequences
//     used by test_top. It can be extended to create derivative top
//     level sequences.
//
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//


typedef LC3_env_configuration  LC3_env_configuration_t;

class LC3_bench_sequence_base extends uvmf_sequence_base #(uvm_sequence_item);

  `uvm_object_utils( LC3_bench_sequence_base );

  // pragma uvmf custom sequences begin

// This example shows how to use the environment sequence base
// It can only be used on environments generated with UVMF_2022.3 and later.
// Environment sequences generated with UVMF_2022.1 and earlier do not have the required 
//    environment level virtual sequencer
// typedef LC3_env_sequence_base #(
//         .CONFIG_T(LC3_env_configuration_t)// 
//         )
//         LC3_env_sequence_base_t;
// rand LC3_env_sequence_base_t LC3_env_seq;



  // UVMF_CHANGE_ME : Instantiate, construct, and start sequences as needed to create stimulus scenarios.
  // Instantiate sequences here
  typedef instruction_memory_responder_sequence  Instruction_responder_seq_t;
  Instruction_responder_seq_t Instruction_responder_seq;
  typedef data_memory_responder_sequence  Data_responder_seq_t;
  Data_responder_seq_t Data_responder_seq;
  // pragma uvmf custom sequences end

  // Sequencer handles for each active interface in the environment
  typedef instruction_memory_transaction  Instruction_transaction_t;
  uvm_sequencer #(Instruction_transaction_t)  Instruction_sequencer; 
  typedef data_memory_transaction  Data_transaction_t;
  uvm_sequencer #(Data_transaction_t)  Data_sequencer; 


  // Top level environment configuration handle
  LC3_env_configuration_t top_configuration;

  // Configuration handles to access interface BFM's
  fetch_in_configuration  fe_env_in_agent_config;
  fetch_out_configuration  fe_env_out_agent_config;
  decode_in_configuration  de_env_agent_in_config;
  decode_out_configuration  de_env_agent_out_config;
  execute_in_configuration  ex_env_agent_in_config;
  execute_out_configuration  ex_env_agent_out_config;
  write_back_in_configuration  wb_env_agent_in_config;
  write_back_out_configuration  wb_env_agent_out_config;
  control_in_configuration  ctrl_env_agent_in_config;
  control_out_configuration  ctrl_env_agent_out_config;
  memaccess_in_configuration  memacc_env_agent_in_config;
  memaccess_out_configuration  memacc_env_agent_out_config;
  instruction_memory_configuration  Instruction_config;
  data_memory_configuration  Data_config;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  function new( string name = "" );
    super.new( name );
    // Retrieve the configuration handles from the uvm_config_db

    // Retrieve top level configuration handle
    if ( !uvm_config_db#(LC3_env_configuration_t)::get(null,UVMF_CONFIGURATIONS, "TOP_ENV_CONFIG",top_configuration) ) begin
      `uvm_info("CFG", "*** FATAL *** uvm_config_db::get can not find TOP_ENV_CONFIG.  Are you using an older UVMF release than what was used to generate this bench?",UVM_NONE);
      `uvm_fatal("CFG", "uvm_config_db#(LC3_env_configuration_t)::get cannot find resource TOP_ENV_CONFIG");
    end

    // Retrieve config handles for all agents
    if( !uvm_config_db #( fetch_in_configuration )::get( null , UVMF_CONFIGURATIONS , fe_env_in_agent_BFM , fe_env_in_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( fetch_in_configuration )::get cannot find resource fe_env_in_agent_BFM" )
    if( !uvm_config_db #( fetch_out_configuration )::get( null , UVMF_CONFIGURATIONS , fe_env_out_agent_BFM , fe_env_out_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( fetch_out_configuration )::get cannot find resource fe_env_out_agent_BFM" )
    if( !uvm_config_db #( decode_in_configuration )::get( null , UVMF_CONFIGURATIONS , de_env_agent_in_BFM , de_env_agent_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( decode_in_configuration )::get cannot find resource de_env_agent_in_BFM" )
    if( !uvm_config_db #( decode_out_configuration )::get( null , UVMF_CONFIGURATIONS , de_env_agent_out_BFM , de_env_agent_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( decode_out_configuration )::get cannot find resource de_env_agent_out_BFM" )
    if( !uvm_config_db #( execute_in_configuration )::get( null , UVMF_CONFIGURATIONS , ex_env_agent_in_BFM , ex_env_agent_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( execute_in_configuration )::get cannot find resource ex_env_agent_in_BFM" )
    if( !uvm_config_db #( execute_out_configuration )::get( null , UVMF_CONFIGURATIONS , ex_env_agent_out_BFM , ex_env_agent_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( execute_out_configuration )::get cannot find resource ex_env_agent_out_BFM" )
    if( !uvm_config_db #( write_back_in_configuration )::get( null , UVMF_CONFIGURATIONS , wb_env_agent_in_BFM , wb_env_agent_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( write_back_in_configuration )::get cannot find resource wb_env_agent_in_BFM" )
    if( !uvm_config_db #( write_back_out_configuration )::get( null , UVMF_CONFIGURATIONS , wb_env_agent_out_BFM , wb_env_agent_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( write_back_out_configuration )::get cannot find resource wb_env_agent_out_BFM" )
    if( !uvm_config_db #( control_in_configuration )::get( null , UVMF_CONFIGURATIONS , ctrl_env_agent_in_BFM , ctrl_env_agent_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( control_in_configuration )::get cannot find resource ctrl_env_agent_in_BFM" )
    if( !uvm_config_db #( control_out_configuration )::get( null , UVMF_CONFIGURATIONS , ctrl_env_agent_out_BFM , ctrl_env_agent_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( control_out_configuration )::get cannot find resource ctrl_env_agent_out_BFM" )
    if( !uvm_config_db #( memaccess_in_configuration )::get( null , UVMF_CONFIGURATIONS , memacc_env_agent_in_BFM , memacc_env_agent_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( memaccess_in_configuration )::get cannot find resource memacc_env_agent_in_BFM" )
    if( !uvm_config_db #( memaccess_out_configuration )::get( null , UVMF_CONFIGURATIONS , memacc_env_agent_out_BFM , memacc_env_agent_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( memaccess_out_configuration )::get cannot find resource memacc_env_agent_out_BFM" )
    if( !uvm_config_db #( instruction_memory_configuration )::get( null , UVMF_CONFIGURATIONS , Instruction_BFM , Instruction_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( instruction_memory_configuration )::get cannot find resource Instruction_BFM" )
    if( !uvm_config_db #( data_memory_configuration )::get( null , UVMF_CONFIGURATIONS , Data_BFM , Data_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( data_memory_configuration )::get cannot find resource Data_BFM" )

    // Assign the sequencer handles from the handles within agent configurations
    Instruction_sequencer = Instruction_config.get_sequencer();
    Data_sequencer = Data_config.get_sequencer();



    // pragma uvmf custom new begin
    // pragma uvmf custom new end

  endfunction

  // ****************************************************************************
  virtual task body();
    // pragma uvmf custom body begin

    // Construct sequences here

    // LC3_env_seq = LC3_env_sequence_base_t::type_id::create("LC3_env_seq");

    Instruction_responder_seq  = Instruction_responder_seq_t::type_id::create("Instruction_responder_seq");
    Data_responder_seq  = Data_responder_seq_t::type_id::create("Data_responder_seq");
    fork
      fe_env_in_agent_config.wait_for_reset();
      fe_env_out_agent_config.wait_for_reset();
      de_env_agent_in_config.wait_for_reset();
      de_env_agent_out_config.wait_for_reset();
      ex_env_agent_in_config.wait_for_reset();
      ex_env_agent_out_config.wait_for_reset();
      wb_env_agent_in_config.wait_for_reset();
      wb_env_agent_out_config.wait_for_reset();
      ctrl_env_agent_in_config.wait_for_reset();
      ctrl_env_agent_out_config.wait_for_reset();
      Instruction_config.wait_for_reset();
      Data_config.wait_for_reset();
    join
    // Start RESPONDER sequences here
    fork
      Instruction_responder_seq.start(Instruction_sequencer);
      Data_responder_seq.start(Data_sequencer);
    join_any

// LC3_env_seq.start(top_configuration.vsqr);

    // UVMF_CHANGE_ME : Extend the simulation XXX number of clocks after 
    // the last sequence to allow for the last sequence item to flow 
    // through the design.
    // Use the below extra time if needed
    fork
      fe_env_in_agent_config.wait_for_num_clocks(10);
      fe_env_out_agent_config.wait_for_num_clocks(10);
      de_env_agent_in_config.wait_for_num_clocks(10);
      de_env_agent_out_config.wait_for_num_clocks(10);
      ex_env_agent_in_config.wait_for_num_clocks(10);
      ex_env_agent_out_config.wait_for_num_clocks(10);
      wb_env_agent_in_config.wait_for_num_clocks(10);
      wb_env_agent_out_config.wait_for_num_clocks(10);
      ctrl_env_agent_in_config.wait_for_num_clocks(10);
      ctrl_env_agent_out_config.wait_for_num_clocks(10);
      Instruction_config.wait_for_num_clocks(10);
      Data_config.wait_for_num_clocks(10);
    join

    // pragma uvmf custom body end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

