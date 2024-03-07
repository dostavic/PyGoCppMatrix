#include <vector> // Includes the vector container from the Standard Template Library (STL).
#include <string> // Includes the string class for handling text.
#include <fstream> // Includes file stream capabilities for reading from and writing to files.
#include <chrono> // Includes the chrono library for time measurement.
#include <iostream> // Includes standard input/output stream objects.
#include <iomanip> // Includes utilities to manipulate the format of input and output.

//
// Created by dostavic on 04.03.24.
//

// Template function to save a matrix to a file.
template<typename T>
void saveMatrix(std::vector<std::vector<T>>& matrix, const std::string& path) {
    std::ofstream result_file(path); // Opens the file.

    // Iterates through each element in the matrix and writes it to the file.
    for (const auto& row : matrix) {
        for (const auto& element : row) {
            // Formats output based on the type of elements in the matrix (int or float).
            if constexpr (std::is_same<T, int>::value) {
                result_file << element << " ";
            } else if constexpr (std::is_same<T, float>::value) {
                result_file << std::fixed << std::setprecision(2) << element << " ";
            }
        }
        result_file << "\n"; // New line for the next row.
    }

    result_file.close(); // Closes the file.
}

// Template function to multiply two matrices.
template<typename T>
std::vector<std::vector<T>> multiplyMatrix(std::vector<std::vector<T>> matrixA,
                                             std::vector<std::vector<T>> matrixB) {
    std::vector<std::vector<T>> result(matrixA.size(), std::vector<T>(matrixB[0].size(), 0));

    // Nested loops to perform matrix multiplication.
    for (int i = 0; i < matrixA.size(); i++) {
        for (int j = 0; j < matrixB[0].size(); j++) {
            for (int k = 0; k < matrixA.size(); k++) {
                result[i][j] += matrixA[i][k] * matrixB[k][j];
            }
        }
    }

    return result; // Returns the result of the multiplication.
}

// Template function to read a matrix from a file.
template<typename T>
std::vector<std::vector<T>> readMatrix(const std::string& path) {
    std::ifstream fp(path);

    if (!fp) {
        return {}; // Returns an empty matrix if the file cannot be opened.
    }

    int rows, cols;
    fp >> rows >> cols; // Reads the dimensions of the matrix.
    std::vector<std::vector<T>> matrix(rows, std::vector<T>(cols));

    // Reads each element of the matrix.
    for (int row = 0; row < rows; row++) {
        for (int col = 0; col < cols; col++) {
            fp >> matrix[row][col];
        }
    }

    return matrix; // Returns the matrix.
}

int main() {
// Float
    // Read, multiply, and save the result for int matrices.
//    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");
//    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");
//
//    auto startFloat = std::chrono::high_resolution_clock::now(); // Starts timing.
//
//    auto resultFloat = multiplyMatrix(matrixAFloat, matrixBFloat); // Performs matrix multiplication.
//
//    auto endFloat = std::chrono::high_resolution_clock::now(); // Ends timing.

    // Calculates and displays the time taken for the operation.
//    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);
//
//    std::cout << "Time (float) : " << elapsedFloat.count() << " ms" << std::endl;
//
    // Saves the result to a file.
//    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_s_float.txt");


// Int
    // Read, multiply, and save the result for int matrices.
    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");
    auto matrixBInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");

    auto startInt = std::chrono::high_resolution_clock::now(); // Starts timing.

    auto resultInt = multiplyMatrix(matrixAInt, matrixBInt); // Performs matrix multiplication.

    auto endInt = std::chrono::high_resolution_clock::now(); // Ends timing.

    // Calculates and displays the time taken for the operation.
    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);

    std::cout << "Time (int) : " << elapsedInt.count() << " ms" << std::endl;

    // Saves the result to a file.
    saveMatrix(resultInt, "../../../data/output/matrix_cpp_s_int.txt");

    return 0;
}