 

onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider fe_env_in_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.fe_env/in_agent/in_agent_monitor/txn_stream
add wave -noupdate -group fe_env_in_agent_bus /hdl_top/fe_env_in_agent_bus/*
add wave -noupdate -divider fe_env_out_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.fe_env/out_agent/out_agent_monitor/txn_stream
add wave -noupdate -group fe_env_out_agent_bus /hdl_top/fe_env_out_agent_bus/*
add wave -noupdate -divider de_env_agent_in 
add wave -noupdate /uvm_root/uvm_test_top/environment.de_env/agent_in/agent_in_monitor/txn_stream
add wave -noupdate -group de_env_agent_in_bus /hdl_top/de_env_agent_in_bus/*
add wave -noupdate -divider de_env_agent_out 
add wave -noupdate /uvm_root/uvm_test_top/environment.de_env/agent_out/agent_out_monitor/txn_stream
add wave -noupdate -group de_env_agent_out_bus /hdl_top/de_env_agent_out_bus/*
add wave -noupdate -divider ex_env_agent_in 
add wave -noupdate /uvm_root/uvm_test_top/environment.ex_env/agent_in/agent_in_monitor/txn_stream
add wave -noupdate -group ex_env_agent_in_bus /hdl_top/ex_env_agent_in_bus/*
add wave -noupdate -divider ex_env_agent_out 
add wave -noupdate /uvm_root/uvm_test_top/environment.ex_env/agent_out/agent_out_monitor/txn_stream
add wave -noupdate -group ex_env_agent_out_bus /hdl_top/ex_env_agent_out_bus/*
add wave -noupdate -divider wb_env_agent_in 
add wave -noupdate /uvm_root/uvm_test_top/environment.wb_env/agent_in/agent_in_monitor/txn_stream
add wave -noupdate -group wb_env_agent_in_bus /hdl_top/wb_env_agent_in_bus/*
add wave -noupdate -divider wb_env_agent_out 
add wave -noupdate /uvm_root/uvm_test_top/environment.wb_env/agent_out/agent_out_monitor/txn_stream
add wave -noupdate -group wb_env_agent_out_bus /hdl_top/wb_env_agent_out_bus/*
add wave -noupdate -divider ctrl_env_agent_in 
add wave -noupdate /uvm_root/uvm_test_top/environment.ctrl_env/agent_in/agent_in_monitor/txn_stream
add wave -noupdate -group ctrl_env_agent_in_bus /hdl_top/ctrl_env_agent_in_bus/*
add wave -noupdate -divider ctrl_env_agent_out 
add wave -noupdate /uvm_root/uvm_test_top/environment.ctrl_env/agent_out/agent_out_monitor/txn_stream
add wave -noupdate -group ctrl_env_agent_out_bus /hdl_top/ctrl_env_agent_out_bus/*
add wave -noupdate -divider memacc_env_agent_in 
add wave -noupdate /uvm_root/uvm_test_top/environment.memacc_env/agent_in/agent_in_monitor/txn_stream
add wave -noupdate -group memacc_env_agent_in_bus /hdl_top/memacc_env_agent_in_bus/*
add wave -noupdate -divider memacc_env_agent_out 
add wave -noupdate /uvm_root/uvm_test_top/environment.memacc_env/agent_out/agent_out_monitor/txn_stream
add wave -noupdate -group memacc_env_agent_out_bus /hdl_top/memacc_env_agent_out_bus/*
add wave -noupdate -divider Instruction 
add wave -noupdate /uvm_root/uvm_test_top/environment/Instruction/Instruction_monitor/txn_stream
add wave -noupdate -group Instruction_bus /hdl_top/Instruction_bus/*
add wave -noupdate -divider Data 
add wave -noupdate /uvm_root/uvm_test_top/environment/Data/Data_monitor/txn_stream
add wave -noupdate -group Data_bus /hdl_top/Data_bus/*



TreeUpdate [SetDefaultTree]
quietly wave cursor active 0
configure wave -namecolwidth 472
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {27 ns} {168 ns}

