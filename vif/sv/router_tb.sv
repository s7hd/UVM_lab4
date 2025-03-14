class router_tb extends uvm_env;
  
  // UVC handles
  yapp_tx_env yapp;
  
  // Register with factory
  `uvm_component_utils(router_tb)
  
  // Component constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("BUILD", "Router testbench build phase executing", UVM_HIGH)
    
    // Create the YAPP UVC instance
    yapp = yapp_tx_env::type_id::create("yapp", this);
  endfunction
  
  // Start of simulation phase
  function void start_of_simulation_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "start_of_simulation phase", UVM_HIGH)
  endfunction
  
endclass