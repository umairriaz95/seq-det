#!/bin/csh -f

cd /home/uriaz/misc/synop_proj

#This ENV is used to avoid overriding current script in next vcselab run 
setenv SNPS_VCSELAB_SCRIPT_NO_OVERRIDE  1

/eda/synopsys/2020-21/RHELx86/VCS_2020.12/linux64/bin/vcselab $* \
    -o \
    simv \
    -nobanner \

cd -

