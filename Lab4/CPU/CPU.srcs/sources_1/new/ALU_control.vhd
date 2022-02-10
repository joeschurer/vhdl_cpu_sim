library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_control is
    Port(
        instruction : in std_logic_vector(15 downto 0);
        ALUOp : in std_logic_vector(5 downto  0);
        SLLV_AMT : in std_logic_vector(4 downto 0);
        SHAMT : out std_logic_vector(4 downto 0);
        ctrl : out std_logic_vector(3 downto 0)
    );
end ALU_control;

architecture Behavioral of ALU_control is

begin
process (instruction,ALUOp,SLLV_AMT)
begin
    --implementing R type instuctions
    if (ALUOp = "000000") then
        if (instruction(5 downto 0) = "100001") then
            ctrl <= "0101";
            SHAMT <= "00000";
        elsif (instruction(5 downto 0) ="100100") then
            ctrl<= "0000";
            SHAMT<="00000";
        elsif (instruction(5 downto 0) ="100010") then
            ctrl <= "0110";
            SHAMT <= "00000";
        elsif (instruction(5 downto 0) = "100010") then
            --Signal ALU to SLL
            ctrl <= "1100";
            SHAMT <= instruction(10 downto 6);
        elsif (instruction(5 downto 0) = "000011") then
            --Signal ALU to SRA
            ctrl <= "1111";
            SHAMT <= instruction(10 downto 6);
        --elsif (instruction(5 downto 0) = "000100") then
        else
            --Signal ALU to SLLV
            ctrl <= "1100";
            SHAMT<=SLLV_amt;
        end if;
        --ctrl <= "0101" when (instruction = "100001") else "0000";
    elsif (ALUOp = "001000") then -- ADDI
        --ADDI (currently doing signed add but check)
        ctrl <= "0100";
        SHAMT <= "00000";
    elsif (ALUOp = "001101") then
        -- ORI
        SHAMT <= "00000";
        ctrl <= "0001";
    elsif (ALUOp = "111111") then
        SHAMT <= "00000";
        ctrl <= "0100";
    elsif (ALUOp = "001010") then
        SHAMT <= "00000";
        ctrl <= "1010";
    elsif (ALUOp = "000101") then --subtract for BNE
        SHAMT <= "00000";
        ctrl <= "0111";
    --elsif (ALUOp = "001111") then -- shift left 16 for LUI
      --  SHAMT <= "10000";
        --ctrl <= "1100";
    end if;
   
end process;

end Behavioral;
