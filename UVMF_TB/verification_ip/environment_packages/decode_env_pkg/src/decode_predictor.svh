//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//
// DESCRIPTION: This analysis component contains analysis_exports for receiving
//   data and analysis_ports for sending data.
// 
//   This analysis component has the following analysis_exports that receive the 
//   listed transaction type.
//   
//   observed_decode_in receives transactions of type  decode_in_transaction
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//  predictor_decode_out broadcasts transactions of type decode_out_transaction
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class decode_predictor #(
  type CONFIG_T,
  type BASE_T = uvm_component
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( decode_predictor #(
                              CONFIG_T,
                              BASE_T
                              ))


  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_observed_decode_in #(decode_in_transaction, decode_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) observed_decode_in;

  
  // Instantiate the analysis ports
  uvm_analysis_port #(decode_out_transaction) predictor_decode_out;


  // Transaction variable for predicted values to be sent out predictor_decode_out
  // Once a transaction is sent through an analysis_port, another transaction should
  // be constructed for the next predicted transaction. 
  typedef decode_out_transaction predictor_decode_out_output_transaction_t;
  predictor_decode_out_output_transaction_t predictor_decode_out_output_transaction;
  // Code for sending output transaction out through predictor_decode_out
  // predictor_decode_out.write(predictor_decode_out_output_transaction);

  // Define transaction handles for debug visibility 
  decode_in_transaction observed_decode_in_debug;


  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // FUNCTION: new
  function new(string name, uvm_component parent);
     super.new(name,parent);
    `uvm_warning("PREDICTOR_REVIEW", "This predictor has been created either through generation or re-generation with merging.  Remove this warning after the predictor has been reviewed.")
  // pragma uvmf custom new begin
  // pragma uvmf custom new end
  endfunction

  // FUNCTION: build_phase
  virtual function void build_phase (uvm_phase phase);

    observed_decode_in = new("observed_decode_in", this);
    predictor_decode_out =new("predictor_decode_out", this );
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_observed_decode_in
  // Transactions received through observed_decode_in initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_observed_decode_in(decode_in_transaction t);
    // pragma uvmf custom observed_decode_in_predictor begin
    observed_decode_in_debug = t;
    `uvm_info("PRED", "Transaction Received through observed_decode_in", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    predictor_decode_out_output_transaction = predictor_decode_out_output_transaction_t::type_id::create("predictor_decode_out_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "UVMF_CHANGE_ME: The decode_predictor::write_observed_decode_in function needs to be completed with DUT prediction model",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
 
    // Code for sending output transaction out through predictor_decode_out
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    predictor_decode_out.write(predictor_decode_out_output_transaction);
    // pragma uvmf custom observed_decode_in_predictor end
  endfunction


endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

