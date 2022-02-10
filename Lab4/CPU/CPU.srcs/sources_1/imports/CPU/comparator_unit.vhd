library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comparator_unit is
    Port ( A_31 : in STD_LOGIC;
           B_31 : in STD_LOGIC;
           S_31 : in STD_LOGIC;
           CO : in STD_LOGIC;
           ALUOp : in STD_LOGIC_VECTOR (1 downto 0);
           R : out STD_LOGIC_VECTOR (31 downto 0));
end comparator_unit;

architecture dataflow of comparator_unit is
signal temp : std_logic_vector(5 downto 0);
begin
temp <= ALUOp & A_31 & B_31 & S_31 &CO;


    R <= X"00000000" WHEN std_match(temp,"00----") OR
                     std_match(temp,"01----") OR
                     std_match(temp,"10000-") OR
                     std_match(temp,"10110-") OR
                     std_match(temp,"1001--") OR
                     std_match(temp,"11---1") ELSE      
         X"00000001" WHEN std_match(temp,"10001-") OR
                     std_match(temp,"10111-") OR
                     std_match(temp,"1010--") OR
                     std_match(temp,"11---0") ELSE
                     (others => 'U');             
    
end dataflow;
