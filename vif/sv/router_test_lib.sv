class base_test extends uvm_test;
  `uvm_component_utils(base_test)
  router_tb tb; //handle 

  // Constructor
  function new(string name = "base_test", uvm_component parent);
    super.new(name, parent);
    `uvm_info("Test : ","Constructor!",UVM_LOW);
  endfunction

  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Test : ","Build Phase!",UVM_HIGH);
    tb = router_tb :: type_id :: create("tb", this);

    // Enable transaction recording
    uvm_config_int::set(this, "*", "recording_detail", 1);
  endfunction

  // End of elaboration phase
  function void end_of_elaboration_phase(uvm_phase phase);
    uvm_top.print_topology();
  endfunction

  // Run phase - set drain time for objection mechanism
  virtual task run_phase(uvm_phase phase);
    uvm_objection obj = phase.get_objection();
    obj.set_drain_time(this, 200ns);
  endtask

  // Check phase - check config usage
  function void check_phase(uvm_phase phase);
    check_config_usage();
  endfunction
endclass

//------------------------------------------------------------------------------
// NEW TEST: yapp_012_test - Sets default sequence to yapp_012_seq
//------------------------------------------------------------------------------
class yapp_012_test extends base_test;
  `uvm_component_utils(yapp_012_test)

  // Constructor
  function new(string name = "yapp_012_test", uvm_component parent);
    super.new(name, parent);
    `uvm_info("yapp_012_test : ","Constructor!",UVM_LOW);
  endfunction

  // Build phase
  function void build_phase(uvm_phase phase);
    `uvm_info("yapp_012_test : ","Build Phase!",UVM_HIGH);
    
    // Set the default sequence to yapp_012_seq
    uvm_config_wrapper::set(this, "tb.yapp.agent.sequencer.run_phase", "default_sequence", yapp_012_seq::get_type());
    
    // Call parent's build phase
    super.build_phase(phase);
  endfunction
endclass
