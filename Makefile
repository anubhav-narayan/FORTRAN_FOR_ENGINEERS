.SUFFIXES:
FC=gfortran
SOURCES=pendulum.f90 paint.f90

paint: paint.f90
	$(FC) paint.f90 -o ./build/pendulum

pendulum: pendulum.f90
	$(FC) pendulum.f90 -o ./build/pendulum

.PHONY: clean
clean:
	rm -rf ./build/
