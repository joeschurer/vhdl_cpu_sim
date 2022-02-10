----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/28/2021 11:25:52 AM
-- Design Name: 
-- Module Name: logical_unit - Behavioral
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

entity logical_unit is
    Port ( A : in STD_LOGIC_VECTOR(31 downto 0);
           B : in STD_LOGIC_VECTOR(31 downto 0);
           Op : in STD_LOGIC_VECTOR(1 downto 0);
           R : out STD_LOGIC_VECTOR(31 downto 0));
end logical_unit;

architecture Dataflow of logical_unit is
    Signal temp : std_logic_vector(31 downto 0);
begin
    WITH Op SELECT
        temp <= A and B WHEN "00",
                A or B WHEN "01",
                A xor B WHEN "10",
                A nor B WHEN "11",
                (OTHERS => 'Z') WHEN others;
                
    R <= temp;
end Dataflow;
