class yapp_tx_sequencer extends uvm_sequencer #(yapp_packet);
  
  // Register with factory
  `uvm_component_utils(yapp_tx_sequencer)
  
  // Component constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // Start of simulation phase
  function void start_of_simulation_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "start_of_simulation phase", UVM_HIGH)
  endfunction
  
endclass