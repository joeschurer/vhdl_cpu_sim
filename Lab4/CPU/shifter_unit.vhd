library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity shifter_unit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           SHAMT : in STD_LOGIC_VECTOR (4 downto 0);
           ALUOp : in STD_LOGIC_VECTOR (1 downto 0);
           R : out STD_LOGIC_VECTOR (31 downto 0));
end shifter_unit;

architecture Behavioral of shifter_unit is
signal fill, L_0,R_0,L_1,L_2,L_3,L_4,R_1,R_2,R_3,R_4: std_logic_vector(31 downto 0);
begin
fill <= (others => ALUOp(0) and A(31));

L_0 <= A(30 downto 0) & '0' WHEN (SHAMT(0) = '1') ELSE A;
L_1 <= L_0(29 downto 0) & "00" WHEN (SHAMT(1) = '1') ELSE L_0;
L_2 <= L_1(27 downto 0) & "0000" WHEN (SHAMT(2) = '1') ELSE L_1;
L_3 <= L_2(23 downto 0) & "00000000" WHEN (SHAMT(3) = '1') ELSE L_2;
L_4 <= L_3(15 downto 0) & "0000000000000000" WHEN (SHAMT(4) = '1') ELSE L_3;

R_0 <= fill(0) & A(31 downto 1) WHEN (SHAMT(0)='1') ELSE A;
R_1 <= fill(1 downto 0) & R_0(31 downto 2) WHEN (SHAMT(1)='1') ELSE R_0;
R_2 <= fill(3 downto 0) & R_1(31 downto 4) WHEN (SHAMT(2)='1') ELSE R_1;
R_3 <= fill(7 downto 0) & R_2(31 downto 8) WHEN (SHAMT(3)='1') ELSE R_2;
R_4 <= fill(15 downto 0) & R_3(31 downto 16) WHEN (SHAMT(4)='1') ELSE R_3;

WITH ALUOp(1) SELECT
    R <= L_4 WHEN '0',
         R_4 WHEN '1',
         (OTHERS => 'Z') WHEN others;

end Behavioral;
