#!/bin/tcsh -f
#========================================
# This script is a wrapper for converting
# .hb files into column format useful for
# MATLAB.  Uses hb_columns in HB3.
#
# Output is an .xyz file with columns:
# 1 -> lon [decimal deg]
# 2 -> lat [decimal deg]
# 3 -> year
# 4 -> month
# 5 -> IIIMM 
#      (e.g. for sg156 mission 1,
#            III = 156,
#            MM = 01 )
# 6 -> dive (station) number
# 7 -> depth [m]
# 8 -> pressure [dbar]
# 9 -> potential temperature [T90]
#10 -> salinity [PSU]
#11 -> s0 potential density [kg/m^3, T90]
#
# Stefan Gary, March 2015
#========================================

# Set the input file name
set infile = $1

# Get current working directory
set workdir = `pwd`

# Extract to columns
/home/sa03sg/src/HB3/bin/hb_columns ${infile} -Pde/pr/th9/sa/s0 -L -Y -M -S > ${workdir}/${infile}.col
