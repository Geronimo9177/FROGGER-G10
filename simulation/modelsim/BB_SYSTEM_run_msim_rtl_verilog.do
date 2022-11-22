transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/SC_STATEMACHINEBACKG.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/SC_STATEMACHINEPOINT.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/SC_RegPOINTTYPE.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/CC_SEVENSEG1.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/CC_BIN2BCD1.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/SC_upSPEEDCOUNTER.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/CC_SPEEDCOMPARATOR.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/max7219_ctrl.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/SC_DEBOUNCE1.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/BB_SYSTEM.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/SC_RegBACKGTYPE_14.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/SC_RegBACKGTYPE_26.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/SC_RegBACKGTYPE_913.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/CC_COMPARATORCRASH.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/CC_FILTER.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/SC_STATEMACHINEMAIN.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/SC_STATEMACHINEIMAGE.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/SC_LEVELCOUNTER.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/SC_LIFECOUNTER.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/SC_IMAGECOUNTER.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/CC_COMPARATOR_SIDE.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/SC_RANDOM.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/CC_BOTTOMSIDECOMPARATOR.v}
vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/rtl/shift_reg_start_done.v}

vlog -vlog01compat -work work +incdir+C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/simulation/modelsim {C:/Users/geron/OneDrive/Escritorio/PRJ_FROGGER/simulation/modelsim/TB_SYSTEM.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  TB_SYSTEM

add wave *
view structure
view signals
run -all
