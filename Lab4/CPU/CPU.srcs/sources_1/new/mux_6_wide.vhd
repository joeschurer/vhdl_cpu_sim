library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity mux_6_wide is
    GENERIC(WIDTH:  positive :=32);
    Port( sel : in std_logic_vector(2 downto 0);
         input_1 : in std_logic_vector(WIDTH-1 downto 0);
         input_2 : in std_logic_vector(WIDTH-1 downto 0);
         input_3 : in std_logic_vector(WIDTH-1 downto 0);
         input_4 : in std_logic_vector(WIDTH-1 downto 0);
         input_5 : in std_logic_vector(WIDTH-1 downto 0);
         input_6 : in std_logic_vector(WIDTH-1 downto 0);
         output : out std_logic_vector(WIDTH-1 downto 0)    );
end mux_6_wide;

architecture Behavioral of mux_6_wide is

begin
    mux : process(input_1,input_2,input_3,input_4,sel)
    begin
      case sel is
        when "000" => output <= input_1;
        when "001" => output <= input_2;
        when "010" => output <= input_3;
        when "011" => output <= input_4;
        when "100"=> output <= input_5;
        when "101"=> output <= input_6;
        when others => output <= input_1;
      end case;
    end process mux;
end Behavioral;