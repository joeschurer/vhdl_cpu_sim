library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity register_file is
    Port( 
        CLK : IN std_logic;
        Din : in std_logic_vector(31 downto 0);
        D1addr : IN std_logic_vector(4 downto 0);
        D2addr : IN std_logic_vector(4 downto 0);
        WriteReg: IN std_logic_vector(4 downto 0);
        EN: in std_logic;
        RST : IN std_logic;
        D1 : OUT std_logic_vector(31 downto 0);
        D2 : OUT std_logic_vector(31 downto 0)
    );
end register_file;

architecture Structural of register_file is
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
    signal out1,out2,temp_out : std_logic_vector(31 downto 0);
    type output_array is array (31 downto 0) of std_logic_vector(31 downto 0);
    type in_array is array (31 downto 0) of std_logic_vector(31 downto 0);
    signal in_temp : in_array;
    signal out_temp: output_array;
    signal en_vector : std_logic_vector(31 downto 0);
    signal temp_en : std_logic;
begin
    in_temp(to_integer(unsigned(writeReg))) <= Din;
    
    process(EN,writeReg)
        variable entmp: std_logic_vector(31 downto 0);
        begin
        entmp := (others => '0');
        entmp(to_integer(unsigned(writereg))) := '1';
        en_vector <= entmp;
    end process;
    
    reg: FOR i IN 0 to 31 generate
		reg: n_bit_register PORT MAP(CLK=>CLK,D=>in_temp(i),EN=>en_vector(i),RST => RST, Q => out_temp(i));
	END generate;

    D1 <= out_temp(to_integer(unsigned(D1addr)));
    D2 <= out_temp(to_integer(unsigned(D2addr)));
end Structural;
