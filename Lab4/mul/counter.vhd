
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity counter is
    Port(
    clk : in std_logic;
    reset : in std_logic;
    count : out std_logic_vector(4 downto 0)
    
    );
end counter;

architecture Behavioral of counter is
    signal tempcount: unsigned(4 downto 0);
begin
    process (clk,reset)
    begin
    if (reset = '1') then
        tempcount <= "00000";
    elsif(clk'event and clk='1') then
        tempcount <= tempcount +1;
    end if; 
    
    end process;
    count <= tempcount;

end Behavioral;
