// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Nov 18 03:34:16 2021
// Host        : DESKTOP-E4FJ2S8 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ CPU_0_CPU_0_0_stub.v
// Design      : CPU_0_CPU_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "CPU,Vivado 2018.3" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(Reset, Clock, MemoryDataIn, MemoryAddress, 
  MemoryDataOut, MemWrite)
/* synthesis syn_black_box black_box_pad_pin="Reset,Clock,MemoryDataIn[31:0],MemoryAddress[31:0],MemoryDataOut[31:0],MemWrite" */;
  input Reset;
  input Clock;
  input [31:0]MemoryDataIn;
  output [31:0]MemoryAddress;
  output [31:0]MemoryDataOut;
  output MemWrite;
endmodule
