//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: This file contains environment level sequences that will
//    be reused from block to top level simulations.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class LC3_env_sequence_base #( 
      type CONFIG_T
      ) extends uvmf_virtual_sequence_base #(.CONFIG_T(CONFIG_T));


  `uvm_object_param_utils( LC3_env_sequence_base #(
                           CONFIG_T
                           ) );

  
// This LC3_env_sequence_base contains a handle to a LC3_env_configuration object 
// named configuration.  This configuration variable contains a handle to each 
// sequencer within each agent within this environment and any sub-environments.
// The configuration object handle is automatically assigned in the pre_body in the
// base class of this sequence.  The configuration handle is retrieved from the
// virtual sequencer that this sequence is started on.
// Available sequencer handles within the environment configuration:

  // Initiator agent sequencers in LC3_environment:

  // Responder agent sequencers in LC3_environment:
    // configuration.Instruction_config.sequencer
    // configuration.Data_config.sequencer

  // Virtual sequencers in sub-environments located in sub-environment configuration
    // configuration.fe_env_config.vsqr
    // configuration.de_env_config.vsqr
    // configuration.ex_env_config.vsqr
    // configuration.wb_env_config.vsqr
    // configuration.ctrl_env_config.vsqr
    // configuration.memacc_env_config.vsqr




// This example shows how to use the environment sequence base for sub-environments
// It can only be used on environments generated with UVMF_2022.3 and later.
// Environment sequences generated with UVMF_2022.1 and earlier do not have the required 
//    environment level virtual sequencer
// typedef fetch_env_sequence_base #(
//         .CONFIG_T(fetch_env_configuration)
//         ) 
//         fe_env_sequence_base_t;
// rand fe_env_sequence_base_t fe_env_seq;

// typedef decode_env_sequence_base #(
//         .CONFIG_T(decode_env_configuration)
//         ) 
//         de_env_sequence_base_t;
// rand de_env_sequence_base_t de_env_seq;

// typedef execute_env_sequence_base #(
//         .CONFIG_T(execute_env_configuration)
//         ) 
//         ex_env_sequence_base_t;
// rand ex_env_sequence_base_t ex_env_seq;

// typedef write_back_env_sequence_base #(
//         .CONFIG_T(write_back_env_configuration)
//         ) 
//         wb_env_sequence_base_t;
// rand wb_env_sequence_base_t wb_env_seq;

// typedef control_env_sequence_base #(
//         .CONFIG_T(control_env_configuration)
//         ) 
//         ctrl_env_sequence_base_t;
// rand ctrl_env_sequence_base_t ctrl_env_seq;

// typedef memaccess_env_sequence_base #(
//         .CONFIG_T(memaccess_env_configuration)
//         ) 
//         memacc_env_sequence_base_t;
// rand memacc_env_sequence_base_t memacc_env_seq;



  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  function new(string name = "" );
    super.new(name);

//     fe_env_seq = fe_env_sequence_base_t::type_id::create("fe_env_seq");
//     de_env_seq = de_env_sequence_base_t::type_id::create("de_env_seq");
//     ex_env_seq = ex_env_sequence_base_t::type_id::create("ex_env_seq");
//     wb_env_seq = wb_env_sequence_base_t::type_id::create("wb_env_seq");
//     ctrl_env_seq = ctrl_env_sequence_base_t::type_id::create("ctrl_env_seq");
//     memacc_env_seq = memacc_env_sequence_base_t::type_id::create("memacc_env_seq");

  endfunction

  virtual task body();

  

//     fe_env_seq.start(configuration.fe_env_config.vsqr);
//     de_env_seq.start(configuration.de_env_config.vsqr);
//     ex_env_seq.start(configuration.ex_env_config.vsqr);
//     wb_env_seq.start(configuration.wb_env_config.vsqr);
//     ctrl_env_seq.start(configuration.ctrl_env_config.vsqr);
//     memacc_env_seq.start(configuration.memacc_env_config.vsqr);

  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

