 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { fe_env_in_agent }
wave add uvm_test_top.environment.fe_env.in_agent.in_agent_monitor.txn_stream -radix string -tag F0
wave group fe_env_in_agent_bus
wave add -group fe_env_in_agent_bus hdl_top.fe_env_in_agent_bus.* -radix hexadecimal -tag F0
wave group fe_env_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { fe_env_out_agent }
wave add uvm_test_top.environment.fe_env.out_agent.out_agent_monitor.txn_stream -radix string -tag F0
wave group fe_env_out_agent_bus
wave add -group fe_env_out_agent_bus hdl_top.fe_env_out_agent_bus.* -radix hexadecimal -tag F0
wave group fe_env_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { de_env_agent_in }
wave add uvm_test_top.environment.de_env.agent_in.agent_in_monitor.txn_stream -radix string -tag F0
wave group de_env_agent_in_bus
wave add -group de_env_agent_in_bus hdl_top.de_env_agent_in_bus.* -radix hexadecimal -tag F0
wave group de_env_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { de_env_agent_out }
wave add uvm_test_top.environment.de_env.agent_out.agent_out_monitor.txn_stream -radix string -tag F0
wave group de_env_agent_out_bus
wave add -group de_env_agent_out_bus hdl_top.de_env_agent_out_bus.* -radix hexadecimal -tag F0
wave group de_env_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { ex_env_agent_in }
wave add uvm_test_top.environment.ex_env.agent_in.agent_in_monitor.txn_stream -radix string -tag F0
wave group ex_env_agent_in_bus
wave add -group ex_env_agent_in_bus hdl_top.ex_env_agent_in_bus.* -radix hexadecimal -tag F0
wave group ex_env_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { ex_env_agent_out }
wave add uvm_test_top.environment.ex_env.agent_out.agent_out_monitor.txn_stream -radix string -tag F0
wave group ex_env_agent_out_bus
wave add -group ex_env_agent_out_bus hdl_top.ex_env_agent_out_bus.* -radix hexadecimal -tag F0
wave group ex_env_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { wb_env_agent_in }
wave add uvm_test_top.environment.wb_env.agent_in.agent_in_monitor.txn_stream -radix string -tag F0
wave group wb_env_agent_in_bus
wave add -group wb_env_agent_in_bus hdl_top.wb_env_agent_in_bus.* -radix hexadecimal -tag F0
wave group wb_env_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { wb_env_agent_out }
wave add uvm_test_top.environment.wb_env.agent_out.agent_out_monitor.txn_stream -radix string -tag F0
wave group wb_env_agent_out_bus
wave add -group wb_env_agent_out_bus hdl_top.wb_env_agent_out_bus.* -radix hexadecimal -tag F0
wave group wb_env_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { ctrl_env_agent_in }
wave add uvm_test_top.environment.ctrl_env.agent_in.agent_in_monitor.txn_stream -radix string -tag F0
wave group ctrl_env_agent_in_bus
wave add -group ctrl_env_agent_in_bus hdl_top.ctrl_env_agent_in_bus.* -radix hexadecimal -tag F0
wave group ctrl_env_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { ctrl_env_agent_out }
wave add uvm_test_top.environment.ctrl_env.agent_out.agent_out_monitor.txn_stream -radix string -tag F0
wave group ctrl_env_agent_out_bus
wave add -group ctrl_env_agent_out_bus hdl_top.ctrl_env_agent_out_bus.* -radix hexadecimal -tag F0
wave group ctrl_env_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { memacc_env_agent_in }
wave add uvm_test_top.environment.memacc_env.agent_in.agent_in_monitor.txn_stream -radix string -tag F0
wave group memacc_env_agent_in_bus
wave add -group memacc_env_agent_in_bus hdl_top.memacc_env_agent_in_bus.* -radix hexadecimal -tag F0
wave group memacc_env_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { memacc_env_agent_out }
wave add uvm_test_top.environment.memacc_env.agent_out.agent_out_monitor.txn_stream -radix string -tag F0
wave group memacc_env_agent_out_bus
wave add -group memacc_env_agent_out_bus hdl_top.memacc_env_agent_out_bus.* -radix hexadecimal -tag F0
wave group memacc_env_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { Instruction }
wave add uvm_test_top.environment.Instruction.Instruction_monitor.txn_stream -radix string -tag F0
wave group Instruction_bus
wave add -group Instruction_bus hdl_top.Instruction_bus.* -radix hexadecimal -tag F0
wave group Instruction_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { Data }
wave add uvm_test_top.environment.Data.Data_monitor.txn_stream -radix string -tag F0
wave group Data_bus
wave add -group Data_bus hdl_top.Data_bus.* -radix hexadecimal -tag F0
wave group Data_bus -collapse
wave insertion [expr [wave index insertpoint] +1]



wave update on
WaveSetStreamView

