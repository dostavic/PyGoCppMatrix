import time

import numpy as np


def read_matrix(path):
    with open(path, 'r') as file:
        _, _ = map(int, file.readline().split())
        matrix = np.array([list(map(float, line.split())) for line in file])

        return matrix


matrixA = read_matrix("../../data/input/matrix_int_500_500_1.txt")
matrixB = read_matrix("../../data/input/matrix_int_500_500_2.txt")

start_time = time.time()

result = np.dot(matrixA, matrixB)

end_time = time.time()
duration = (end_time - start_time) * 1000
print(f"Time: {duration} ms")

np.savetxt("../../data/output/matrix_py.txt", result, fmt='%0.2f')
