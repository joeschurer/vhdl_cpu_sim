library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mul_control is
    Port( 
        multiplier: in std_logic_vector(31 downto 0);
        multiplicand: in std_logic_vector(63 downto 0);
        multiplicand_en : out std_logic;
        multiplier_en : out std_logic;
        multiplicand_ld : out std_logic;
        multiplier_ld : out std_logic;
        test: out std_logic_vector(2 downto 0);
        ALU_en : out std_logic;
        reset: in std_logic;
        clk : in std_logic;
        done : out std_logic;
        prod_en : out std_logic);
end mul_control;

architecture Behavioral of mul_control is
    type state is (S0,S1,S2,S3,S4);
    signal pr_state, nx_state : state;
    signal rep: unsigned (4 downto 0);
    

begin
    process(reset,clk)
    begin
        if (reset = '1') then  pr_state<=S0;
        elsif (clk'event and clk='1') then 
        pr_state <= nx_state;
       end if;
    end process;
    
    process(pr_state, multiplier, multiplicand,reset)
    begin
        case pr_state is
            when S0 =>
                test <= "000";
                rep<="00000";
                multiplicand_en <= '1';
                multiplier_en <= '1';
                multiplicand_ld <= '1';
                multiplier_ld <= '1';
                ALU_en <='0';
                prod_en  <='0';
                done <='0';
                nx_state<= S1;
            when S1 =>
                test <= "001";
                if (multiplier(0) = '1') then
                    ALU_en <= '1';
                    prod_en <= '1';
                    multiplicand_en <= '0';
                    multiplier_en <= '0';
                    multiplicand_ld <= '0';
                    multiplier_ld <= '0';
                    done <= '0';
                    nx_state <= S2;
                else
                    multiplicand_en <= '1';
                    multiplier_en <= '1';    
                    multiplicand_ld <= '0';
                    multiplier_ld <= '0';
                    ALU_en <='0';
                    prod_en  <='0';
                    nx_state<= S3;
                end if;
                
            when S2=>
                test <= "010";
                multiplicand_en <= '1';
                multiplier_en <= '1';    
                multiplicand_ld <= '0';
                multiplier_ld <= '0';
                ALU_en <='0';
                prod_en  <='0';
                nx_state<=S3;
            when S3=>
                test <= "011";
                if(multiplier =x"00000000" and multiplicand(31 downto 0) = x"00000000") then
                    multiplicand_en <= '0';
                    multiplier_en <= '0';    
                    multiplicand_ld <= '0';
                    multiplier_ld <= '0';
                    ALU_en <='0';
                    prod_en  <='0';
                    nx_state<=S4;
                else
                    nx_state <= S1;
                    multiplicand_en <= '0';
                    multiplier_en <= '0';    
                    multiplicand_ld <= '0';
                    multiplier_ld <= '0';
                    ALU_en <='0';
                    prod_en  <='0';
                end if;
                rep<= rep + 1;
            when S4 =>
                test <= "100";
                    done <= '1';
                if(reset = '0') then
                    nx_state <=S4;
                else
                    nx_state <= S0;
                end if;
            end case;
    end process;

end Behavioral;
