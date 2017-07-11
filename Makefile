#
#   Makefile for ddCOSMO
#
RunF77 = ifort
FFLAGS = -g -O3 -xHost -qopenmp  -i8 -mkl=sequential 
LIBS =  -lpthread -lm -ldl

MODS = ddcosmo.o
OBJS = mkrhs.o llgnew.o main.o forces.o efld.o iefpcm.o compute_forces.o fmm_dummy.o\
	jacobi_diis.o cosmo.o gmres.o matvec.o pcm.o numgrad_pcm.o numgrad.o
#
all:    $(MODS) $(OBJS)
	$(RunF77) $(FFLAGS) -o main.exe $(MODS) $(OBJS) $(LIBS) 
#
%.o: %.f
	$(RunF77) $(FFLAGS) -c $*.f
%.o: %.f90
	$(RunF77) $(FFLAGS) -c $*.f90
#
clean:
	rm -fr $(OBJS) *.exe *.mod
