library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux_2_wide is
    GENERIC(WIDTH:  positive :=32);
    Port( sel : in std_logic;
         input_1 : in std_logic_vector(WIDTH-1 downto 0);
         input_2 : in std_logic_vector(WIDTH-1 downto 0);
         output : out std_logic_vector(WIDTH-1 downto 0)    );
end mux_2_wide;

architecture Behavioral of mux_2_wide is

begin
    mux : process(input_1,input_2,sel)
    begin
      case sel is
        when '0' => output <= input_1;
        when '1' => output <= input_2;
        when others => output <= input_1;
      end case;
    end process mux;
end Behavioral;
