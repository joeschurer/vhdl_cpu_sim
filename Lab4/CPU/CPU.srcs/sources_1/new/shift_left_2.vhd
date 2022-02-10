----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/06/2021 01:10:22 AM
-- Design Name: 
-- Module Name: shift_left_2 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity shift_left_2 is
    Port(
        input: in std_logic_vector(25 downto 0);
        pc_top_4 : in std_logic_vector(3 downto 0);
        output: out std_logic_vector(31 downto 0)
    );
end shift_left_2;

architecture Behavioral of shift_left_2 is
signal tmp : std_logic_vector(27 downto 0);
begin
    tmp <= input & "00";
    output <= pc_top_4 & tmp;

end Behavioral;
