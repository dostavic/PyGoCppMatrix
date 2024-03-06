#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

SOURCE_FILE="$SCRIPT_DIR/../src/go/main.go"

#OUTPUT_FILE="$SCRIPT_DIR/../src/go/main"

cd ../src/go || exit
go build ./main.go

echo "Go | sequential | 500x500 | int"
./main

cd ../../run/ || exit

sed -i 's/matrix_int_500_500_1/matrix_int_1000_1000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_500_500_2/matrix_int_1000_1000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | sequential | 1000x1000 | int"
./main

cd ../../run/ || exit

sed -i 's/matrix_int_1000_1000_1/matrix_int_2000_2000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_1000_1000_2/matrix_int_2000_2000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | sequential | 2000x2000 | int"
./main

echo

cd ../../run/ || exit

sed -i 's/matrix_int_2000_2000_1/matrix_int_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_2000_2000_2/matrix_int_500_500_2/g' "$SOURCE_FILE"

sed -i 's|matrixAInt := ReadMatrix|//matrixAInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|matrixBInt := ReadMatrix|//matrixBInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|startTimeInt \:=|//startTimeInt \:=|g' "$SOURCE_FILE"
sed -i 's|resultInt := MultiplyMatrix(|//resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|endTimeInt := time|//endTimeInt := time|g' "$SOURCE_FILE"
sed -i 's|durationInt := endTimeInt|//durationInt := endTimeInt|g' "$SOURCE_FILE"
sed -i 's|WriteMatrix\[i|//WriteMatrix\[i|g' "$SOURCE_FILE"
sed -i 's|fmt.Println("Time (int):|//fmt.Println("Time (int):|g' "$SOURCE_FILE"

sed -i 's|//matrixAFloat := ReadMatrix|matrixAFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//matrixBFloat := ReadMatrix|matrixBFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//startTimeFloat \:=|startTimeFloat \:=|g' "$SOURCE_FILE"
sed -i 's|//resultFloat := MultiplyMatrix(|resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//endTimeFloat := time|endTimeFloat := time|g' "$SOURCE_FILE"
sed -i 's|//durationFloat := endTimeFloat|durationFloat := endTimeFloat|g' "$SOURCE_FILE"
sed -i 's|//WriteMatrix\[f|WriteMatrix\[f|g' "$SOURCE_FILE"
sed -i 's|//fmt.Println("Time (float64):|fmt.Println("Time (float64):|g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | sequential | 500x500 | float"
./main

cd ../../run/ || exit

sed -i 's/matrix_float_500_500_1/matrix_float_1000_1000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_500_500_2/matrix_float_1000_1000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | sequential | 1000x1000 | float"
./main

cd ../../run/ || exit

sed -i 's/matrix_float_1000_1000_1/matrix_float_2000_2000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_1000_1000_2/matrix_float_2000_2000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | sequential | 2000x2000 | float"
./main

cd ../../run/ || exit

sed -i 's/matrix_float_2000_2000_1/matrix_float_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_2000_2000_2/matrix_float_500_500_2/g' "$SOURCE_FILE"

sed -i 's|//matrixAInt := ReadMatrix|matrixAInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//matrixBInt := ReadMatrix|matrixBInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//startTimeInt \:=|startTimeInt \:=|g' "$SOURCE_FILE"
sed -i 's|//resultInt := MultiplyMatrix(|resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//endTimeInt := time|endTimeInt := time|g' "$SOURCE_FILE"
sed -i 's|//durationInt := endTimeInt|durationInt := endTimeInt|g' "$SOURCE_FILE"
sed -i 's|//WriteMatrix\[i|WriteMatrix\[i|g' "$SOURCE_FILE"
sed -i 's|//fmt.Println("Time (int):|fmt.Println("Time (int):|g' "$SOURCE_FILE"

sed -i 's|matrixAFloat := ReadMatrix|//matrixAFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|matrixBFloat := ReadMatrix|//matrixBFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|startTimeFloat \:=|//startTimeFloat \:=|g' "$SOURCE_FILE"
sed -i 's|resultFloat := MultiplyMatrix(|//resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|endTimeFloat := time|//endTimeFloat := time|g' "$SOURCE_FILE"
sed -i 's|durationFloat := endTimeFloat|//durationFloat := endTimeFloat|g' "$SOURCE_FILE"
sed -i 's|WriteMatrix\[f|//WriteMatrix\[f|g' "$SOURCE_FILE"
sed -i 's|fmt.Println("Time (float64):|//fmt.Println("Time (float64):|g' "$SOURCE_FILE"

echo




sed -i 's|resultInt := MultiplyMatrix(|//resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//resultInt := MultiplyMatrixParallel\[|resultInt := MultiplyMatrixParallel\[|g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 500x500 | int"
./main

cd ../../run/ || exit

sed -i 's/matrix_int_500_500_1/matrix_int_1000_1000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_500_500_2/matrix_int_1000_1000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 1000x1000 | int"
./main

cd ../../run/ || exit

sed -i 's/matrix_int_1000_1000_1/matrix_int_2000_2000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_1000_1000_2/matrix_int_2000_2000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 2000x2000 | int"
./main

cd ../../run/ || exit

sed -i 's/matrix_int_2000_2000_1/matrix_int_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_2000_2000_2/matrix_int_500_500_2/g' "$SOURCE_FILE"

sed -i 's|//resultInt := MultiplyMatrix(|resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|resultInt := MultiplyMatrixParallel\[|//resultInt := MultiplyMatrixParallel\[|g' "$SOURCE_FILE"

echo

sed -i 's|matrixAInt := ReadMatrix|//matrixAInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|matrixBInt := ReadMatrix|//matrixBInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|startTimeInt \:=|//startTimeInt \:=|g' "$SOURCE_FILE"
sed -i 's|resultInt := MultiplyMatrix(|//resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|endTimeInt := time|//endTimeInt := time|g' "$SOURCE_FILE"
sed -i 's|durationInt := endTimeInt|//durationInt := endTimeInt|g' "$SOURCE_FILE"
sed -i 's|WriteMatrix\[i|//WriteMatrix\[i|g' "$SOURCE_FILE"
sed -i 's|fmt.Println("Time (int):|//fmt.Println("Time (int):|g' "$SOURCE_FILE"

sed -i 's|//matrixAFloat := ReadMatrix|matrixAFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//matrixBFloat := ReadMatrix|matrixBFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//startTimeFloat \:=|startTimeFloat \:=|g' "$SOURCE_FILE"
sed -i 's|//resultFloat := MultiplyMatrix(|resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//endTimeFloat := time|endTimeFloat := time|g' "$SOURCE_FILE"
sed -i 's|//durationFloat := endTimeFloat|durationFloat := endTimeFloat|g' "$SOURCE_FILE"
sed -i 's|//WriteMatrix\[f|WriteMatrix\[f|g' "$SOURCE_FILE"
sed -i 's|//fmt.Println("Time (float64):|fmt.Println("Time (float64):|g' "$SOURCE_FILE"

sed -i 's|resultFloat := MultiplyMatrix(|//resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//resultFloat := MultiplyMatrixParallel\[|resultFloat := MultiplyMatrixParallel\[|g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 500x500 | float"
./main

cd ../../run/ || exit

sed -i 's/matrix_float_500_500_1/matrix_float_1000_1000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_500_500_2/matrix_float_1000_1000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 1000x1000 | float"
./main

cd ../../run/ || exit

sed -i 's/matrix_float_1000_1000_1/matrix_float_2000_2000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_1000_1000_2/matrix_float_2000_2000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 2000x2000 | float"
./main

cd ../../run/ || exit

sed -i 's/matrix_float_2000_2000_1/matrix_float_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_2000_2000_2/matrix_float_500_500_2/g' "$SOURCE_FILE"

sed -i 's|//resultFloat := MultiplyMatrix(|resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|resultFloat := MultiplyMatrixParallel\[|//resultFloat := MultiplyMatrixParallel\[|g' "$SOURCE_FILE"

sed -i 's|//matrixAInt := ReadMatrix|matrixAInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//matrixBInt := ReadMatrix|matrixBInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//startTimeInt \:=|startTimeInt \:=|g' "$SOURCE_FILE"
sed -i 's|//resultInt := MultiplyMatrix(|resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//endTimeInt := time|endTimeInt := time|g' "$SOURCE_FILE"
sed -i 's|//durationInt := endTimeInt|durationInt := endTimeInt|g' "$SOURCE_FILE"
sed -i 's|//WriteMatrix\[i|WriteMatrix\[i|g' "$SOURCE_FILE"
sed -i 's|//fmt.Println("Time (int):|fmt.Println("Time (int):|g' "$SOURCE_FILE"

sed -i 's|matrixAFloat := ReadMatrix|//matrixAFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|matrixBFloat := ReadMatrix|//matrixBFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|startTimeFloat \:=|//startTimeFloat \:=|g' "$SOURCE_FILE"
sed -i 's|resultFloat := MultiplyMatrix(|//resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|endTimeFloat := time|//endTimeFloat := time|g' "$SOURCE_FILE"
sed -i 's|durationFloat := endTimeFloat|//durationFloat := endTimeFloat|g' "$SOURCE_FILE"
sed -i 's|WriteMatrix\[f|//WriteMatrix\[f|g' "$SOURCE_FILE"
sed -i 's|fmt.Println("Time (float64):|//fmt.Println("Time (float64):|g' "$SOURCE_FILE"

echo




























sed -i 's|resultInt := MultiplyMatrix(|//resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//resultInt := MultiplyMatrixParallelN|resultInt := MultiplyMatrixParallelN|g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 2 | 500x500 | int"
./main

cd ../../run/ || exit

sed -i 's/matrix_int_500_500_1/matrix_int_1000_1000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_500_500_2/matrix_int_1000_1000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 2 | 1000x1000 | int"
./main

cd ../../run/ || exit

sed -i 's/matrix_int_1000_1000_1/matrix_int_2000_2000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_1000_1000_2/matrix_int_2000_2000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 2 | 2000x2000 | int"
./main

cd ../../run/ || exit

sed -i 's/matrix_int_2000_2000_1/matrix_int_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_2000_2000_2/matrix_int_500_500_2/g' "$SOURCE_FILE"

sed -i 's|//resultInt := MultiplyMatrix(|resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|resultInt := MultiplyMatrixParallelN|//resultInt := MultiplyMatrixParallelN|g' "$SOURCE_FILE"

echo


sed -i 's|matrixAInt := ReadMatrix|//matrixAInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|matrixBInt := ReadMatrix|//matrixBInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|startTimeInt \:=|//startTimeInt \:=|g' "$SOURCE_FILE"
sed -i 's|resultInt := MultiplyMatrix(|//resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|endTimeInt := time|//endTimeInt := time|g' "$SOURCE_FILE"
sed -i 's|durationInt := endTimeInt|//durationInt := endTimeInt|g' "$SOURCE_FILE"
sed -i 's|WriteMatrix\[i|//WriteMatrix\[i|g' "$SOURCE_FILE"
sed -i 's|fmt.Println("Time (int):|//fmt.Println("Time (int):|g' "$SOURCE_FILE"

sed -i 's|//matrixAFloat := ReadMatrix|matrixAFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//matrixBFloat := ReadMatrix|matrixBFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//startTimeFloat \:=|startTimeFloat \:=|g' "$SOURCE_FILE"
sed -i 's|//resultFloat := MultiplyMatrix(|resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//endTimeFloat := time|endTimeFloat := time|g' "$SOURCE_FILE"
sed -i 's|//durationFloat := endTimeFloat|durationFloat := endTimeFloat|g' "$SOURCE_FILE"
sed -i 's|//WriteMatrix\[f|WriteMatrix\[f|g' "$SOURCE_FILE"
sed -i 's|//fmt.Println("Time (float64):|fmt.Println("Time (float64):|g' "$SOURCE_FILE"

sed -i 's|resultFloat := MultiplyMatrix(|//resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//resultFloat := MultiplyMatrixParallelN|resultFloat := MultiplyMatrixParallelN|g' "$SOURCE_FILE"


cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 2 | 500x500 | float"
./main

cd ../../run/ || exit

sed -i 's/matrix_float_500_500_1/matrix_float_1000_1000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_500_500_2/matrix_float_1000_1000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 2 | 1000x1000 | float"
./main

cd ../../run/ || exit

sed -i 's/matrix_float_1000_1000_1/matrix_float_2000_2000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_1000_1000_2/matrix_float_2000_2000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 2 | 2000x2000 | float"
./main

cd ../../run/ || exit

sed -i 's/matrix_float_2000_2000_1/matrix_float_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_2000_2000_2/matrix_float_500_500_2/g' "$SOURCE_FILE"

sed -i 's|//resultFloat := MultiplyMatrix(|resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|resultFloat := MultiplyMatrixParallelN|//resultFloat := MultiplyMatrixParallelN|g' "$SOURCE_FILE"

sed -i 's|//matrixAInt := ReadMatrix|matrixAInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//matrixBInt := ReadMatrix|matrixBInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//startTimeInt \:=|startTimeInt \:=|g' "$SOURCE_FILE"
sed -i 's|//resultInt := MultiplyMatrix(|resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//endTimeInt := time|endTimeInt := time|g' "$SOURCE_FILE"
sed -i 's|//durationInt := endTimeInt|durationInt := endTimeInt|g' "$SOURCE_FILE"
sed -i 's|//WriteMatrix\[i|WriteMatrix\[i|g' "$SOURCE_FILE"
sed -i 's|//fmt.Println("Time (int):|fmt.Println("Time (int):|g' "$SOURCE_FILE"

sed -i 's|matrixAFloat := ReadMatrix|//matrixAFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|matrixBFloat := ReadMatrix|//matrixBFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|startTimeFloat \:=|//startTimeFloat \:=|g' "$SOURCE_FILE"
sed -i 's|resultFloat := MultiplyMatrix(|//resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|endTimeFloat := time|//endTimeFloat := time|g' "$SOURCE_FILE"
sed -i 's|durationFloat := endTimeFloat|//durationFloat := endTimeFloat|g' "$SOURCE_FILE"
sed -i 's|WriteMatrix\[f|//WriteMatrix\[f|g' "$SOURCE_FILE"
sed -i 's|fmt.Println("Time (float64):|//fmt.Println("Time (float64):|g' "$SOURCE_FILE"

echo






















sed -i 's|resultInt := MultiplyMatrix(|//resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//resultInt := MultiplyMatrixParallelNum(matrixAInt, matrixBInt, 2|resultInt := MultiplyMatrixParallelNum(matrixAInt, matrixBInt, 4|g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 4 | 500x500 | int"
./main

cd ../../run/ || exit

sed -i 's/matrix_int_500_500_1/matrix_int_1000_1000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_500_500_2/matrix_int_1000_1000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 4 | 1000x1000 | int"
./main

cd ../../run/ || exit

sed -i 's/matrix_int_1000_1000_1/matrix_int_2000_2000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_1000_1000_2/matrix_int_2000_2000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 4 | 2000x2000 | int"
./main

cd ../../run/ || exit

sed -i 's/matrix_int_2000_2000_1/matrix_int_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_2000_2000_2/matrix_int_500_500_2/g' "$SOURCE_FILE"

sed -i 's|//resultInt := MultiplyMatrix(|resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|resultInt := MultiplyMatrixParallelNum(matrixAInt, matrixBInt, 4|//resultInt := MultiplyMatrixParallelNum(matrixAInt, matrixBInt, 2|g' "$SOURCE_FILE"

echo


sed -i 's|matrixAInt := ReadMatrix|//matrixAInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|matrixBInt := ReadMatrix|//matrixBInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|startTimeInt \:=|//startTimeInt \:=|g' "$SOURCE_FILE"
sed -i 's|resultInt := MultiplyMatrix(|//resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|endTimeInt := time|//endTimeInt := time|g' "$SOURCE_FILE"
sed -i 's|durationInt := endTimeInt|//durationInt := endTimeInt|g' "$SOURCE_FILE"
sed -i 's|WriteMatrix\[i|//WriteMatrix\[i|g' "$SOURCE_FILE"
sed -i 's|fmt.Println("Time (int):|//fmt.Println("Time (int):|g' "$SOURCE_FILE"

sed -i 's|//matrixAFloat := ReadMatrix|matrixAFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//matrixBFloat := ReadMatrix|matrixBFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//startTimeFloat \:=|startTimeFloat \:=|g' "$SOURCE_FILE"
sed -i 's|//resultFloat := MultiplyMatrix(|resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//endTimeFloat := time|endTimeFloat := time|g' "$SOURCE_FILE"
sed -i 's|//durationFloat := endTimeFloat|durationFloat := endTimeFloat|g' "$SOURCE_FILE"
sed -i 's|//WriteMatrix\[f|WriteMatrix\[f|g' "$SOURCE_FILE"
sed -i 's|//fmt.Println("Time (float64):|fmt.Println("Time (float64):|g' "$SOURCE_FILE"

sed -i 's|resultFloat := MultiplyMatrix(|//resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//resultFloat := MultiplyMatrixParallelNum(matrixAFloat, matrixBFloat, 2|resultFloat := MultiplyMatrixParallelNum(matrixAFloat, matrixBFloat, 4|g' "$SOURCE_FILE"


cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 4 | 500x500 | float"
./main

cd ../../run/ || exit

sed -i 's/matrix_float_500_500_1/matrix_float_1000_1000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_500_500_2/matrix_float_1000_1000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 4 | 1000x1000 | float"
./main

cd ../../run/ || exit

sed -i 's/matrix_float_1000_1000_1/matrix_float_2000_2000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_1000_1000_2/matrix_float_2000_2000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 4 | 2000x2000 | float"
./main

cd ../../run/ || exit

sed -i 's/matrix_float_2000_2000_1/matrix_float_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_2000_2000_2/matrix_float_500_500_2/g' "$SOURCE_FILE"

sed -i 's|//resultFloat := MultiplyMatrix(|resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|resultFloat := MultiplyMatrixParallelNum(matrixAFloat, matrixBFloat, 4|//resultFloat := MultiplyMatrixParallelNum(matrixAFloat, matrixBFloat, 2|g' "$SOURCE_FILE"

sed -i 's|//matrixAInt := ReadMatrix|matrixAInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//matrixBInt := ReadMatrix|matrixBInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//startTimeInt \:=|startTimeInt \:=|g' "$SOURCE_FILE"
sed -i 's|//resultInt := MultiplyMatrix(|resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//endTimeInt := time|endTimeInt := time|g' "$SOURCE_FILE"
sed -i 's|//durationInt := endTimeInt|durationInt := endTimeInt|g' "$SOURCE_FILE"
sed -i 's|//WriteMatrix\[i|WriteMatrix\[i|g' "$SOURCE_FILE"
sed -i 's|//fmt.Println("Time (int):|fmt.Println("Time (int):|g' "$SOURCE_FILE"

sed -i 's|matrixAFloat := ReadMatrix|//matrixAFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|matrixBFloat := ReadMatrix|//matrixBFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|startTimeFloat \:=|//startTimeFloat \:=|g' "$SOURCE_FILE"
sed -i 's|resultFloat := MultiplyMatrix(|//resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|endTimeFloat := time|//endTimeFloat := time|g' "$SOURCE_FILE"
sed -i 's|durationFloat := endTimeFloat|//durationFloat := endTimeFloat|g' "$SOURCE_FILE"
sed -i 's|WriteMatrix\[f|//WriteMatrix\[f|g' "$SOURCE_FILE"
sed -i 's|fmt.Println("Time (float64):|//fmt.Println("Time (float64):|g' "$SOURCE_FILE"

echo


























sed -i 's|resultInt := MultiplyMatrix(|//resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//resultInt := MultiplyMatrixParallelNum(matrixAInt, matrixBInt, 2|resultInt := MultiplyMatrixParallelNum(matrixAInt, matrixBInt, 8|g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 8 | 500x500 | int"
./main

cd ../../run/ || exit

sed -i 's/matrix_int_500_500_1/matrix_int_1000_1000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_500_500_2/matrix_int_1000_1000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 8 | 1000x1000 | int"
./main

cd ../../run/ || exit

sed -i 's/matrix_int_1000_1000_1/matrix_int_2000_2000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_1000_1000_2/matrix_int_2000_2000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 8 | 2000x2000 | int"
./main

cd ../../run/ || exit

sed -i 's/matrix_int_2000_2000_1/matrix_int_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_2000_2000_2/matrix_int_500_500_2/g' "$SOURCE_FILE"

sed -i 's|//resultInt := MultiplyMatrix(|resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|resultInt := MultiplyMatrixParallelNum(matrixAInt, matrixBInt, 8|//resultInt := MultiplyMatrixParallelNum(matrixAInt, matrixBInt, 2|g' "$SOURCE_FILE"

echo


sed -i 's|matrixAInt := ReadMatrix|//matrixAInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|matrixBInt := ReadMatrix|//matrixBInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|startTimeInt \:=|//startTimeInt \:=|g' "$SOURCE_FILE"
sed -i 's|resultInt := MultiplyMatrix(|//resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|endTimeInt := time|//endTimeInt := time|g' "$SOURCE_FILE"
sed -i 's|durationInt := endTimeInt|//durationInt := endTimeInt|g' "$SOURCE_FILE"
sed -i 's|WriteMatrix\[i|//WriteMatrix\[i|g' "$SOURCE_FILE"
sed -i 's|fmt.Println("Time (int):|//fmt.Println("Time (int):|g' "$SOURCE_FILE"

sed -i 's|//matrixAFloat := ReadMatrix|matrixAFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//matrixBFloat := ReadMatrix|matrixBFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//startTimeFloat \:=|startTimeFloat \:=|g' "$SOURCE_FILE"
sed -i 's|//resultFloat := MultiplyMatrix(|resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//endTimeFloat := time|endTimeFloat := time|g' "$SOURCE_FILE"
sed -i 's|//durationFloat := endTimeFloat|durationFloat := endTimeFloat|g' "$SOURCE_FILE"
sed -i 's|//WriteMatrix\[f|WriteMatrix\[f|g' "$SOURCE_FILE"
sed -i 's|//fmt.Println("Time (float64):|fmt.Println("Time (float64):|g' "$SOURCE_FILE"

sed -i 's|resultFloat := MultiplyMatrix(|//resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//resultFloat := MultiplyMatrixParallelNum(matrixAFloat, matrixBFloat, 2|resultFloat := MultiplyMatrixParallelNum(matrixAFloat, matrixBFloat, 8|g' "$SOURCE_FILE"


cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 8 | 500x500 | float"
./main

cd ../../run/ || exit

sed -i 's/matrix_float_500_500_1/matrix_float_1000_1000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_500_500_2/matrix_float_1000_1000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 8 | 1000x1000 | float"
./main

cd ../../run/ || exit

sed -i 's/matrix_float_1000_1000_1/matrix_float_2000_2000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_1000_1000_2/matrix_float_2000_2000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 8 | 2000x2000 | float"
./main

cd ../../run/ || exit

sed -i 's/matrix_float_2000_2000_1/matrix_float_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_2000_2000_2/matrix_float_500_500_2/g' "$SOURCE_FILE"

sed -i 's|//resultFloat := MultiplyMatrix(|resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|resultFloat := MultiplyMatrixParallelNum(matrixAFloat, matrixBFloat, 8|//resultFloat := MultiplyMatrixParallelNum(matrixAFloat, matrixBFloat, 2|g' "$SOURCE_FILE"

sed -i 's|//matrixAInt := ReadMatrix|matrixAInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//matrixBInt := ReadMatrix|matrixBInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//startTimeInt \:=|startTimeInt \:=|g' "$SOURCE_FILE"
sed -i 's|//resultInt := MultiplyMatrix(|resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//endTimeInt := time|endTimeInt := time|g' "$SOURCE_FILE"
sed -i 's|//durationInt := endTimeInt|durationInt := endTimeInt|g' "$SOURCE_FILE"
sed -i 's|//WriteMatrix\[i|WriteMatrix\[i|g' "$SOURCE_FILE"
sed -i 's|//fmt.Println("Time (int):|fmt.Println("Time (int):|g' "$SOURCE_FILE"

sed -i 's|matrixAFloat := ReadMatrix|//matrixAFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|matrixBFloat := ReadMatrix|//matrixBFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|startTimeFloat \:=|//startTimeFloat \:=|g' "$SOURCE_FILE"
sed -i 's|resultFloat := MultiplyMatrix(|//resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|endTimeFloat := time|//endTimeFloat := time|g' "$SOURCE_FILE"
sed -i 's|durationFloat := endTimeFloat|//durationFloat := endTimeFloat|g' "$SOURCE_FILE"
sed -i 's|WriteMatrix\[f|//WriteMatrix\[f|g' "$SOURCE_FILE"
sed -i 's|fmt.Println("Time (float64):|//fmt.Println("Time (float64):|g' "$SOURCE_FILE"

echo






















sed -i 's|resultInt := MultiplyMatrix(|//resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//resultInt := MultiplyMatrixParallelNum(matrixAInt, matrixBInt, 2|resultInt := MultiplyMatrixParallelNum(matrixAInt, matrixBInt, 16|g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 16 | 500x500 | int"
./main

cd ../../run/ || exit

sed -i 's/matrix_int_500_500_1/matrix_int_1000_1000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_500_500_2/matrix_int_1000_1000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 16 | 1000x1000 | int"
./main

cd ../../run/ || exit

sed -i 's/matrix_int_1000_1000_1/matrix_int_2000_2000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_1000_1000_2/matrix_int_2000_2000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 16 | 2000x2000 | int"
./main

cd ../../run/ || exit

sed -i 's/matrix_int_2000_2000_1/matrix_int_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_2000_2000_2/matrix_int_500_500_2/g' "$SOURCE_FILE"

sed -i 's|//resultInt := MultiplyMatrix(|resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|resultInt := MultiplyMatrixParallelNum(matrixAInt, matrixBInt, 16|//resultInt := MultiplyMatrixParallelNum(matrixAInt, matrixBInt, 2|g' "$SOURCE_FILE"

echo


sed -i 's|matrixAInt := ReadMatrix|//matrixAInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|matrixBInt := ReadMatrix|//matrixBInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|startTimeInt \:=|//startTimeInt \:=|g' "$SOURCE_FILE"
sed -i 's|resultInt := MultiplyMatrix(|//resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|endTimeInt := time|//endTimeInt := time|g' "$SOURCE_FILE"
sed -i 's|durationInt := endTimeInt|//durationInt := endTimeInt|g' "$SOURCE_FILE"
sed -i 's|WriteMatrix\[i|//WriteMatrix\[i|g' "$SOURCE_FILE"
sed -i 's|fmt.Println("Time (int):|//fmt.Println("Time (int):|g' "$SOURCE_FILE"

sed -i 's|//matrixAFloat := ReadMatrix|matrixAFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//matrixBFloat := ReadMatrix|matrixBFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//startTimeFloat \:=|startTimeFloat \:=|g' "$SOURCE_FILE"
sed -i 's|//resultFloat := MultiplyMatrix(|resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//endTimeFloat := time|endTimeFloat := time|g' "$SOURCE_FILE"
sed -i 's|//durationFloat := endTimeFloat|durationFloat := endTimeFloat|g' "$SOURCE_FILE"
sed -i 's|//WriteMatrix\[f|WriteMatrix\[f|g' "$SOURCE_FILE"
sed -i 's|//fmt.Println("Time (float64):|fmt.Println("Time (float64):|g' "$SOURCE_FILE"

sed -i 's|resultFloat := MultiplyMatrix(|//resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//resultFloat := MultiplyMatrixParallelNum(matrixAFloat, matrixBFloat, 2|resultFloat := MultiplyMatrixParallelNum(matrixAFloat, matrixBFloat, 16|g' "$SOURCE_FILE"


cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 16 | 500x500 | float"
./main

cd ../../run/ || exit

sed -i 's/matrix_float_500_500_1/matrix_float_1000_1000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_500_500_2/matrix_float_1000_1000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 16 | 1000x1000 | float"
./main

cd ../../run/ || exit

sed -i 's/matrix_float_1000_1000_1/matrix_float_2000_2000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_1000_1000_2/matrix_float_2000_2000_2/g' "$SOURCE_FILE"

cd ../src/go || exit
go build ./main.go

echo "Go | parallel | 16 | 2000x2000 | float"
./main

cd ../../run/ || exit

sed -i 's/matrix_float_2000_2000_1/matrix_float_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_2000_2000_2/matrix_float_500_500_2/g' "$SOURCE_FILE"

sed -i 's|//resultFloat := MultiplyMatrix(|resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|resultFloat := MultiplyMatrixParallelNum(matrixAFloat, matrixBFloat, 16|//resultFloat := MultiplyMatrixParallelNum(matrixAFloat, matrixBFloat, 2|g' "$SOURCE_FILE"

sed -i 's|//matrixAInt := ReadMatrix|matrixAInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//matrixBInt := ReadMatrix|matrixBInt := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|//startTimeInt \:=|startTimeInt \:=|g' "$SOURCE_FILE"
sed -i 's|//resultInt := MultiplyMatrix(|resultInt := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|//endTimeInt := time|endTimeInt := time|g' "$SOURCE_FILE"
sed -i 's|//durationInt := endTimeInt|durationInt := endTimeInt|g' "$SOURCE_FILE"
sed -i 's|//WriteMatrix\[i|WriteMatrix\[i|g' "$SOURCE_FILE"
sed -i 's|//fmt.Println("Time (int):|fmt.Println("Time (int):|g' "$SOURCE_FILE"

sed -i 's|matrixAFloat := ReadMatrix|//matrixAFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|matrixBFloat := ReadMatrix|//matrixBFloat := ReadMatrix|g' "$SOURCE_FILE"
sed -i 's|startTimeFloat \:=|//startTimeFloat \:=|g' "$SOURCE_FILE"
sed -i 's|resultFloat := MultiplyMatrix(|//resultFloat := MultiplyMatrix(|g' "$SOURCE_FILE"
sed -i 's|endTimeFloat := time|//endTimeFloat := time|g' "$SOURCE_FILE"
sed -i 's|durationFloat := endTimeFloat|//durationFloat := endTimeFloat|g' "$SOURCE_FILE"
sed -i 's|WriteMatrix\[f|//WriteMatrix\[f|g' "$SOURCE_FILE"
sed -i 's|fmt.Println("Time (float64):|//fmt.Println("Time (float64):|g' "$SOURCE_FILE"