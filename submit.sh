# Before running this with "condor_submit submit.sh", the
# directories log, error, and output must exist.

universe = vanilla
log    =    log/myscript-chtc_$(Cluster)_$(Process).log
error  =  error/myscript-chtc_$(Cluster)_$(Process).err
output = output/myscript-chtc_$(Cluster)_$(Process).out

executable = ./group4.sh

# The only argument below
arguments = $(Process) 
should_transfer_files = YES                                                 
when_to_transfer_output = ON_EXIT              
transfer_input_files = http://proxy.chtc.wisc.edu/SQUID/chtc/R402.tar.gz, packages_FITSio.tar.gz, group4.R, $(filename)

request_cpus = 1
request_memory = 1GB                                                           
request_disk = 2MB                                                                                   
queue filename matching files ./earthquake/*
