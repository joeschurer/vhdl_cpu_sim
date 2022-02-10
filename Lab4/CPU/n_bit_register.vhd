library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity n_bit_register is
Generic(WIDTH: positive :=64);
    PORT(
        CLK : IN std_logic;
        D : IN std_logic_vector(WIDTH-1 downto 0);
        EN : IN std_logic;
        RST : IN std_logic;
        Q : OUT std_logic_vector(WIDTH-1 downto 0)
    );
end n_bit_register;

architecture Structural of n_bit_register is
    COMPONENT flipflop
		PORT( CLK,D,EN,RST : IN STD_LOGIC;
			  Q  : OUT STD_LOGIC);
	END COMPONENT;	
	signal output: STD_LOGIC_VECTOR(WIDTH-1 downto 0);
begin
    reg: FOR i IN 0 to WIDTH-1 generate
		reg: flipflop PORT MAP(CLK=>CLK,D=>D(i),EN=>EN,RST => RST, Q => output(i));
	END generate;
	Q(WIDTH-1 downto 0) <= output(WIDTH-1 downto 0);

end Structural;
