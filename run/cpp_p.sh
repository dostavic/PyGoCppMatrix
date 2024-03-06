#C++ parallel 2
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
SOURCE_FILE_P="$SCRIPT_DIR/../src/cpp/parallel/main.cpp"
OUTPUT_FILE_P="$SCRIPT_DIR/../src/cpp/parallel/main.o"

g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 2 | 500x500 | int"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_int_500_500_1/matrix_int_1000_1000_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_int_500_500_2/matrix_int_1000_1000_2/g' "$SOURCE_FILE_P"

g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 2 | 1000x1000 | int"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_int_1000_1000_1/matrix_int_2000_2000_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_int_1000_1000_2/matrix_int_2000_2000_2/g' "$SOURCE_FILE_P"

g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 2 | 2000x2000 | int"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_int_2000_2000_1/matrix_int_500_500_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_int_2000_2000_2/matrix_int_500_500_2/g' "$SOURCE_FILE_P"

echo



sed -i 's|    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|//    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|g' "$SOURCE_FILE_P"
sed -i 's|    auto matrixBFInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|//    auto matrixBFInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|g' "$SOURCE_FILE_P"
sed -i 's|    auto startInt = std::chrono::high_resolution_clock::now();|//    auto startInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|    auto resultInt = multiplyMatrixParallel(matrixAInt, matrixBFInt);|//    auto resultInt = multiplyMatrixParallel(matrixAInt, matrixBFInt);|g' "$SOURCE_FILE_P"
sed -i 's|    auto endInt = std::chrono::high_resolution_clock::now();|//    auto endInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|//    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|g' "$SOURCE_FILE_P"
sed -i 's|    std::cout << "Time (int): " << elapsedInt.count() << " ms" << std::endl;|//    std::cout << "Time (int): " << elapsedInt.count() << " ms" << std::endl;|g' "$SOURCE_FILE_P"
sed -i 's|    saveMatrix(resultInt, "../../../data/output/matrix_cpp_p_int.txt");|//    saveMatrix(resultInt, "../../../data/output/matrix_cpp_p_int.txt");|g' "$SOURCE_FILE_P"

sed -i 's|//    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|g' "$SOURCE_FILE_P"
sed -i 's|//    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|g' "$SOURCE_FILE_P"
sed -i 's|//    auto startFloat = std::chrono::high_resolution_clock::now();|    auto startFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|//    auto resultFloat = multiplyMatrixParallel(matrixAFloat, matrixBFloat);|    auto resultFloat = multiplyMatrixParallel(matrixAFloat, matrixBFloat);|g' "$SOURCE_FILE_P"
sed -i 's|//    auto endFloat = std::chrono::high_resolution_clock::now();|    auto endFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|//    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|g' "$SOURCE_FILE_P"
sed -i 's|//    std::cout << "Time (float): " << elapsedFloat.count() << " ms" << std::endl;|    std::cout << "Time (float): " << elapsedFloat.count() << " ms" << std::endl;|g' "$SOURCE_FILE_P"
sed -i 's|//    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_p_float.txt");|    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_p_float.txt");|g' "$SOURCE_FILE_P"


g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 2 | 500x500 | float"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_float_500_500_1/matrix_float_1000_1000_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_float_500_500_2/matrix_float_1000_1000_2/g' "$SOURCE_FILE_P"

g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 2 | 1000x1000 | float"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_float_1000_1000_1/matrix_float_2000_2000_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_float_1000_1000_2/matrix_float_2000_2000_2/g' "$SOURCE_FILE_P"

g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 2 | 2000x2000 | float"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_float_2000_2000_1/matrix_float_500_500_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_float_2000_2000_2/matrix_float_500_500_2/g' "$SOURCE_FILE_P"


sed -i 's|//    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|g' "$SOURCE_FILE_P"
sed -i 's|//    auto matrixBFInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|    auto matrixBFInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|g' "$SOURCE_FILE_P"
sed -i 's|//    auto startInt = std::chrono::high_resolution_clock::now();|    auto startInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|//    auto resultInt = multiplyMatrixParallel(matrixAInt, matrixBFInt);|    auto resultInt = multiplyMatrixParallel(matrixAInt, matrixBFInt);|g' "$SOURCE_FILE_P"
sed -i 's|//    auto endInt = std::chrono::high_resolution_clock::now();|    auto endInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|//    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|g' "$SOURCE_FILE_P"
sed -i 's|//    std::cout << "Time (int): " << elapsedInt.count() << " ms" << std::endl;|    std::cout << "Time (int): " << elapsedInt.count() << " ms" << std::endl;|g' "$SOURCE_FILE_P"
sed -i 's|//    saveMatrix(resultInt, "../../../data/output/matrix_cpp_p_int.txt");|    saveMatrix(resultInt, "../../../data/output/matrix_cpp_p_int.txt");|g' "$SOURCE_FILE_P"

sed -i 's|    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|//    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|g' "$SOURCE_FILE_P"
sed -i 's|    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|//    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|g' "$SOURCE_FILE_P"
sed -i 's|    auto startFloat = std::chrono::high_resolution_clock::now();|//    auto startFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|    auto resultFloat = multiplyMatrixParallel(matrixAFloat, matrixBFloat);|//    auto resultFloat = multiplyMatrixParallel(matrixAFloat, matrixBFloat);|g' "$SOURCE_FILE_P"
sed -i 's|    auto endFloat = std::chrono::high_resolution_clock::now();|//    auto endFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|//    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|g' "$SOURCE_FILE_P"
sed -i 's|    std::cout << "Time (float): " << elapsedFloat.count() << " ms" << std::endl;|//    std::cout << "Time (float): " << elapsedFloat.count() << " ms" << std::endl;|g' "$SOURCE_FILE_P"
sed -i 's|    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_p_float.txt");|//    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_p_float.txt");|g' "$SOURCE_FILE_P"

#cd ../../../run/ || exit

echo



















sed -i 's|    int numThreads = 2;|    int numThreads = 4;|g' "$SOURCE_FILE_P"

g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 4 | 500x500 | int"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_int_500_500_1/matrix_int_1000_1000_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_int_500_500_2/matrix_int_1000_1000_2/g' "$SOURCE_FILE_P"

g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 4 | 1000x1000 | int"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_int_1000_1000_1/matrix_int_2000_2000_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_int_1000_1000_2/matrix_int_2000_2000_2/g' "$SOURCE_FILE_P"

g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 4 | 2000x2000 | int"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_int_2000_2000_1/matrix_int_500_500_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_int_2000_2000_2/matrix_int_500_500_2/g' "$SOURCE_FILE_P"

echo



sed -i 's|    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|//    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|g' "$SOURCE_FILE_P"
sed -i 's|    auto matrixBFInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|//    auto matrixBFInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|g' "$SOURCE_FILE_P"
sed -i 's|    auto startInt = std::chrono::high_resolution_clock::now();|//    auto startInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|    auto resultInt = multiplyMatrixParallel(matrixAInt, matrixBFInt);|//    auto resultInt = multiplyMatrixParallel(matrixAInt, matrixBFInt);|g' "$SOURCE_FILE_P"
sed -i 's|    auto endInt = std::chrono::high_resolution_clock::now();|//    auto endInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|//    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|g' "$SOURCE_FILE_P"
sed -i 's|    std::cout << "Time (int): " << elapsedInt.count() << " ms" << std::endl;|//    std::cout << "Time (int): " << elapsedInt.count() << " ms" << std::endl;|g' "$SOURCE_FILE_P"
sed -i 's|    saveMatrix(resultInt, "../../../data/output/matrix_cpp_p_int.txt");|//    saveMatrix(resultInt, "../../../data/output/matrix_cpp_p_int.txt");|g' "$SOURCE_FILE_P"

sed -i 's|//    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|g' "$SOURCE_FILE_P"
sed -i 's|//    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|g' "$SOURCE_FILE_P"
sed -i 's|//    auto startFloat = std::chrono::high_resolution_clock::now();|    auto startFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|//    auto resultFloat = multiplyMatrixParallel(matrixAFloat, matrixBFloat);|    auto resultFloat = multiplyMatrixParallel(matrixAFloat, matrixBFloat);|g' "$SOURCE_FILE_P"
sed -i 's|//    auto endFloat = std::chrono::high_resolution_clock::now();|    auto endFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|//    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|g' "$SOURCE_FILE_P"
sed -i 's|//    std::cout << "Time (float): " << elapsedFloat.count() << " ms" << std::endl;|    std::cout << "Time (float): " << elapsedFloat.count() << " ms" << std::endl;|g' "$SOURCE_FILE_P"
sed -i 's|//    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_p_float.txt");|    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_p_float.txt");|g' "$SOURCE_FILE_P"


g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 4 | 500x500 | float"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_float_500_500_1/matrix_float_1000_1000_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_float_500_500_2/matrix_float_1000_1000_2/g' "$SOURCE_FILE_P"

g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 4 | 1000x1000 | float"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_float_1000_1000_1/matrix_float_2000_2000_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_float_1000_1000_2/matrix_float_2000_2000_2/g' "$SOURCE_FILE_P"

g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 4 | 2000x2000 | float"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_float_2000_2000_1/matrix_float_500_500_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_float_2000_2000_2/matrix_float_500_500_2/g' "$SOURCE_FILE_P"


sed -i 's|//    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|g' "$SOURCE_FILE_P"
sed -i 's|//    auto matrixBFInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|    auto matrixBFInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|g' "$SOURCE_FILE_P"
sed -i 's|//    auto startInt = std::chrono::high_resolution_clock::now();|    auto startInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|//    auto resultInt = multiplyMatrixParallel(matrixAInt, matrixBFInt);|    auto resultInt = multiplyMatrixParallel(matrixAInt, matrixBFInt);|g' "$SOURCE_FILE_P"
sed -i 's|//    auto endInt = std::chrono::high_resolution_clock::now();|    auto endInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|//    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|g' "$SOURCE_FILE_P"
sed -i 's|//    std::cout << "Time (int): " << elapsedInt.count() << " ms" << std::endl;|    std::cout << "Time (int): " << elapsedInt.count() << " ms" << std::endl;|g' "$SOURCE_FILE_P"
sed -i 's|//    saveMatrix(resultInt, "../../../data/output/matrix_cpp_p_int.txt");|    saveMatrix(resultInt, "../../../data/output/matrix_cpp_p_int.txt");|g' "$SOURCE_FILE_P"

sed -i 's|    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|//    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|g' "$SOURCE_FILE_P"
sed -i 's|    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|//    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|g' "$SOURCE_FILE_P"
sed -i 's|    auto startFloat = std::chrono::high_resolution_clock::now();|//    auto startFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|    auto resultFloat = multiplyMatrixParallel(matrixAFloat, matrixBFloat);|//    auto resultFloat = multiplyMatrixParallel(matrixAFloat, matrixBFloat);|g' "$SOURCE_FILE_P"
sed -i 's|    auto endFloat = std::chrono::high_resolution_clock::now();|//    auto endFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|//    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|g' "$SOURCE_FILE_P"
sed -i 's|    std::cout << "Time (float): " << elapsedFloat.count() << " ms" << std::endl;|//    std::cout << "Time (float): " << elapsedFloat.count() << " ms" << std::endl;|g' "$SOURCE_FILE_P"
sed -i 's|    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_p_float.txt");|//    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_p_float.txt");|g' "$SOURCE_FILE_P"

echo







































sed -i 's|    int numThreads = 4;|    int numThreads = 8;|g' "$SOURCE_FILE_P"

g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 8 | 500x500 | int"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_int_500_500_1/matrix_int_1000_1000_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_int_500_500_2/matrix_int_1000_1000_2/g' "$SOURCE_FILE_P"

g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 8 | 1000x1000 | int"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_int_1000_1000_1/matrix_int_2000_2000_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_int_1000_1000_2/matrix_int_2000_2000_2/g' "$SOURCE_FILE_P"

g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 8 | 2000x2000 | int"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_int_2000_2000_1/matrix_int_500_500_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_int_2000_2000_2/matrix_int_500_500_2/g' "$SOURCE_FILE_P"

echo



sed -i 's|    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|//    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|g' "$SOURCE_FILE_P"
sed -i 's|    auto matrixBFInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|//    auto matrixBFInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|g' "$SOURCE_FILE_P"
sed -i 's|    auto startInt = std::chrono::high_resolution_clock::now();|//    auto startInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|    auto resultInt = multiplyMatrixParallel(matrixAInt, matrixBFInt);|//    auto resultInt = multiplyMatrixParallel(matrixAInt, matrixBFInt);|g' "$SOURCE_FILE_P"
sed -i 's|    auto endInt = std::chrono::high_resolution_clock::now();|//    auto endInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|//    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|g' "$SOURCE_FILE_P"
sed -i 's|    std::cout << "Time (int): " << elapsedInt.count() << " ms" << std::endl;|//    std::cout << "Time (int): " << elapsedInt.count() << " ms" << std::endl;|g' "$SOURCE_FILE_P"
sed -i 's|    saveMatrix(resultInt, "../../../data/output/matrix_cpp_p_int.txt");|//    saveMatrix(resultInt, "../../../data/output/matrix_cpp_p_int.txt");|g' "$SOURCE_FILE_P"

sed -i 's|//    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|g' "$SOURCE_FILE_P"
sed -i 's|//    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|g' "$SOURCE_FILE_P"
sed -i 's|//    auto startFloat = std::chrono::high_resolution_clock::now();|    auto startFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|//    auto resultFloat = multiplyMatrixParallel(matrixAFloat, matrixBFloat);|    auto resultFloat = multiplyMatrixParallel(matrixAFloat, matrixBFloat);|g' "$SOURCE_FILE_P"
sed -i 's|//    auto endFloat = std::chrono::high_resolution_clock::now();|    auto endFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|//    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|g' "$SOURCE_FILE_P"
sed -i 's|//    std::cout << "Time (float): " << elapsedFloat.count() << " ms" << std::endl;|    std::cout << "Time (float): " << elapsedFloat.count() << " ms" << std::endl;|g' "$SOURCE_FILE_P"
sed -i 's|//    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_p_float.txt");|    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_p_float.txt");|g' "$SOURCE_FILE_P"


g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 8 | 500x500 | float"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_float_500_500_1/matrix_float_1000_1000_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_float_500_500_2/matrix_float_1000_1000_2/g' "$SOURCE_FILE_P"

g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 8 | 1000x1000 | float"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_float_1000_1000_1/matrix_float_2000_2000_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_float_1000_1000_2/matrix_float_2000_2000_2/g' "$SOURCE_FILE_P"

g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 8 | 2000x2000 | float"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_float_2000_2000_1/matrix_float_500_500_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_float_2000_2000_2/matrix_float_500_500_2/g' "$SOURCE_FILE_P"


sed -i 's|//    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|g' "$SOURCE_FILE_P"
sed -i 's|//    auto matrixBFInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|    auto matrixBFInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|g' "$SOURCE_FILE_P"
sed -i 's|//    auto startInt = std::chrono::high_resolution_clock::now();|    auto startInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|//    auto resultInt = multiplyMatrixParallel(matrixAInt, matrixBFInt);|    auto resultInt = multiplyMatrixParallel(matrixAInt, matrixBFInt);|g' "$SOURCE_FILE_P"
sed -i 's|//    auto endInt = std::chrono::high_resolution_clock::now();|    auto endInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|//    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|g' "$SOURCE_FILE_P"
sed -i 's|//    std::cout << "Time (int): " << elapsedInt.count() << " ms" << std::endl;|    std::cout << "Time (int): " << elapsedInt.count() << " ms" << std::endl;|g' "$SOURCE_FILE_P"
sed -i 's|//    saveMatrix(resultInt, "../../../data/output/matrix_cpp_p_int.txt");|    saveMatrix(resultInt, "../../../data/output/matrix_cpp_p_int.txt");|g' "$SOURCE_FILE_P"

sed -i 's|    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|//    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|g' "$SOURCE_FILE_P"
sed -i 's|    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|//    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|g' "$SOURCE_FILE_P"
sed -i 's|    auto startFloat = std::chrono::high_resolution_clock::now();|//    auto startFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|    auto resultFloat = multiplyMatrixParallel(matrixAFloat, matrixBFloat);|//    auto resultFloat = multiplyMatrixParallel(matrixAFloat, matrixBFloat);|g' "$SOURCE_FILE_P"
sed -i 's|    auto endFloat = std::chrono::high_resolution_clock::now();|//    auto endFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|//    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|g' "$SOURCE_FILE_P"
sed -i 's|    std::cout << "Time (float): " << elapsedFloat.count() << " ms" << std::endl;|//    std::cout << "Time (float): " << elapsedFloat.count() << " ms" << std::endl;|g' "$SOURCE_FILE_P"
sed -i 's|    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_p_float.txt");|//    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_p_float.txt");|g' "$SOURCE_FILE_P"

echo































sed -i 's|    int numThreads = 8;|    int numThreads = 16;|g' "$SOURCE_FILE_P"

g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 16 | 500x500 | int"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_int_500_500_1/matrix_int_1000_1000_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_int_500_500_2/matrix_int_1000_1000_2/g' "$SOURCE_FILE_P"

g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 16 | 1000x1000 | int"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_int_1000_1000_1/matrix_int_2000_2000_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_int_1000_1000_2/matrix_int_2000_2000_2/g' "$SOURCE_FILE_P"

g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 16 | 2000x2000 | int"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_int_2000_2000_1/matrix_int_500_500_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_int_2000_2000_2/matrix_int_500_500_2/g' "$SOURCE_FILE_P"

echo



sed -i 's|    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|//    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|g' "$SOURCE_FILE_P"
sed -i 's|    auto matrixBFInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|//    auto matrixBFInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|g' "$SOURCE_FILE_P"
sed -i 's|    auto startInt = std::chrono::high_resolution_clock::now();|//    auto startInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|    auto resultInt = multiplyMatrixParallel(matrixAInt, matrixBFInt);|//    auto resultInt = multiplyMatrixParallel(matrixAInt, matrixBFInt);|g' "$SOURCE_FILE_P"
sed -i 's|    auto endInt = std::chrono::high_resolution_clock::now();|//    auto endInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|//    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|g' "$SOURCE_FILE_P"
sed -i 's|    std::cout << "Time (int): " << elapsedInt.count() << " ms" << std::endl;|//    std::cout << "Time (int): " << elapsedInt.count() << " ms" << std::endl;|g' "$SOURCE_FILE_P"
sed -i 's|    saveMatrix(resultInt, "../../../data/output/matrix_cpp_p_int.txt");|//    saveMatrix(resultInt, "../../../data/output/matrix_cpp_p_int.txt");|g' "$SOURCE_FILE_P"

sed -i 's|//    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|g' "$SOURCE_FILE_P"
sed -i 's|//    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|g' "$SOURCE_FILE_P"
sed -i 's|//    auto startFloat = std::chrono::high_resolution_clock::now();|    auto startFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|//    auto resultFloat = multiplyMatrixParallel(matrixAFloat, matrixBFloat);|    auto resultFloat = multiplyMatrixParallel(matrixAFloat, matrixBFloat);|g' "$SOURCE_FILE_P"
sed -i 's|//    auto endFloat = std::chrono::high_resolution_clock::now();|    auto endFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|//    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|g' "$SOURCE_FILE_P"
sed -i 's|//    std::cout << "Time (float): " << elapsedFloat.count() << " ms" << std::endl;|    std::cout << "Time (float): " << elapsedFloat.count() << " ms" << std::endl;|g' "$SOURCE_FILE_P"
sed -i 's|//    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_p_float.txt");|    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_p_float.txt");|g' "$SOURCE_FILE_P"


g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 16 | 500x500 | float"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_float_500_500_1/matrix_float_1000_1000_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_float_500_500_2/matrix_float_1000_1000_2/g' "$SOURCE_FILE_P"

g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 16 | 1000x1000 | float"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_float_1000_1000_1/matrix_float_2000_2000_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_float_1000_1000_2/matrix_float_2000_2000_2/g' "$SOURCE_FILE_P"

g++ "$SOURCE_FILE_P" -o "$OUTPUT_FILE_P"
cd ../src/cpp/parallel || exit

echo "C++ | parallel | 16 | 2000x2000 | float"
./main.o

cd ../../../run/ || exit

sed -i 's/matrix_float_2000_2000_1/matrix_float_500_500_1/g' "$SOURCE_FILE_P"
sed -i 's/matrix_float_2000_2000_2/matrix_float_500_500_2/g' "$SOURCE_FILE_P"


sed -i 's|//    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|g' "$SOURCE_FILE_P"
sed -i 's|//    auto matrixBFInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|    auto matrixBFInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|g' "$SOURCE_FILE_P"
sed -i 's|//    auto startInt = std::chrono::high_resolution_clock::now();|    auto startInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|//    auto resultInt = multiplyMatrixParallel(matrixAInt, matrixBFInt);|    auto resultInt = multiplyMatrixParallel(matrixAInt, matrixBFInt);|g' "$SOURCE_FILE_P"
sed -i 's|//    auto endInt = std::chrono::high_resolution_clock::now();|    auto endInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|//    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|g' "$SOURCE_FILE_P"
sed -i 's|//    std::cout << "Time (int): " << elapsedInt.count() << " ms" << std::endl;|    std::cout << "Time (int): " << elapsedInt.count() << " ms" << std::endl;|g' "$SOURCE_FILE_P"
sed -i 's|//    saveMatrix(resultInt, "../../../data/output/matrix_cpp_p_int.txt");|    saveMatrix(resultInt, "../../../data/output/matrix_cpp_p_int.txt");|g' "$SOURCE_FILE_P"

sed -i 's|    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|//    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|g' "$SOURCE_FILE_P"
sed -i 's|    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|//    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|g' "$SOURCE_FILE_P"
sed -i 's|    auto startFloat = std::chrono::high_resolution_clock::now();|//    auto startFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|    auto resultFloat = multiplyMatrixParallel(matrixAFloat, matrixBFloat);|//    auto resultFloat = multiplyMatrixParallel(matrixAFloat, matrixBFloat);|g' "$SOURCE_FILE_P"
sed -i 's|    auto endFloat = std::chrono::high_resolution_clock::now();|//    auto endFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE_P"
sed -i 's|    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|//    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|g' "$SOURCE_FILE_P"
sed -i 's|    std::cout << "Time (float): " << elapsedFloat.count() << " ms" << std::endl;|//    std::cout << "Time (float): " << elapsedFloat.count() << " ms" << std::endl;|g' "$SOURCE_FILE_P"
sed -i 's|    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_p_float.txt");|//    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_p_float.txt");|g' "$SOURCE_FILE_P"

sed -i 's|    int numThreads = 16;|    int numThreads = 2;|g' "$SOURCE_FILE_P"