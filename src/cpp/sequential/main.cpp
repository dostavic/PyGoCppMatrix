#include <vector>
#include <string>
#include <fstream>
#include <chrono>
#include <iostream>
#include <iomanip>
//#include <climits>
//#include <csignal>

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
std::vector<std::vector<T>> multiplyMatrix(std::vector<std::vector<T>> matrixA,
                                             std::vector<std::vector<T>> matrixB) {
    std::vector<std::vector<T>> result(matrixA.size(), std::vector<T>(matrixB[0].size(), 0));

    for (int i = 0; i < matrixA.size(); i++) {
        for (int j = 0; j < matrixB[0].size(); j++) {
            for (int k = 0; k < matrixA.size(); k++) {
                result[i][j] += matrixA[i][k] * matrixB[k][j];
            }
        }
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

//    fp.close();
    return matrix;
}

int main() {
//    char result1[PATH_MAX];
//    ssize_t count = readlink("/proc/self/exe", result1, PATH_MAX);
//    if (count != -1) {
//        std::cout << "Шлях до виконуваного файлу: " << std::string(result1, (count > 0) ? count : 0) << std::endl;
//    } else {
//        std::cerr << "Помилка при отриманні шляху до виконуваного файлу" << std::endl;
//    }

//    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");
//    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");
////    std::vector<std::vector<float>> matrixB = readMatrix("../../../data/input/matrix_int_500_500_2.txt");
//
//    auto startFloat = std::chrono::high_resolution_clock::now();
//
//    auto resultFloat = multiplyMatrix(matrixAFloat, matrixBFloat);
////    std::vector<std::vector<float>> result = multiplyMatrix(matrixA, matrixB);
//
//    auto endFloat = std::chrono::high_resolution_clock::now();
//    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);
//
//    std::cout << "Time (float) : " << elapsedFloat.count() << " ms" << std::endl;
//
//    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_s_float.txt");


    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");
    auto matrixBInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");
//    std::vector<std::vector<float>> matrixB = readMatrix("../../../data/input/matrix_int_500_500_2.txt");

    auto startInt = std::chrono::high_resolution_clock::now();

    auto resultInt = multiplyMatrix(matrixAInt, matrixBInt);
//    std::vector<std::vector<float>> result = multiplyMatrix(matrixA, matrixB);

    auto endInt = std::chrono::high_resolution_clock::now();
    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);

    std::cout << "Time (int) : " << elapsedInt.count() << " ms" << std::endl;

    saveMatrix(resultInt, "../../../data/output/matrix_cpp_s_int.txt");

    return 0;
}