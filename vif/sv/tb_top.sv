module top;
  // Import the UVM library
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  // Import the YAPP package
  import yapp_pkg::*;
  
  // Include testbench and test components
  `include "router_tb.sv"
  `include "router_test_lib.sv"

  // Start UVM phases
  initial begin
    run_test();
  end
endmodule : top
