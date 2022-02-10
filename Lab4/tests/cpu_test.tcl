# restart the simulation
restart

# forcing a clock with 10 ns period
add_force Clock 1 {0 5ns} -repeat_every 10ns

#add 1 with addi to reg 0
add_force MemoryDataIn -radix hex 20000001
add_force Reset 1 
run 10 ns

add_force Reset 0

run 200 ns

#add 2 with addi to reg1
add_force MemoryDataIn -radix hex 20210002
#add_force Reset 1 
#run 10 ns
add_force Reset 0

run 200 ns

#test adding r3 <- r1 + r2
add_force MemoryDataIn -radix hex 00011021
run 40 ns
#if worked result should be f i think

#AND reg 0 and 2 into 3
add_force MemoryDataIn -radix hex 00021824
run 40 ns

#SLTI on r3<6 store in r4 
add_force MemoryDataIn -radix hex 286400FF
run 40 ns

#Test BNE on r3 and r0 (should be equal)
add_force MemoryDataIn -radix hex 14600000
run 30 ns

#BNE should happen 
add_force MemoryDataIn -radix hex 14620000
run 30 ns

#test jump to zero
add_force MemoryDataIn -radix hex 08000000
run 30 ns

#test MUl
add_force MemoryDataIn -radix hex 00030019
run 1000 ns

add_force MemoryDataIn -radix hex 00002810
run 2000 ns

add_force MemoryDataIn -radix hex 00003012
run 2000 ns
