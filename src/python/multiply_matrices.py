import time

import numpy as np


# Reads a matrix from a file and returns it as a numpy array.
def read_matrix(path):
    with open(path, 'r') as file:
        # Skip the first line (assumed to contain the matrix size).
        _, _ = map(int, file.readline().split())
        # Read the remainder of the file and convert each line to a row in the numpy array.
        matrix = np.array([list(map(float, line.split())) for line in file])

        return matrix


# Read matrices A and B from files.
matrixA = read_matrix("../../data/input/matrix_int_500_500_1.txt")
matrixB = read_matrix("../../data/input/matrix_int_500_500_2.txt")

# Record the start time of the matrix multiplication.
start_time = time.time()

# Perform matrix multiplication using numpy's dot function.
result = np.dot(matrixA, matrixB)

# Record the end time of the matrix multiplication.
end_time = time.time()
# Calculate the duration of the matrix multiplication in milliseconds.
duration = (end_time - start_time) * 1000
print(f"Time: {duration} ms")

# Save the result matrix to a file, formatting numbers to two decimal places.
np.savetxt("../../data/output/matrix_py.txt", result, fmt='%0.2f')
