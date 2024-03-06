#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

SOURCE_FILE="$SCRIPT_DIR/../src/cpp/sequential/main.cpp"

OUTPUT_FILE="$SCRIPT_DIR/../src/cpp/sequential/main.o"

g++ -O1 "$SOURCE_FILE" -o "$OUTPUT_FILE"

cd ../src/cpp/sequential || exit

echo "C++ | sequential | 500x500 | int | O1"
./main.o


cd ../../../run/ || exit

sed -i 's/matrix_int_500_500_1/matrix_int_1000_1000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_500_500_2/matrix_int_1000_1000_2/g' "$SOURCE_FILE"

g++ -O1 "$SOURCE_FILE" -o "$OUTPUT_FILE"

cd ../src/cpp/sequential || exit

echo "C++ | sequential | 1000x1000 | int | O1"
./main.o


cd ../../../run/ || exit

sed -i 's/matrix_int_1000_1000_1/matrix_int_2000_2000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_1000_1000_2/matrix_int_2000_2000_2/g' "$SOURCE_FILE"

g++ -O1 "$SOURCE_FILE" -o "$OUTPUT_FILE"

cd ../src/cpp/sequential || exit

echo "C++ | sequential | 2000x2000 | int | O1"
./main.o


cd ../../../run/ || exit

sed -i 's/matrix_int_2000_2000_1/matrix_int_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_2000_2000_2/matrix_int_500_500_2/g' "$SOURCE_FILE"

echo




sed -i 's|auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|//    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|g' "$SOURCE_FILE"
sed -i 's|auto matrixBInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|//    auto matrixBInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|g' "$SOURCE_FILE"
sed -i 's|auto startInt = std::chrono::high_resolution_clock::now();|//    auto startInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|auto resultInt = multiplyMatrix(matrixAInt, matrixBInt);|//    auto resultInt = multiplyMatrix(matrixAInt, matrixBInt);|g' "$SOURCE_FILE"
sed -i 's|auto endInt = std::chrono::high_resolution_clock::now();|//    auto endInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|//    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|g' "$SOURCE_FILE"
sed -i 's|std::cout << "Time (int) : " << elapsedInt.count() << " ms" << std::endl;|//    std::cout << "Time (int) : " << elapsedInt.count() << " ms" << std::endl;|g' "$SOURCE_FILE"
sed -i 's|saveMatrix(resultInt, "../../../data/output/matrix_cpp_int.txt");|//    saveMatrix(resultInt, "../../../data/output/matrix_cpp_int.txt");|g' "$SOURCE_FILE"

sed -i 's|//    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|g' "$SOURCE_FILE"
sed -i 's|//    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|g' "$SOURCE_FILE"
sed -i 's|//    auto startFloat = std::chrono::high_resolution_clock::now();|auto startFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|//    auto resultFloat = multiplyMatrix(matrixAFloat, matrixBFloat);|auto resultFloat = multiplyMatrix(matrixAFloat, matrixBFloat);|g' "$SOURCE_FILE"
sed -i 's|//    auto endFloat = std::chrono::high_resolution_clock::now();|auto endFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|//    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|g' "$SOURCE_FILE"
sed -i 's|//    std::cout << "Time (float) : " << elapsedFloat.count() << " ms" << std::endl;|std::cout << "Time (float) : " << elapsedFloat.count() << " ms" << std::endl;|g' "$SOURCE_FILE"
sed -i 's|//    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_float.txt");|saveMatrix(resultFloat, "../../../data/output/matrix_cpp_float.txt");|g' "$SOURCE_FILE"


g++ -O1 "$SOURCE_FILE" -o "$OUTPUT_FILE"

cd ../src/cpp/sequential || exit

echo "C++ | sequential | 500x500 | float | O1"
./main.o


cd ../../../run/ || exit

sed -i 's/matrix_float_500_500_1/matrix_float_1000_1000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_500_500_2/matrix_float_1000_1000_2/g' "$SOURCE_FILE"

g++ -O1 "$SOURCE_FILE" -o "$OUTPUT_FILE"

cd ../src/cpp/sequential || exit

echo "C++ | sequential | 1000x1000 | float | O1"
./main.o


cd ../../../run/ || exit

sed -i 's/matrix_float_1000_1000_1/matrix_float_2000_2000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_1000_1000_2/matrix_float_2000_2000_2/g' "$SOURCE_FILE"

g++ -O1 "$SOURCE_FILE" -o "$OUTPUT_FILE"

cd ../src/cpp/sequential || exit

echo "C++ | sequential | 2000x2000 | float | O1"
./main.o


cd ../../../run/ || exit

sed -i 's/matrix_float_2000_2000_1/matrix_float_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_2000_2000_2/matrix_float_500_500_2/g' "$SOURCE_FILE"




sed -i 's|//    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|g' "$SOURCE_FILE"
sed -i 's|//    auto matrixBInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|auto matrixBInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|g' "$SOURCE_FILE"
sed -i 's|//    auto startInt = std::chrono::high_resolution_clock::now();|auto startInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|//    auto resultInt = multiplyMatrix(matrixAInt, matrixBInt);|auto resultInt = multiplyMatrix(matrixAInt, matrixBInt);|g' "$SOURCE_FILE"
sed -i 's|//    auto endInt = std::chrono::high_resolution_clock::now();|auto endInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|//    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|g' "$SOURCE_FILE"
sed -i 's|//    std::cout << "Time (int) : " << elapsedInt.count() << " ms" << std::endl;|std::cout << "Time (int) : " << elapsedInt.count() << " ms" << std::endl;|g' "$SOURCE_FILE"
sed -i 's|//    saveMatrix(resultInt, "../../../data/output/matrix_cpp_int.txt");|saveMatrix(resultInt, "../../../data/output/matrix_cpp_int.txt");|g' "$SOURCE_FILE"

sed -i 's|auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|//    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|g' "$SOURCE_FILE"
sed -i 's|auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|//    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|g' "$SOURCE_FILE"
sed -i 's|auto startFloat = std::chrono::high_resolution_clock::now();|//    auto startFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|auto resultFloat = multiplyMatrix(matrixAFloat, matrixBFloat);|//    auto resultFloat = multiplyMatrix(matrixAFloat, matrixBFloat);|g' "$SOURCE_FILE"
sed -i 's|auto endFloat = std::chrono::high_resolution_clock::now();|//    auto endFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|//    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|g' "$SOURCE_FILE"
sed -i 's|std::cout << "Time (float) : " << elapsedFloat.count() << " ms" << std::endl;|//    std::cout << "Time (float) : " << elapsedFloat.count() << " ms" << std::endl;|g' "$SOURCE_FILE"
sed -i 's|saveMatrix(resultFloat, "../../../data/output/matrix_cpp_float.txt");|//    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_float.txt");|g' "$SOURCE_FILE"




















echo

g++ -O2 "$SOURCE_FILE" -o "$OUTPUT_FILE"

cd ../src/cpp/sequential || exit

echo "C++ | sequential | 500x500 | int | O2"
./main.o


cd ../../../run/ || exit

sed -i 's/matrix_int_500_500_1/matrix_int_1000_1000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_500_500_2/matrix_int_1000_1000_2/g' "$SOURCE_FILE"

g++ -O2 "$SOURCE_FILE" -o "$OUTPUT_FILE"

cd ../src/cpp/sequential || exit

echo "C++ | sequential | 1000x1000 | int | O2"
./main.o


cd ../../../run/ || exit

sed -i 's/matrix_int_1000_1000_1/matrix_int_2000_2000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_1000_1000_2/matrix_int_2000_2000_2/g' "$SOURCE_FILE"

g++ -O2 "$SOURCE_FILE" -o "$OUTPUT_FILE"

cd ../src/cpp/sequential || exit

echo "C++ | sequential | 2000x2000 | int | O2"
./main.o


cd ../../../run/ || exit

sed -i 's/matrix_int_2000_2000_1/matrix_int_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_2000_2000_2/matrix_int_500_500_2/g' "$SOURCE_FILE"

echo




sed -i 's|auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|//    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|g' "$SOURCE_FILE"
sed -i 's|auto matrixBInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|//    auto matrixBInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|g' "$SOURCE_FILE"
sed -i 's|auto startInt = std::chrono::high_resolution_clock::now();|//    auto startInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|auto resultInt = multiplyMatrix(matrixAInt, matrixBInt);|//    auto resultInt = multiplyMatrix(matrixAInt, matrixBInt);|g' "$SOURCE_FILE"
sed -i 's|auto endInt = std::chrono::high_resolution_clock::now();|//    auto endInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|//    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|g' "$SOURCE_FILE"
sed -i 's|std::cout << "Time (int) : " << elapsedInt.count() << " ms" << std::endl;|//    std::cout << "Time (int) : " << elapsedInt.count() << " ms" << std::endl;|g' "$SOURCE_FILE"
sed -i 's|saveMatrix(resultInt, "../../../data/output/matrix_cpp_int.txt");|//    saveMatrix(resultInt, "../../../data/output/matrix_cpp_int.txt");|g' "$SOURCE_FILE"

sed -i 's|//    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|g' "$SOURCE_FILE"
sed -i 's|//    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|g' "$SOURCE_FILE"
sed -i 's|//    auto startFloat = std::chrono::high_resolution_clock::now();|auto startFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|//    auto resultFloat = multiplyMatrix(matrixAFloat, matrixBFloat);|auto resultFloat = multiplyMatrix(matrixAFloat, matrixBFloat);|g' "$SOURCE_FILE"
sed -i 's|//    auto endFloat = std::chrono::high_resolution_clock::now();|auto endFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|//    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|g' "$SOURCE_FILE"
sed -i 's|//    std::cout << "Time (float) : " << elapsedFloat.count() << " ms" << std::endl;|std::cout << "Time (float) : " << elapsedFloat.count() << " ms" << std::endl;|g' "$SOURCE_FILE"
sed -i 's|//    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_float.txt");|saveMatrix(resultFloat, "../../../data/output/matrix_cpp_float.txt");|g' "$SOURCE_FILE"


g++ -O2 "$SOURCE_FILE" -o "$OUTPUT_FILE"

cd ../src/cpp/sequential || exit

echo "C++ | sequential | 500x500 | float | O2"
./main.o


cd ../../../run/ || exit

sed -i 's/matrix_float_500_500_1/matrix_float_1000_1000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_500_500_2/matrix_float_1000_1000_2/g' "$SOURCE_FILE"

g++ -O2 "$SOURCE_FILE" -o "$OUTPUT_FILE"

cd ../src/cpp/sequential || exit

echo "C++ | sequential | 1000x1000 | float | O2"
./main.o


cd ../../../run/ || exit

sed -i 's/matrix_float_1000_1000_1/matrix_float_2000_2000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_1000_1000_2/matrix_float_2000_2000_2/g' "$SOURCE_FILE"

g++ -O2 "$SOURCE_FILE" -o "$OUTPUT_FILE"

cd ../src/cpp/sequential || exit

echo "C++ | sequential | 2000x2000 | float | O2"
./main.o


cd ../../../run/ || exit

sed -i 's/matrix_float_2000_2000_1/matrix_float_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_2000_2000_2/matrix_float_500_500_2/g' "$SOURCE_FILE"




sed -i 's|//    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|g' "$SOURCE_FILE"
sed -i 's|//    auto matrixBInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|auto matrixBInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|g' "$SOURCE_FILE"
sed -i 's|//    auto startInt = std::chrono::high_resolution_clock::now();|auto startInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|//    auto resultInt = multiplyMatrix(matrixAInt, matrixBInt);|auto resultInt = multiplyMatrix(matrixAInt, matrixBInt);|g' "$SOURCE_FILE"
sed -i 's|//    auto endInt = std::chrono::high_resolution_clock::now();|auto endInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|//    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|g' "$SOURCE_FILE"
sed -i 's|//    std::cout << "Time (int) : " << elapsedInt.count() << " ms" << std::endl;|std::cout << "Time (int) : " << elapsedInt.count() << " ms" << std::endl;|g' "$SOURCE_FILE"
sed -i 's|//    saveMatrix(resultInt, "../../../data/output/matrix_cpp_int.txt");|saveMatrix(resultInt, "../../../data/output/matrix_cpp_int.txt");|g' "$SOURCE_FILE"

sed -i 's|auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|//    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|g' "$SOURCE_FILE"
sed -i 's|auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|//    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|g' "$SOURCE_FILE"
sed -i 's|auto startFloat = std::chrono::high_resolution_clock::now();|//    auto startFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|auto resultFloat = multiplyMatrix(matrixAFloat, matrixBFloat);|//    auto resultFloat = multiplyMatrix(matrixAFloat, matrixBFloat);|g' "$SOURCE_FILE"
sed -i 's|auto endFloat = std::chrono::high_resolution_clock::now();|//    auto endFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|//    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|g' "$SOURCE_FILE"
sed -i 's|std::cout << "Time (float) : " << elapsedFloat.count() << " ms" << std::endl;|//    std::cout << "Time (float) : " << elapsedFloat.count() << " ms" << std::endl;|g' "$SOURCE_FILE"
sed -i 's|saveMatrix(resultFloat, "../../../data/output/matrix_cpp_float.txt");|//    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_float.txt");|g' "$SOURCE_FILE"



























echo

g++ -O3 "$SOURCE_FILE" -o "$OUTPUT_FILE"

cd ../src/cpp/sequential || exit

echo "C++ | sequential | 500x500 | int | O3"
./main.o


cd ../../../run/ || exit

sed -i 's/matrix_int_500_500_1/matrix_int_1000_1000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_500_500_2/matrix_int_1000_1000_2/g' "$SOURCE_FILE"

g++ -O3 "$SOURCE_FILE" -o "$OUTPUT_FILE"

cd ../src/cpp/sequential || exit

echo "C++ | sequential | 1000x1000 | int | O3"
./main.o


cd ../../../run/ || exit

sed -i 's/matrix_int_1000_1000_1/matrix_int_2000_2000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_1000_1000_2/matrix_int_2000_2000_2/g' "$SOURCE_FILE"

g++ -O3 "$SOURCE_FILE" -o "$OUTPUT_FILE"

cd ../src/cpp/sequential || exit

echo "C++ | sequential | 2000x2000 | int | O3"
./main.o


cd ../../../run/ || exit

sed -i 's/matrix_int_2000_2000_1/matrix_int_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_2000_2000_2/matrix_int_500_500_2/g' "$SOURCE_FILE"

echo




sed -i 's|auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|//    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|g' "$SOURCE_FILE"
sed -i 's|auto matrixBInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|//    auto matrixBInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|g' "$SOURCE_FILE"
sed -i 's|auto startInt = std::chrono::high_resolution_clock::now();|//    auto startInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|auto resultInt = multiplyMatrix(matrixAInt, matrixBInt);|//    auto resultInt = multiplyMatrix(matrixAInt, matrixBInt);|g' "$SOURCE_FILE"
sed -i 's|auto endInt = std::chrono::high_resolution_clock::now();|//    auto endInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|//    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|g' "$SOURCE_FILE"
sed -i 's|std::cout << "Time (int) : " << elapsedInt.count() << " ms" << std::endl;|//    std::cout << "Time (int) : " << elapsedInt.count() << " ms" << std::endl;|g' "$SOURCE_FILE"
sed -i 's|saveMatrix(resultInt, "../../../data/output/matrix_cpp_int.txt");|//    saveMatrix(resultInt, "../../../data/output/matrix_cpp_int.txt");|g' "$SOURCE_FILE"

sed -i 's|//    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|g' "$SOURCE_FILE"
sed -i 's|//    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|g' "$SOURCE_FILE"
sed -i 's|//    auto startFloat = std::chrono::high_resolution_clock::now();|auto startFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|//    auto resultFloat = multiplyMatrix(matrixAFloat, matrixBFloat);|auto resultFloat = multiplyMatrix(matrixAFloat, matrixBFloat);|g' "$SOURCE_FILE"
sed -i 's|//    auto endFloat = std::chrono::high_resolution_clock::now();|auto endFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|//    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|g' "$SOURCE_FILE"
sed -i 's|//    std::cout << "Time (float) : " << elapsedFloat.count() << " ms" << std::endl;|std::cout << "Time (float) : " << elapsedFloat.count() << " ms" << std::endl;|g' "$SOURCE_FILE"
sed -i 's|//    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_float.txt");|saveMatrix(resultFloat, "../../../data/output/matrix_cpp_float.txt");|g' "$SOURCE_FILE"


g++ -O3 "$SOURCE_FILE" -o "$OUTPUT_FILE"

cd ../src/cpp/sequential || exit

echo "C++ | sequential | 500x500 | float | O3"
./main.o


cd ../../../run/ || exit

sed -i 's/matrix_float_500_500_1/matrix_float_1000_1000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_500_500_2/matrix_float_1000_1000_2/g' "$SOURCE_FILE"

g++ -O3 "$SOURCE_FILE" -o "$OUTPUT_FILE"

cd ../src/cpp/sequential || exit

echo "C++ | sequential | 1000x1000 | float | O3"
./main.o


cd ../../../run/ || exit

sed -i 's/matrix_float_1000_1000_1/matrix_float_2000_2000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_1000_1000_2/matrix_float_2000_2000_2/g' "$SOURCE_FILE"

g++ -O3 "$SOURCE_FILE" -o "$OUTPUT_FILE"

cd ../src/cpp/sequential || exit

echo "C++ | sequential | 2000x2000 | float | O3"
./main.o


cd ../../../run/ || exit

sed -i 's/matrix_float_2000_2000_1/matrix_float_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_2000_2000_2/matrix_float_500_500_2/g' "$SOURCE_FILE"




sed -i 's|//    auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|auto matrixAInt = readMatrix<int>("../../../data/input/matrix_int_500_500_1.txt");|g' "$SOURCE_FILE"
sed -i 's|//    auto matrixBInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|auto matrixBInt = readMatrix<int>("../../../data/input/matrix_int_500_500_2.txt");|g' "$SOURCE_FILE"
sed -i 's|//    auto startInt = std::chrono::high_resolution_clock::now();|auto startInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|//    auto resultInt = multiplyMatrix(matrixAInt, matrixBInt);|auto resultInt = multiplyMatrix(matrixAInt, matrixBInt);|g' "$SOURCE_FILE"
sed -i 's|//    auto endInt = std::chrono::high_resolution_clock::now();|auto endInt = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|//    auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|auto elapsedInt = std::chrono::duration_cast<std::chrono::milliseconds>(endInt - startInt);|g' "$SOURCE_FILE"
sed -i 's|//    std::cout << "Time (int) : " << elapsedInt.count() << " ms" << std::endl;|std::cout << "Time (int) : " << elapsedInt.count() << " ms" << std::endl;|g' "$SOURCE_FILE"
sed -i 's|//    saveMatrix(resultInt, "../../../data/output/matrix_cpp_int.txt");|saveMatrix(resultInt, "../../../data/output/matrix_cpp_int.txt");|g' "$SOURCE_FILE"

sed -i 's|auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|//    auto matrixAFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_1.txt");|g' "$SOURCE_FILE"
sed -i 's|auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|//    auto matrixBFloat = readMatrix<float>("../../../data/input/matrix_float_500_500_2.txt");|g' "$SOURCE_FILE"
sed -i 's|auto startFloat = std::chrono::high_resolution_clock::now();|//    auto startFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|auto resultFloat = multiplyMatrix(matrixAFloat, matrixBFloat);|//    auto resultFloat = multiplyMatrix(matrixAFloat, matrixBFloat);|g' "$SOURCE_FILE"
sed -i 's|auto endFloat = std::chrono::high_resolution_clock::now();|//    auto endFloat = std::chrono::high_resolution_clock::now();|g' "$SOURCE_FILE"
sed -i 's|auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|//    auto elapsedFloat = std::chrono::duration_cast<std::chrono::milliseconds>(endFloat - startFloat);|g' "$SOURCE_FILE"
sed -i 's|std::cout << "Time (float) : " << elapsedFloat.count() << " ms" << std::endl;|//    std::cout << "Time (float) : " << elapsedFloat.count() << " ms" << std::endl;|g' "$SOURCE_FILE"
sed -i 's|saveMatrix(resultFloat, "../../../data/output/matrix_cpp_float.txt");|//    saveMatrix(resultFloat, "../../../data/output/matrix_cpp_float.txt");|g' "$SOURCE_FILE"