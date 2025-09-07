vlog asfifo_tb.v
vsim tb +testcase=full
#vsim tb +testcase=empty
#vsim tb +testcase=overflow
#vsim tb +testcase=underflow
add wave -r sim:/tb/dut/*
run -all
