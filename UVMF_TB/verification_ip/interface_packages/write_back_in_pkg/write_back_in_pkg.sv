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
//    - <write_back_in_typedefs_hdl>
//    - <write_back_in_typedefs.svh>
//    - <write_back_in_transaction.svh>

//    - <write_back_in_configuration.svh>
//    - <write_back_in_driver.svh>
//    - <write_back_in_monitor.svh>

//    - <write_back_in_transaction_coverage.svh>
//    - <write_back_in_sequence_base.svh>
//    - <write_back_in_random_sequence.svh>

//    - <write_back_in_responder_sequence.svh>
//    - <write_back_in2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package write_back_in_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import write_back_in_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end

   export write_back_in_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/write_back_in_typedefs.svh"
   `include "src/write_back_in_transaction.svh"

   `include "src/write_back_in_configuration.svh"
   `include "src/write_back_in_driver.svh"
   `include "src/write_back_in_monitor.svh"

   `include "src/write_back_in_transaction_coverage.svh"
   `include "src/write_back_in_sequence_base.svh"
   `include "src/write_back_in_random_sequence.svh"

   `include "src/write_back_in_responder_sequence.svh"
   `include "src/write_back_in2reg_adapter.svh"

   `include "src/write_back_in_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

