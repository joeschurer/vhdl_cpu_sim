library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clo is
    Port ( input : in STD_LOGIC_VECTOR (31 downto 0);
           output : out STD_LOGIC_VECTOR (31 downto 0));
end clo;    

architecture Behavioral of clo is

begin
    process(input)
        variable count: integer:=0;--this syntax is simply unnatural
    begin
        for i in input'range loop
            if input(i) = '1' then
                count := count+1;
            else
                exit;
            end if;
        end loop;
    
    output<= std_logic_vector(to_unsigned(count, output'length));
    end process;


end Behavioral;
