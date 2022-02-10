library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sign_extend is
    Port(
        input : in std_logic_vector(15 downto 0);
        z_ex : in std_logic;
        output :out std_logic_vector(31 downto 0)
    );
end sign_extend;

architecture Behavioral of sign_extend is

begin
    process(z_ex,input)
    begin
    if (z_ex = '0') then
        output <= std_logic_vector(resize(signed(input), output'length));
    else
        output <= std_logic_vector(resize(unsigned(input), output'length));
    end if;
    end process;

end Behavioral;
