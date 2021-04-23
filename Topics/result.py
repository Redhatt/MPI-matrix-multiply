import numpy as np
import matplotlib.pyplot as plt

file1 = 'worker_a.txt'
file2 = 'worker_b.txt'

def get_avg(file):
	ans = [0, 0, 0]
	count = [0, 0, 0]
	d = {'2': 0, '4': 1, '6': 2}
	with open(file, 'r') as fp:
		while 1:
			a = fp.readline()
			if len(a) == 0:
				break
			val = a.strip().split('-')
			count[d[val[0]]] += 1
			ans[d[val[0]]] += float(val[1])
		for i in range(3):
			ans[i] /= count[i]
	return ans

val1 = get_avg(file1)
val2 = get_avg(file2)
print(val1)
print(val2)