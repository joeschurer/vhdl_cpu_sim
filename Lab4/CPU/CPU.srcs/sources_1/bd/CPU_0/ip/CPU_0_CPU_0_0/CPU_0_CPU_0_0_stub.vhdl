-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Thu Nov 18 03:34:19 2021
-- Host        : DESKTOP-E4FJ2S8 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/ECE1195/Lab4/CPU/CPU.srcs/sources_1/bd/CPU_0/ip/CPU_0_CPU_0_0/CPU_0_CPU_0_0_stub.vhdl
-- Design      : CPU_0_CPU_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CPU_0_CPU_0_0 is
  Port ( 
    Reset : in STD_LOGIC;
    Clock : in STD_LOGIC;
    MemoryDataIn : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MemoryAddress : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MemoryDataOut : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MemWrite : out STD_LOGIC
  );

end CPU_0_CPU_0_0;

architecture stub of CPU_0_CPU_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "Reset,Clock,MemoryDataIn[31:0],MemoryAddress[31:0],MemoryDataOut[31:0],MemWrite";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "CPU,Vivado 2018.3";
begin
end;
