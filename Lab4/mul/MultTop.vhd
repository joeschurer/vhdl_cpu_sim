library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MultTop is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           done : out STD_LOGIC;
           R : out STD_LOGIC_VECTOR (63 downto 0));
end MultTop;

architecture Structural of MultTop is
    component n_bit_addsub is
    Generic(WIDTH: positive :=64);
        Port ( input_1 : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
               input_2 : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
               sum : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
               carry_out : out STD_LOGIC;
               addsub : in STD_LOGIC);
    end component;
    
    component control is
        Port( 
            multiplier: in std_logic_vector(31 downto 0);
            multiplicand: in std_logic_vector(63 downto 0);
            multiplicand_en : out std_logic;
            multiplier_en : out std_logic;
            multiplicand_ld : out std_logic;
            multiplier_ld : out std_logic;
            ALU_en : out std_logic;
            test: out std_logic_vector(2 downto 0);
            reset: in std_logic;
            clk : in std_logic;
            done : out std_logic;
            prod_en : out std_logic);
    end component;
    
    component n_bit_register is
    Generic(WIDTH: positive :=64);
        PORT(
            CLK : IN std_logic;
            D : IN std_logic_vector(WIDTH-1 downto 0);
            EN : IN std_logic;
            RST : IN std_logic;
            Q : OUT std_logic_vector(WIDTH-1 downto 0)
        );
    end component;
    
    component n_bit_shift_register is
    Generic(WIDTH: positive :=32);
        Port (
            D : in std_logic_vector(WIDTH-1 downto 0);
            CLK : in std_logic;
            RST: in std_logic;
            EN: in std_logic;
            DIR : in std_logic;
            LOAD: in std_logic;
            Q : out std_logic_vector(WIDTH-1 downto 0)
        );
    end component;
    signal alu_en: std_logic;
    signal prod_en: std_logic;
    signal multiplier_en: std_logic;
    signal multiplier_ld: std_logic;
    signal multiplicand_en: std_logic;
    signal multiplicand_ld: std_logic;
    signal multiplier:std_logic_vector(31 downto 0);
    signal multiplicand:std_logic_vector(63 downto 0);
    signal prod_in : std_logic_vector(63 downto 0);
    signal result :std_logic_vector(63 downto 0);
    signal temp: std_logic;
    signal input : std_logic_vector(63 downto 0);
    signal test: std_logic_vector(2 downto 0);
    
begin
    ---input <= A&B;
    input<=x"00000000"&A;
    mulr : n_bit_shift_register port map(D=>B,CLK=>clk,RST=>'0',en=>multiplier_en,DIR=>'1',LOAD=>multiplier_ld,Q=>multiplier);
    muld : n_bit_shift_register generic map(WIDTH => 64) port map(D=>input,CLK=>clk,RST=>'0',en=>multiplicand_en,DIR=>'0',LOAD=>multiplicand_ld,Q=>multiplicand);
    ctrl : control port map(test=>test, clk=>clk,multiplier=>multiplier,multiplicand=>multiplicand,multiplicand_en=>multiplicand_en,multiplier_en=>multiplier_en,
            multiplier_ld=>multiplier_ld,multiplicand_ld=>multiplicand_ld,ALU_en=>alu_en,reset=>rst,done=>done,prod_en=>prod_en);
    prd : n_bit_register port map(D=>prod_in, clk=>clk, en=>prod_en, rst=>rst, Q=>result);
    ALU : n_bit_addsub port map(input_1=>multiplicand,input_2=>result,sum=>prod_in,carry_out=>temp,addsub=>'0');
    
    
    R<=result;
end Structural;
