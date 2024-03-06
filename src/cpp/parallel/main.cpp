#include <vector>
#include <string>
#include <fstream>
#include <chrono>
#include <iostream>
#include <thread>
#include <iomanip>

//
// Created by dostavic on 04.03.24.
//
template<typename T>
void saveMatrix(std::vector<std::vector<T>>& matrix, const std::string& path) {
    std::ofstream result_file(path);

    for (const auto& row : matrix) {
        for (const auto& element : row) {
            if constexpr (std::is_same<T, int>::value) {
                result_file << element << " ";
            } else if constexpr (std::is_same<T, float>::value) {
                result_file << std::fixed << std::setprecision(2) << element << " ";
            }
        }
        result_file << "\n";
    }

    result_file.close();
}

template<typename T>
void multiplyPart(const std::vector<std::vector<T>>& matrixA, const std::vector<std::vector<T>>& matrixB,
                  std::vector<std::vector<T>>& result, int from, int to) {
    for (int i = from; i < to; i++) {
        for (int j = 0; j < matrixB[0].size(); j++) {
            for (int k = 0; k < matrixA.size(); k++) {
                result[i][j] += matrixA[i][k] * matrixB[k][j];
            }
        }
    }
}

template<typename T>
std::vector<std::vector<T>> multiplyMatrixParallel(std::vector<std::vector<T>> matrixA,
                                             std::vector<std::vector<T>> matrixB) {
    std::vector<std::vector<T>> result(matrixA.size(), std::vector<T>(matrixB[0].size(), 0));

    int numThreads = 2;
    int n = matrixA.size();
    std::vector<std::thread> threads(numThreads);

    for (int i = 0; i < numThreads; i++) {
        int from = i * n / numThreads;
        int to = (i + 1) * n / numThreads;
        threads[i] = std::thread(multiplyPart<T>, cref(matrixA), cref(matrixB), ref(result), from, to);
    }

    for (auto& t : threads) {
        t.join();
    }

    return result;
}

template<typename T>
std::vector<std::vector<T>> readMatrix(const std::string& path) {
    std::ifstream fp(path);

    if (!fp) {
        return {};
    }

    int rows, cols;
    fp >> rows >> cols;
    std::vector<std::vector<T>> matrix(rows, std::vector<T>(cols));

    for (int row = 0; row < rows; row++) {
        for (int col = 0; col < cols; col++) {
            fp >> matrix[row][col];
        }
    }

    return matrix;
}

int main() {
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