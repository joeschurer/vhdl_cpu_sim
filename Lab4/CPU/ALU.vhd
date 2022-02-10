library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           ALUOp : in STD_LOGIC_VECTOR (3 downto 0);
           SHAMT : in STD_LOGIC_VECTOR (4 downto 0);
           R : out STD_LOGIC_VECTOR (31 downto 0);
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC);
end ALU;

architecture Structural of ALU is
    COMPONENT logical_unit
        Port ( A : in STD_LOGIC_VECTOR(31 downto 0);
           B : in STD_LOGIC_VECTOR(31 downto 0);
           Op : in STD_LOGIC_VECTOR(1 downto 0);
           R : out STD_LOGIC_VECTOR(31 downto 0));
    END COMPONENT;
    
    component shifter_unit
        Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           SHAMT : in STD_LOGIC_VECTOR (4 downto 0);
           ALUOp : in STD_LOGIC_VECTOR (1 downto 0);
           R : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component arith_unit
        GENERIC (
        n       : positive := 32);
        PORT( 
        A       : IN     std_logic_vector (n-1 DOWNTO 0);
        B       : IN     std_logic_vector (n-1 DOWNTO 0);
        C_op    : IN     std_logic_vector (1 DOWNTO 0);
        CO      : OUT    std_logic;
        OFL     : OUT    std_logic;
        S       : OUT    std_logic_vector (n-1 DOWNTO 0);
        Z       : OUT    std_logic
        );
    end component;
    
    component comparator_unit
        Port ( A_31 : in STD_LOGIC;
           B_31 : in STD_LOGIC;
           S_31 : in STD_LOGIC;
           CO : in STD_LOGIC;
           ALUOp : in STD_LOGIC_VECTOR (1 downto 0);
           R : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    signal logic_out,arith_out,comp_out,shift_out : std_logic_vector(31 downto 0);
    signal carry_out: std_logic;
begin
    U1 : logical_unit port map( A=>A, B=>B,Op=> ALUOp(1 downto 0), R=>logic_out);
    U2: shifter_unit port map(A=>A, SHAMT=>SHAMT,ALUOp=>ALUOp(1 downto 0), R=>shift_out);
    U3: arith_unit port map(A=>A,B=>B,C_op=>ALUOp(1 downto 0),CO=>carry_out,OFL=>Overflow,S=>arith_out,Z=>zero);
    U4: comparator_unit port map(A_31=>A(31),B_31=>B(31),S_31=>arith_out(31),CO=>carry_out,ALUOp=>ALUOp(1 downto 0),R=>comp_out);
    
    WITH ALUOp(3 downto 2) SELECT
        R <= logic_out when "00",
             arith_out when "01",
             comp_out when "10",
             shift_out when "11",
             (others => 'U') WHEN others;
    

end Structural;
