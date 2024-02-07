#=======================================
# WANNIER90 	
#=======================================

TOPDIR = /Users/marcolee/Library/CloudStorage/OneDrive-HarrowInternationalSchoolHongKong/python/personal/projects/in progress/Atomic model simulation/qe-7.3

F90=gfortran
FCOPTS=$(FFLAGS) -cpp 
LDOPTS=-g

LIBS = -L/usr/local/lib -llapack  -lblas   -lblas  
