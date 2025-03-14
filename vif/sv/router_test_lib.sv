class base_test extends uvm_test;
  // Register with factory
  `uvm_component_utils(base_test)
  
  // Testbench instance
  router_tb tb;
  
  // Component constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("BUILD", "Base test build phase executing", UVM_HIGH)
    
    // Enable transaction recording
    uvm_config_int::set(this, "*", "recording_detail", 1);
    
    // Set sequencer default sequence for run_phase
    uvm_config_wrapper::set(this, "tb.yapp.agent.sequencer.run_phase",
    "default_sequence",
     yapp_5_packets::get_type());
    
    // Create the testbench
    tb = router_tb::type_id::create("tb", this);
  endfunction
  
  // End of elaboration phase - print topology
  function void end_of_elaboration_phase(uvm_phase phase);
    uvm_top.print_topology();
  endfunction
  
  // Start of simulation phase
  function void start_of_simulation_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "start_of_simulation phase", UVM_HIGH)
  endfunction
  
  // Check phase - check config usage
  function void check_phase(uvm_phase phase);
    check_config_usage();
  endfunction

  // Run phase - set drain time for objection mechanism
  virtual task run_phase(uvm_phase phase);
    uvm_objection obj = phase.get_objection();
    obj.set_drain_time(this, 200ns);
  endtask

endclass

//------------------------------------------------------------------------------
// NEW TEST: yapp_012_test - Sets default sequence to yapp_012_seq
//------------------------------------------------------------------------------
class yapp_012_test extends base_test;
  // Register with factory
  `uvm_component_utils(yapp_012_test)
  
  // Component constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // Build phase
  function void build_phase(uvm_phase phase);
    // Set the default sequence to yapp_012_seq
    uvm_config_wrapper::set(this, "tb.yapp.agent.sequencer.run_phase",
    "default_sequence", yapp_012_seq::get_type());
    
    // Call parent's build phase
    super.build_phase(phase);
  endfunction
endclass
