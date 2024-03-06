package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
	"sync"
	"time"
)

type Number interface {
	int | float64
}

func WriteMatrix[T Number](path string, matrix [][]T) {
	file, err := os.Create(path)
	if err != nil {
		panic(err)
	}
	defer func(file *os.File) {
		err := file.Close()
		if err != nil {
			panic(err)
		}
	}(file)

	for _, row := range matrix {
		for _, val := range row {
			switch v := any(val).(type) {
			case int:
				_, _ = fmt.Fprintf(file, "%d ", v)
			case float64:
				_, _ = fmt.Fprintf(file, "%.2f ", v)
			}
			if err != nil {
				panic(err)
			}
		}
		_, err := fmt.Fprintln(file)
		if err != nil {
			panic(err)
		}
	}
}

func ReadMatrix[T Number](path string) [][]T {
	file, err := os.Open(path)
	if err != nil {
		panic(err)
	}
	defer func(file *os.File) {
		err := file.Close()
		if err != nil {
			panic(err)
		}
	}(file)

	scanner := bufio.NewScanner(file)

	scanner.Scan()
	sizeLine := scanner.Text()
	sizes := strings.Split(sizeLine, " ")
	rows, _ := strconv.Atoi(sizes[0])
	cols, _ := strconv.Atoi(sizes[1])

	matrix := make([][]T, rows)
	for i := range matrix {
		matrix[i] = make([]T, cols)
	}

	rowIndex := 0
	for scanner.Scan() {
		line := scanner.Text()
		numberStrings := strings.Split(line, " ")

		for colIndex, numberStr := range numberStrings {
			var value T
			if intVal, err := strconv.Atoi(numberStr); err == nil {
				value = T(intVal)
			} else if floatVal, err := strconv.ParseFloat(numberStr, 64); err == nil {
				value = T(floatVal)
			}
			matrix[rowIndex][colIndex] = value
		}
		rowIndex++
	}

	return matrix
}

//func PrintMatrix(matrix [][]float64) {
//	for _, row := range matrix {
//		for _, col := range row {
//			fmt.Printf("%.2f ", col)
//		}
//		fmt.Println()
//	}
//}

func MultiplyMatrixParallel[T Number](matrixA, matrixB [][]T) [][]T {
	result := make([][]T, len(matrixA))
	for i := range result {
		result[i] = make([]T, len(matrixB[0]))
	}

	var wg sync.WaitGroup
	for i := 0; i < len(matrixA); i++ {
		for j := 0; j < len(matrixB[0]); j++ {
			wg.Add(1)
			go func(i, j int) {
				defer wg.Done()
				for k := 0; k < len(matrixA); k++ {
					result[i][j] += matrixA[i][k] * matrixB[k][j]
				}
			}(i, j)
		}
	}

	wg.Wait()
	return result
}

func MultiplyRowCol[T Number](matrixA [][]T, matrixB [][]T, result [][]T, row, col int, wg *sync.WaitGroup,
	sema chan struct{}) {
	defer wg.Done()
	sema <- struct{}{}

	total := T(0)
	for k := 0; k < len(matrixA); k++ {
		total += matrixA[row][k] * matrixB[k][col]
	}
	result[row][col] = total

	<-sema
}

func MultiplyMatrixParallelNum[T Number](matrixA, matrixB [][]T, numGoroutines int) [][]T {
	result := make([][]T, len(matrixA))
	for i := range result {
		result[i] = make([]T, len(matrixB[0]))
	}

	var wg sync.WaitGroup
	sema := make(chan struct{}, numGoroutines)

	for i := 0; i < len(matrixA); i++ {
		for j := 0; j < len(matrixB[0]); j++ {
			wg.Add(1)
			go MultiplyRowCol(matrixA, matrixB, result, i, j, &wg, sema)
		}
	}

	wg.Wait()
	return result
}

func MultiplyMatrix[T Number](matrixA [][]T, matrixB [][]T) [][]T {
	total := T(0)
	result := make([][]T, len(matrixA))
	for i := range result {
		result[i] = make([]T, len(matrixB[0]))
	}

	for i := 0; i < len(matrixA); i++ {
		for j := 0; j < len(matrixB[0]); j++ {
			for k := 0; k < len(matrixA); k++ {
				total = total + matrixA[i][k]*matrixB[k][j]
			}
			result[i][j] = total
			total = 0
		}
	}

	return result
}

func main() {
	//matrixAFloat := ReadMatrix[float64]("../../data/input/matrix_float_500_500_1.txt")
	//matrixBFloat := ReadMatrix[float64]("../../data/input/matrix_float_500_500_2.txt")
	//// PrintMatrix(matrixA)
	//// fmt.Println()
	//// PrintMatrix(matrixB)
	//// fmt.Println()
	//
	//startTimeFloat := time.Now()
	//
	//resultFloat := MultiplyMatrix(matrixAFloat, matrixBFloat)
	//resultFloat := MultiplyMatrixParallel[float64](matrixAFloat, matrixBFloat)
	//resultFloat := MultiplyMatrixParallelNum(matrixAFloat, matrixBFloat, 2)
	//
	//endTimeFloat := time.Now()
	//durationFloat := endTimeFloat.Sub(startTimeFloat)
	//
	//// PrintMatrix(result)
	//WriteMatrix[float64]("../../data/output/matrix_go_float.txt", resultFloat)

	//fmt.Println("Time (float64): ", durationFloat.Milliseconds(), "ms")

	matrixAInt := ReadMatrix[int]("../../data/input/matrix_int_500_500_1.txt")
	matrixBInt := ReadMatrix[int]("../../data/input/matrix_int_500_500_2.txt")
	// PrintMatrix(matrixA)
	// fmt.Println()
	// PrintMatrix(matrixB)
	// fmt.Println()

	startTimeInt := time.Now()

	resultInt := MultiplyMatrix(matrixAInt, matrixBInt)
	//resultInt := MultiplyMatrixParallel[int](matrixAInt, matrixBInt)
	//resultInt := MultiplyMatrixParallelNum(matrixAInt, matrixBInt, 2)

	endTimeInt := time.Now()
	durationInt := endTimeInt.Sub(startTimeInt)

	// PrintMatrix(result)
	WriteMatrix[int]("../../data/output/matrix_go_int.txt", resultInt)

	fmt.Println("Time (int): ", durationInt.Milliseconds(), "ms")
}
