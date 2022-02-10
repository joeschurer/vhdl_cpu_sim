library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--Dir 1 == right shift / Dir 0 -- left shift
entity n_bit_shift_register is
Generic(WIDTH: positive :=64);
    Port (
        D : in std_logic_vector(WIDTH-1 downto 0);
        CLK : in std_logic;
        RST: in std_logic;
        EN: in std_logic;
        DIR : in std_logic;
        LOAD: in std_logic;
        Q : out std_logic_vector(WIDTH-1 downto 0)
    );
end n_bit_shift_register;

architecture Structural of n_bit_shift_register is
    COMPONENT flipflop
		PORT( CLK,D,EN,RST : IN STD_LOGIC;
			  Q  : OUT STD_LOGIC);
	END COMPONENT;	
	signal output: STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	signal temp: STD_LOGIC_VECTOR(WIDTH-1 downto 0);
begin       
    FF: FOR i IN WIDTH-1 downto 0 generate
        temp <= '0' & output(WIDTH-1 downto 1) WHEN LOAD = '0' and DIR = '1' else
                output(WIDTH-2 downto 0) & '0' WHEN LOAD = '0' and DIR = '0' else D;
        FF: flipflop PORT MAP(CLK=>CLK,D=>temp(i),EN=>EN,RST => RST, Q => output(i));
	END generate;
    Q(WIDTH-1 downto 0) <= output(WIDTH-1 downto 0);

end Structural;
