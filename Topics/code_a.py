from mpi4py import MPI
import numpy as np
from time import time

com = MPI.COMM_WORLD
rank = com.Get_rank()

N = com.Get_size()-1
m,n = 9000, 9000

A = np.random.rand(m,n)

file = 'worker_a.txt'

x = np.zeros((n, 1))

if rank == 0:
	info = MPI.Status()
	temp = np.empty((m//N,1))
	x = np.random.rand(n,1)

	for i in range(N):
		com.Send(A[i*(m//N): (i+1)*m//N, :], dest=(i+1), tag=i)

	start = time()

	# broadcast it---------------
	#----------------------------

	# get them back--------------

	for i in range(N):
		com.Recv(temp, source=MPI.ANY_SOURCE, tag=MPI.ANY_TAG, status=info)

	#----------------------------
	stop = time()
	total_time = (stop - start) * 1000
	print(total_time)

	with open (file, 'a') as fp:
		fp.write("{}-{}".format(N, total_time))

for i in range(N):
	if rank == i+1:
		matrix = np.empty((m//N, n))
		com.Recv(matrix, source=0, tag=i)

		# compute the answer
		ans = np.dot(matrix, x)

		# sending answer
		com.Send(ans, dest=0)

com.Bcast(x, root=0)