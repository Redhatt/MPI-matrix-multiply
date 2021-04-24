#!/bin/bash
module load mpi/openmpi-x86 64
export OPENBLAS NUM THREADS=1
touch worker_a.txt
touch worker_b.txt

count=10
for i in $(seq $count); do
    mpirun --allow-run-as-root -n 3 python MPI-matrix-multiply/Topics/code_a.py
done

for i in $(seq $count); do
    mpirun --allow-run-as-root -n 5 python MPI-matrix-multiply/Topics/code_a.py
done

for i in $(seq $count); do
    mpirun --allow-run-as-root -n 7 python MPI-matrix-multiply/Topics/code_a.py
done

for i in $(seq $count); do
    mpirun --allow-run-as-root -n 3 python MPI-matrix-multiply/Topics/code_b.py
done

for i in $(seq $count); do
    mpirun --allow-run-as-root -n 5 python MPI-matrix-multiply/Topics/code_b.py
done

for i in $(seq $count); do
    mpirun --allow-run-as-root -n 7 python MPI-matrix-multiply/Topics/code_b.py
done
