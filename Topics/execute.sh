#!/bin/bash
module load mpi/openmpi-x86 64
export OPENBLAS NUM THREADS=1
touch worker_a.txt
touch worker_b.txt

count=20
for i in $(seq $count); do
    mpirun -n 3 python MPI-matrix-multiply/Topics/code_a.py
    sleep 0.5
done

for i in $(seq $count); do
    mpirun -n 5 python MPI-matrix-multiply/Topics/code_a.py
    sleep 0.5
done

for i in $(seq $count); do
    mpirun -n 7 python MPI-matrix-multiply/Topics/code_a.py
    sleep 0.5
done

for i in $(seq $count); do
    mpirun -n 3 python MPI-matrix-multiply/Topics/code_b.py
    sleep 0.5
done

for i in $(seq $count); do
    mpirun -n 5 python MPI-matrix-multiply/Topics/code_b.py
    sleep 0.5
done

for i in $(seq $count); do
    mpirun -n 7 python MPI-matrix-multiply/Topics/code_b.py
    sleep 0.5
done
