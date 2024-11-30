class MEM_instr_test extends test_top;

  `uvm_component_utils( MEM_instr_test );

  function new( string name = "", uvm_component parent = null );
    super.new( name, parent );
  endfunction

  virtual function void build_phase(uvm_phase phase);
    // The factory override below is an example of how to replace the LC3_bench_sequence_base 
    // sequence with the example_derived_test_sequence.
    instruction_memory_responder_sequence::type_id::set_type_override(instruction_memory_memory_instr_sequence::get_type());
    // Execute the build_phase of test_top AFTER all factory overrides have been created.
    super.build_phase(phase);
    // pragma uvmf custom configuration_settings_post_randomize begin
    // UVMF_CHANGE_ME Test specific configuration values can be set here.  
    // The configuration structure has already been randomized.
    // pragma uvmf custom configuration_settings_post_randomize end
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

