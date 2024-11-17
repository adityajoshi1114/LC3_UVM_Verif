//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// PACKAGE: This file defines all of the files contained in the
//    interface package that will run on the host simulator.
//
// CONTAINS:
//    - <write_back_out_typedefs_hdl>
//    - <write_back_out_typedefs.svh>
//    - <write_back_out_transaction.svh>

//    - <write_back_out_configuration.svh>
//    - <write_back_out_driver.svh>
//    - <write_back_out_monitor.svh>

//    - <write_back_out_transaction_coverage.svh>
//    - <write_back_out_sequence_base.svh>
//    - <write_back_out_random_sequence.svh>

//    - <write_back_out_responder_sequence.svh>
//    - <write_back_out2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package write_back_out_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import write_back_out_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end

   export write_back_out_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/write_back_out_typedefs.svh"
   `include "src/write_back_out_transaction.svh"

   `include "src/write_back_out_configuration.svh"
   `include "src/write_back_out_driver.svh"
   `include "src/write_back_out_monitor.svh"

   `include "src/write_back_out_transaction_coverage.svh"
   `include "src/write_back_out_sequence_base.svh"
   `include "src/write_back_out_random_sequence.svh"

   `include "src/write_back_out_responder_sequence.svh"
   `include "src/write_back_out2reg_adapter.svh"

   `include "src/write_back_out_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

