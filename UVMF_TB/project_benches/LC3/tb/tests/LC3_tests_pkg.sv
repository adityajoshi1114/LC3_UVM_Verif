//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// DESCRIPTION: This package contains all tests currently written for
//     the simulation project.  Once compiled, any test can be selected
//     from the vsim command line using +UVM_TESTNAME=yourTestNameHere
//
// CONTAINS:
//     -<test_top>
//     -<example_derived_test>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

package LC3_tests_pkg;

   import uvm_pkg::*;
   import uvmf_base_pkg::*;
   import LC3_parameters_pkg::*;
   import LC3_env_pkg::*;
   import LC3_sequences_pkg::*;
   import fetch_in_pkg::*;
   import fetch_in_pkg_hdl::*;
   import fetch_out_pkg::*;
   import fetch_out_pkg_hdl::*;
   import decode_in_pkg::*;
   import decode_in_pkg_hdl::*;
   import decode_out_pkg::*;
   import decode_out_pkg_hdl::*;
   import execute_in_pkg::*;
   import execute_in_pkg_hdl::*;
   import execute_out_pkg::*;
   import execute_out_pkg_hdl::*;
   import write_back_in_pkg::*;
   import write_back_in_pkg_hdl::*;
   import write_back_out_pkg::*;
   import write_back_out_pkg_hdl::*;
   import control_in_pkg::*;
   import control_in_pkg_hdl::*;
   import control_out_pkg::*;
   import control_out_pkg_hdl::*;
   import memaccess_in_pkg::*;
   import memaccess_in_pkg_hdl::*;
   import memaccess_out_pkg::*;
   import memaccess_out_pkg_hdl::*;
   import instruction_memory_pkg::*;
   import instruction_memory_pkg_hdl::*;
   import data_memory_pkg::*;
   import data_memory_pkg_hdl::*;


   `include "uvm_macros.svh"

  // pragma uvmf custom package_imports_additional begin 
  // pragma uvmf custom package_imports_additional end

   `include "src/test_top.svh"
   `include "src/register_test.svh"
   `include "src/example_derived_test.svh"
   `include "src/ALU_instr_test.svh"
   `include "src/CTRL_instr_test.svh"
   `include "src/MEM_instr_test.svh"

  // pragma uvmf custom package_item_additional begin
  // UVMF_CHANGE_ME : When adding new tests to the src directory
  //    be sure to add the test file here so that it will be
  //    compiled as part of the test package.  Be sure to place
  //    the new test after any base tests of the new test.
  // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

