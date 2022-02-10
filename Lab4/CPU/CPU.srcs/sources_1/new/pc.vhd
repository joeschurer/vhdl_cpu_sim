library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pc is
    PORT(
        CLK : IN std_logic;
        D : IN std_logic_vector(31 downto 0);
        EN : IN std_logic;
        RST : IN std_logic;
        Q : OUT std_logic_vector(31 downto 0)
    );
end pc;

architecture Structural of pc is
    component n_bit_register is
    Generic(WIDTH: positive :=32);
        PORT(
            CLK : IN std_logic;
            D : IN std_logic_vector(WIDTH-1 downto 0);
            EN : IN std_logic;
            RST : IN std_logic;
            Q : OUT std_logic_vector(WIDTH-1 downto 0)
        );
    end component;
begin
    PC: n_bit_register PORT MAP(CLK=>CLK,D=>D,EN=>EN,RST=>RST,Q=>Q);

end Structural;
