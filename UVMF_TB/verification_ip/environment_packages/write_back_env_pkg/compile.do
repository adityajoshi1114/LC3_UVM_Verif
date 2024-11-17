# Tcl do file for compile of write_back interface

# pragma uvmf custom additional begin
# pragma uvmf custom additional end



quietly set cmd [format "vlog -timescale 1ps/1ps +incdir+%s/environment_packages/write_back_env_pkg" $env(UVMF_VIP_LIBRARY_HOME)]
quietly set cmd [format "%s %s/environment_packages/write_back_env_pkg/write_back_env_pkg.sv" $cmd $env(UVMF_VIP_LIBRARY_HOME)]
eval $cmd


