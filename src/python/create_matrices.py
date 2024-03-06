import numpy as np

arr = np.random.uniform(0, 100, [2000, 2000])
# arr_int_float = np.round(arr).astype(float)
# arr_int_float = np.round(arr).astype(int) # Int
path = "../../data/input/matrix_float_2000_2000_2.txt"

with open(path, 'w') as file:
    file.write(f"{arr.shape[0]} {arr.shape[1]}\n")
    for row in arr: # Float
    # for row in arr_int_float: # Int
        # file.write(" ".join(map(str, row)) + "\n")
        formatted_row = " ".join(["{:.2f}".format(num) for num in row]) # Float
        file.write(formatted_row + "\n") # Float
