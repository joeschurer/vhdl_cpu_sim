----------------------------------------------------------------------------------
--N-bit full adder/subtractor
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity n_bit_addsub is
Generic(WIDTH: positive :=32);
    Port ( input_1 : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           input_2 : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           sum : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           carry_out : out STD_LOGIC;
           addsub : in STD_LOGIC);
end n_bit_addsub;

architecture structural of n_bit_addsub is
    COMPONENT full_adder
		PORT( x,y,c_in : IN STD_LOGIC;
			  s, c_out  : OUT STD_LOGIC);
	END COMPONENT;	

	SIGNAL temp: STD_LOGIC_VECTOR(WIDTH downto 0);
	SIGNAL temp_sub: STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	
begin
    temp(0) <= addsub;
    ADDER: FOR i IN 0 to WIDTH-1 generate
        temp_sub(i) <= input_2(i) xor addsub; --- 0 for add 1 for sub
		ADDER: full_adder PORT MAP(x => input_1(i),y => temp_sub(i),c_in => temp(i),s => sum(i), c_out => temp(i+1));
	END generate;	
	carry_out <= temp(WIDTH);

end structural;

