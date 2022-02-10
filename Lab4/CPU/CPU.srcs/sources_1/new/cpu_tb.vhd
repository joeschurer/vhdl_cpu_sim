library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cpu_tb is
    Port(
        reset: in std_logic;
        clock: in std_logic);
end cpu_tb;

architecture Structural of cpu_tb is
    component CPU is
        Port(
            Reset : in std_logic;
            Clock : in std_logic;
            MemoryDataIn: in std_logic_vector(31 downto 0);
            MemoryAddress : out std_logic_vector(31 downto 0);
            MemoryDataOut : out std_logic_vector(31 downto 0);
            MemWrite : out std_logic);
    end component;
    
    component CPU_memory IS
       PORT( 
          Clk      : IN     std_logic;
          MemWrite : IN     std_logic;
          addr     : IN     std_logic_vector (31 DOWNTO 0);
          dataIn   : IN     std_logic_vector (31 DOWNTO 0);
          dataOut  : OUT    std_logic_vector (31 DOWNTO 0)
       );
    END component ;
    
    signal mem_write:std_logic;
    signal data_in,addr,data_out: std_logic_vector(31 downto 0);
begin
    U_0:CPU Port MAP(Reset=>Reset, Clock=>Clock, MemoryDataIn=>data_in,  MemoryAddress=>addr,MemoryDataOut=>data_out,MemWrite=>mem_write);
    U_1: CPU_memory PORT MAP(Clk=>Clock,MemWrite =>mem_write,addr=>addr,dataIn=>data_out,dataOut=>data_in);

end Structural;
