library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sign_extend_hw is
    Port(
        input : in std_logic_vector(15 downto 0);
        output :out std_logic_vector(31 downto 0)
    );
end sign_extend_hw;

architecture Behavioral of sign_extend_hw is

begin
    output <= std_logic_vector(resize(unsigned(input), output'length));
end Behavioral;
