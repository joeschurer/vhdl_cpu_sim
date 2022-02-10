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
    elsif(rising_edge(clk)) then
        if(tempcount ="11111") then
        else
        tempcount <= tempcount +1;
        end if;
    end if; 
    
    end process;
    count <= std_logic_vector(tempcount);

end Behavioral;
