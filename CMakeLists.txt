cmake_minimum_required(VERSION 3.27)
project(PyGoCppMatrix)

set(CMAKE_CXX_STANDARD 14)

add_executable(PyGoCppMatrix src/cpp/sequential/main.cpp)

add_executable(PyGoCppMatrixParallel src/cpp/parallel/main.cpp)