#include <vector> // Include the vector header for using the std::vector container.
#include <string> // Include the string header for using the std::string class.
#include <fstream> // Include the fstream header for file stream operations (input/output).
#include <chrono> // Include the chrono header for measuring time durations and time points.
#include <iostream> // Include the iostream header for input and output operations.
#include <thread> // Include the thread header for using the std::thread class for threading.
#include <iomanip> // Include the iomanip header for manipulating the output format (e.g., setprecision).

//
// Created by dostavic on 04.03.24.
//

// Template function to save a matrix to a file.
template<typename T>
void saveMatrix(std::vector<std::vector<T>>& matrix, const std::string& path) {
    std::ofstream result_file(path); // Open a file stream for output.

    for (const auto& row : matrix) { // Iterate over each row in the matrix.
        for (const auto& element : row) { // Iterate over each element in the row.
            // Check the type of the element and format the output accordingly.
            if constexpr (std::is_same<T, int>::value) {
                result_file << element << " ";
            } else if constexpr (std::is_same<T, float>::value) {
                result_file << std::fixed << std::setprecision(2) << element << " ";
            }
        }
        result_file << "\n"; // Add a newline character after each row.
    }

    result_file.close(); // Close the file stream.
}

// Template function to multiply a part of two matrices and store the result in a third matrix.
template<typename T>
void multiplyPart(const std::vector<std::vector<T>>& matrixA, const std::vector<std::vector<T>>& matrixB,
                  std::vector<std::vector<T>>& result, int from, int to) {
    for (int i = from; i < to; i++) { // Iterate over the specified rows of matrixA.
        for (int j = 0; j < matrixB[0].size(); j++) { // Iterate over the columns of matrixB.
            for (int k = 0; k < matrixA.size(); k++) { // Iterate over the columns of matrixA/rows of matrixB.
                // Perform the multiplication and accumulate the result.
                result[i][j] += matrixA[i][k] * matrixB[k][j];
            }
        }
    }
}

// Template function to perform parallel matrix multiplication.
template<typename T>
std::vector<std::vector<T>> multiplyMatrixParallel(std::vector<std::vector<T>> matrixA,
                                             std::vector<std::vector<T>> matrixB) {
    std::vector<std::vector<T>> result(matrixA.size(), std::vector<T>(matrixB[0].size(), 0));

    int numThreads = 2;
    int n = matrixA.size(); // Number of rows in matrixA.
    std::vector<std::thread> threads(numThreads); // Create a vector of threads.

    for (int i = 0; i < numThreads; i++) {
        int from = i * n / numThreads; // Starting row for this thread.
        int to = (i + 1) * n / numThreads; // Ending row for this thread.
        // Launch a thread to multiply the part of the matrices.
        threads[i] = std::thread(multiplyPart<T>, cref(matrixA), cref(matrixB), ref(result), from, to);
    }

    for (auto& t : threads) {
        t.join(); // Wait for all threads to complete.
    }

    return result; // Return the resulting matrix.
}

// Template function to read a matrix from a file.
template<typename T>
std::vector<std::vector<T>> readMatrix(const std::string& path) {
    std::ifstream fp(path); // Open a file stream for input.

    if (!fp) {
        return {}; // Return an empty matrix if the file cannot be opened.
    }

    int rows, cols;
    fp >> rows >> cols; // Read the number of rows and columns from the file.
    std::vector<std::vector<T>> matrix(rows, std::vector<T>(cols)); // Initialize the matrix.

    for (int row = 0; row < rows; row++) {
        for (int col = 0; col < cols; col++) {
            fp >> matrix[row][col]; // Read each element of the matrix.
        }
    }

    return matrix; // Return the matrix.
}

int main() {
// Float
//    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");
//    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");
//
//    auto startFloat = std::chrono::high_resolution_clock::now();
//
//    auto resultFloat = multiplyMatrixParallel(matrixAFloat, matrixBFloat);
//
//    auto endFloat = std::chrono::high_resolution_clock::now();
//    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);
//
//    std::cout << "Time (float): " << elapsedFloat.count() << " ms" << std::endl;
//
//    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_p_float.txt");

// Int
    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");
    auto matrixBFInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");

    auto startInt = std::chrono::high_resolution_clock::now();

    auto resultInt = multiplyMatrixParallel(matrixAInt, matrixBFInt);

    auto endInt = std::chrono::high_resolution_clock::now();
    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);

    std::cout << "Time (int): " << elapsedInt.count() << " ms" << std::endl;

    saveMatrix(resultInt, "../../../data/output/matrix_cpp_p_int.txt");

    return 0;
}