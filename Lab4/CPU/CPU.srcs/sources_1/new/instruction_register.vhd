library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity instruction_register is
    Port( 
        CLK : IN std_logic;
        D : IN std_logic_vector(31 downto 0);
        EN : IN std_logic;
        RST : IN std_logic;
        out_1 : out std_logic_vector(31 downto 26);
        out_2 : out std_logic_vector(25 downto 21);
        out_3 : out std_logic_vector(20 downto 16);
        out_4 : out std_logic_vector(15 downto 0)
    );
end instruction_register;

architecture structural of instruction_register is
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
    signal temp : std_logic_vector(31 downto 0);
begin
    reg: n_bit_register PORT MAP(CLK=>CLK,D=>D,EN=>EN,RST => RST, Q => temp);
    out_1 <= temp(31 downto 26);
    out_2 <= temp(25 downto 21);
    out_3 <= temp(20 downto 16);
    out_4 <= temp(15 downto 0);

end structural;
