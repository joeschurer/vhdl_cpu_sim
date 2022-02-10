library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU is
    Port(
        Reset : in std_logic;
        Clock : in std_logic;
        MemoryDataIn: in std_logic_vector(31 downto 0);
        MemoryAddress : out std_logic_vector(31 downto 0);
        MemoryDataOut : out std_logic_vector(31 downto 0);
        MemWrite : out std_logic);
end CPU;

    architecture Structural of CPU is
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
    
    component register_file is
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
    end component;
    
    component ALU is
        Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
               B : in STD_LOGIC_VECTOR (31 downto 0);
               ALUOp : in STD_LOGIC_VECTOR (3 downto 0);
               SHAMT : in STD_LOGIC_VECTOR (4 downto 0);
               R : out STD_LOGIC_VECTOR (31 downto 0);
               Zero : out STD_LOGIC;
               Overflow : out STD_LOGIC);
    end component;
    
    component instruction_register is
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
    end component;
    
    component pc is
        PORT(
            CLK : IN std_logic;
            D : IN std_logic_vector(31 downto 0);
            EN : IN std_logic;
            RST : IN std_logic;
            Q : OUT std_logic_vector(31 downto 0)
        );
    end component;
    
    component ALU_control is
        Port(
            instruction : in std_logic_vector(15 downto 0);
            SLLV_AMT : in std_logic_vector(4 downto 0);
            ALUOp : in std_logic_vector(5 downto  0);
            SHAMT : out std_logic_vector(4 downto 0);
            ctrl : out std_logic_vector(3 downto 0)
        );
    end component;
    
    component control is
        Port(
            a_high : in std_logic;
            mul_done: in std_logic;
            mul_reset,mulhien,mulloen : out std_logic;
            st : out std_logic_vector(4 downto 0);
            MemDataReg: out std_logic;
            se_sel : out std_logic_vector(1 downto 0);
            inst5_0 : in std_logic_vector(5 downto 0);
            Op : in std_logic_vector(5 downto 0);
            --funct : in std_logic_vector(
            PCWriteCond : out std_logic;
            PCWrite : out std_logic;
            reset : in std_logic;
            clk : in std_logic;
            IorD : out std_logic;
            MemRead : out std_logic;
            z_ex : out std_logic;
            MemWrite : out std_logic;
            MemtoReg : out std_logic_vector(2 downto 0);
            IRWrite : out std_logic;
            RegDst : out std_logic_vector(1 downto 0);
            RegWrite: out std_logic;
            RegA, RegB : out std_logic;
            ALUSrcA : out std_logic;
            ALUSrcB : out std_logic_vector(1 downto 0);
            ALUOp : out std_logic_vector(5 downto 0);
            ALUout : out std_logic;
            PCSource : out std_logic_vector(1 downto 0));
    end component;
    
    component mux_2_wide is
        GENERIC(WIDTH:  positive :=32);
        Port( sel : in std_logic;
             input_1 : in std_logic_vector(WIDTH-1 downto 0);
             input_2 : in std_logic_vector(WIDTH-1 downto 0);
             output : out std_logic_vector(WIDTH-1 downto 0)    );
    end component;
    
    component mux_3_wide is
        GENERIC(WIDTH:  positive :=32);
        Port( sel : in std_logic_vector(1 downto 0);
             input_1 : in std_logic_vector(WIDTH-1 downto 0);
             input_2 : in std_logic_vector(WIDTH-1 downto 0);
             input_3 : in std_logic_vector(WIDTH-1 downto 0);
             output : out std_logic_vector(WIDTH-1 downto 0)    );
    end component;
    
    component mux_4_wide is
        GENERIC(WIDTH:  positive :=32);
        Port( sel : in std_logic_vector(1 downto 0);
             input_1 : in std_logic_vector(WIDTH-1 downto 0);
             input_2 : in std_logic_vector(WIDTH-1 downto 0);
             input_3 : in std_logic_vector(WIDTH-1 downto 0);
             input_4 : in std_logic_vector(WIDTH-1 downto 0);
             output : out std_logic_vector(WIDTH-1 downto 0)    );
    end component;
    
    component sign_extend is
    Port(
        input : in std_logic_vector(15 downto 0);
        z_ex : in std_logic;
        output :out std_logic_vector(31 downto 0)
    );
    end component;

    component shift_left_2 is
    Port(
        input: in std_logic_vector(25 downto 0);
        pc_top_4 : in std_logic_vector(3 downto 0);
        output: out std_logic_vector(31 downto 0)
    );
    end component;
    
    component sign_extend_by is
    Port(
        input : in std_logic_vector(7 downto 0);
        output :out std_logic_vector(31 downto 0)
    );
    end component;
    
    component sign_extend_hw is
    Port(
        input : in std_logic_vector(15 downto 0);
        output :out std_logic_vector(31 downto 0)
    );
    end component;
    
    component clo is
        Port ( input : in STD_LOGIC_VECTOR (31 downto 0);
               output : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component MultTop is
        Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
               B : in STD_LOGIC_VECTOR (31 downto 0);
               rst : in STD_LOGIC;
               clk : in STD_LOGIC;
               done : out STD_LOGIC;
               R : out STD_LOGIC_VECTOR (63 downto 0));
    end component;
    
    component mux_6_wide is
        GENERIC(WIDTH:  positive :=32);
        Port( sel : in std_logic_vector(2 downto 0);
             input_1 : in std_logic_vector(WIDTH-1 downto 0);
             input_2 : in std_logic_vector(WIDTH-1 downto 0);
             input_3 : in std_logic_vector(WIDTH-1 downto 0);
             input_4 : in std_logic_vector(WIDTH-1 downto 0);
             input_5 : in std_logic_vector(WIDTH-1 downto 0);
             input_6 : in std_logic_vector(WIDTH-1 downto 0);
             output : out std_logic_vector(WIDTH-1 downto 0)    );
    end component;
    
    component mux_7_wide is
        GENERIC(WIDTH:  positive :=32);
        Port( sel : in std_logic_vector(2 downto 0);
             input_1 : in std_logic_vector(WIDTH-1 downto 0);
             input_2 : in std_logic_vector(WIDTH-1 downto 0);
             input_3 : in std_logic_vector(WIDTH-1 downto 0);
             input_4 : in std_logic_vector(WIDTH-1 downto 0);
             input_5 : in std_logic_vector(WIDTH-1 downto 0);
             input_6 : in std_logic_vector(WIDTH-1 downto 0);
             input_7 : in std_logic_vector(WIDTH-1 downto 0);
             output : out std_logic_vector(WIDTH-1 downto 0)    );
    end component;
    
    signal addr_out,alureg_out,aluout,aluin1,aluin2,pc_in,pc_out,alu_out,addr,instruction,write_data,regout1,regout2,aout,bout: std_logic_vector(31 downto 0);
    signal MemRead,PCWriteCond,PCWrite,alureg_en,pc_en,IorD,IRWrite,RegWrite,rega,regb,ALUSrcA,zero,overflow : std_logic;
    signal ALUSrcB,pcsource,se_sel,RegDst : std_logic_vector(1 downto 0);
    signal inst31_26,aluop: std_logic_vector(5 downto 0);
    signal inst25_21,inst20_16,write_reg,shamtctrl: std_logic_vector(4 downto 0);
    signal inst15_0: std_logic_vector(15 downto 0);
    signal aluopctrl : std_logic_vector(3 downto 0);
    signal upper_imm,ones,se_lower,jump_addr,shifted,se_byte,se_hw,mem_mux_out,MemRegData : std_logic_vector(31 downto 0);
    signal z_ex,MemDataReg : std_logic;
    signal inst25_0 : std_logic_vector(25 downto 0);
    signal state_db : std_logic_vector(4 downto 0);
    signal mulhien,mulloen,mul_reset,mul_done : std_logic;
    signal mul_out : std_logic_vector(63 downto 0);
    signal hi_out,lo_out : std_logic_vector(31 downto 0);
    signal MemtoReg : std_logic_vector(2 downto 0);
begin
    --eh
    pc_en <= (pcwrite OR (PCWriteCond AND NOT(Zero)));
    PC_reg: PC PORT MAP(CLK=>Clock, D => pc_in, EN=>pc_en, RST => Reset,Q=> pc_out);
    Addr_mux : mux_2_wide PORT MAP(Sel=>IorD,input_1=>pc_out,input_2=>alu_out,output=>MemoryAddress);
    inst_reg : instruction_register PORT MAP(CLK=>Clock,D =>MemoryDataIn, EN=>IRWrite, RST=>Reset,
                                            out_1=>inst31_26, out_2=>inst25_21,out_3 =>inst20_16, out_4=>inst15_0);
    write_reg_mux: mux_3_wide GENERIC MAP (WIDTH =>5) PORT MAP(input_3=>"11111",Sel=>RegDst,input_1=>inst20_16,input_2=>inst15_0(15 downto 11),output=>write_reg);                            
    upper_imm<= inst15_0 & "0000000000000000";
    reg_file: register_file PORT MAP(CLK=>Clock, Din =>write_data, D1addr=>inst25_21, D2addr=>inst20_16,
                                     WriteReg =>write_reg,EN=>RegWrite,RST =>Reset,D1=>regout1,D2=>regout2);
    A_reg: n_bit_register PORT MAP(CLK=>Clock, D => regout1, EN=>rega, RST => Reset,Q=> aout);
    B_reg: n_bit_register PORT MAP(CLK=>Clock, D => regout2, EN=>regb, RST => Reset,Q=> bout);
    ALU_mux1 : mux_2_wide PORT MAP(Sel=>ALUSrcA,input_1=>pc_out,input_2=>aout,output=>aluin1);
    --rep input3 w/ sign extend
    shifted<=se_lower(29 downto 0) & "00";
    ALU_mux2 : mux_4_wide PORT MAP(sel=>ALUSrcB, input_1 => bout, input_2 => X"00000004",
                                  input_3 =>se_lower,input_4 =>shifted, output=>aluin2);
   alu1: ALU Port MAP(A =>aluin1, B=>aluin2, ALUOp => aluopctrl,  SHAMT => shamtctrl, R =>aluout,Zero =>zero, Overflow=>overflow);
   
   alu_reg: n_bit_register PORT MAP(CLK=>Clock, D => aluout, EN=>alureg_en, RST => Reset,Q=> alu_out);
   ALU_ctrl: ALU_control PORT MAP(SLLV_AMT=>aout(4 downto 0),instruction=>inst15_0, ALUOp=>aluop,SHAMT =>shamtctrl, ctrl =>aluopctrl); 
   ctrl: control PORT MAP(a_high=>aout(31),mulhien=>mulhien,mulloen=>mulloen,mul_done=>mul_done, mul_reset=>mul_reset, st=>state_db,se_sel=>se_sel,z_ex=>z_ex,Op=>inst31_26, PCWriteCond =>PCWriteCond,PCWrite =>PCWrite,reset=>Reset, clk=>Clock,
                          IorD =>IorD, MemRead =>MemRead, MemWrite=>MemWrite,MemtoReg =>MemtoReg,IRWrite =>IRWrite,
                          RegDst => RegDst,RegWrite => RegWrite,RegA=>rega, RegB=>regb, ALUSrcA =>ALUSrcA,
                          ALUSrcB=>ALUSrcB,ALUOp =>aluop,ALUout=>alureg_en,PCSource=>pcsource,inst5_0=>inst15_0(5 downto 0));
    out_mux: mux_4_wide PORT MAP(sel =>pcsource,input_1=>aluout,input_2=>alu_out,input_3 => jump_addr,input_4=> aout,output =>pc_in);
    SE: sign_extend PORT MAP(input=>inst15_0,z_ex=>z_ex,output=>se_lower);
    inst25_0 <= inst25_21 & inst20_16 & inst15_0;
    SEBYTE: sign_extend_by PORT MAP(input=> MemoryDataIn(7 downto 0),output=>se_byte);
    SWHALF_WORD: sign_extend_hw PORT MAP(input=>MemoryDataIn(15 downto 0) , output=>se_hw);
    COUNT_ONES: clo Port MAP ( input=>aout, output=>ones);
    MemReg: n_bit_register PORT MAP(CLK=>Clock, D => mem_mux_out, EN=>MemDataReg, RST => Reset,Q=> MemRegData);
    Mem_Data_Mux: mux_3_wide PORT MAP(sel=>se_sel,input_1=>se_byte,input_2=>se_hw,input_3=>MemoryDataIn,output=>mem_mux_out);
    sl1 : shift_left_2 PORT MAP(input=>inst25_0, pc_top_4=>pc_out(31 downto 28), output=>jump_addr );
    MemoryDataOut<= bout;
    --next do control?
    write_data_mux: mux_7_wide PORT MAP(input_7=> pc_out,Sel=>MemtoReg,input_1=>alu_out,input_2=>MemRegData,input_3=>ones,input_4=> upper_imm,input_5=>hi_out,input_6=>lo_out,output=>write_data);
    MUL_HI:n_bit_register PORT MAP(CLK=>Clock, D => mul_out(63 downto 32), EN=>mulhien, RST => Reset,Q=> hi_out);
    MUL_LO:n_bit_register PORT MAP(CLK=>Clock, D => mul_out(31 downto 0), EN=>mulloen, RST => Reset,Q=> lo_out);
    MUL : MultTop PORT MAP(A=>aout ,B=> bout,rst=>mul_reset ,clk=>clock,done=> mul_done,R=> mul_out);
end structural;