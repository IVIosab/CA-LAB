transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {ex3.vo}

vlog -vlog01compat -work work +incdir+C:/Users/mosab/Desktop/CA\ LABS/Week\ 10/ex3 {C:/Users/mosab/Desktop/CA LABS/Week 10/ex3/full.v}
vlog -vlog01compat -work work +incdir+C:/Users/mosab/Desktop/CA\ LABS/Week\ 10/ex3 {C:/Users/mosab/Desktop/CA LABS/Week 10/ex3/ripple_carry_testbench.v}
vlog -vlog01compat -work work +incdir+C:/Users/mosab/Desktop/CA\ LABS/Week\ 10/ex3 {C:/Users/mosab/Desktop/CA LABS/Week 10/ex3/ex3.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L gate_work -L work -voptargs="+acc"  testbench

do C:/Users/mosab/Desktop/CA LABS/Week 10/ex3/Tcl_script1.tcl
