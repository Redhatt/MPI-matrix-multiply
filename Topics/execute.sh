#!/bin/bash
module load mpi/openmpi-x86 64
export OPENBLAS NUM THREADS=1
touch worker_a.txt
touch worker_b.txt

count=10
for i in $(seq $count); do
    mpirun -n 3 python MPI-matrix-multiply/Topics/code_a.py
    mpirun -n 3 MPI-matrix-multiply/Topics/python code_b.py
done

for i in $(seq $count); do
    mpirun -n 5 MPI-matrix-multiply/Topics/python code_a.py
    mpirun -n 5 MPI-matrix-multiply/Topics/python code_b.py
done

for i in $(seq $count); do
    mpirun -n 7 MPI-matrix-multiply/Topics/python code_a.py
    mpirun -n 7 MPI-matrix-multiply/Topics/python code_b.py
done

python MPI-matrix-multiply/Topics/result.py
