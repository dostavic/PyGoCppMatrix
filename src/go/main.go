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

// Number is a type constraint that includes both int and float64.
type Number interface {
	int | float64
}

// WriteMatrix writes the given matrix to a file.
func WriteMatrix[T Number](path string, matrix [][]T) {
	file, err := os.Create(path)
	if err != nil {
		panic(err) // Panic if file cannot be created.
	}
	defer func(file *os.File) { // Ensure file is closed after writing.
		err := file.Close()
		if err != nil {
			panic(err) // Panic if file cannot be closed.
		}
	}(file)

	// Iterate through the matrix and write each value to the file.
	for _, row := range matrix {
		for _, val := range row {
			switch v := any(val).(type) {
			case int:
				_, _ = fmt.Fprintf(file, "%d ", v) // Format int values.
			case float64:
				_, _ = fmt.Fprintf(file, "%.2f ", v) // Format float64 values with two decimal places.
			}
			if err != nil {
				panic(err)
			}
		}
		_, err := fmt.Fprintln(file) // New line after each row.
		if err != nil {
			panic(err)
		}
	}
}

// ReadMatrix reads a matrix from a file.
func ReadMatrix[T Number](path string) [][]T {
	file, err := os.Open(path)
	if err != nil {
		panic(err) // Panic if file cannot be opened.
	}
	defer func(file *os.File) { // Ensure file is closed after reading.
		err := file.Close()
		if err != nil {
			panic(err) // Panic if file cannot be closed.
		}
	}(file)

	scanner := bufio.NewScanner(file)

	scanner.Scan()

	// Read matrix dimensions from the first line.
	sizeLine := scanner.Text()
	sizes := strings.Split(sizeLine, " ")
	rows, _ := strconv.Atoi(sizes[0])
	cols, _ := strconv.Atoi(sizes[1])

	// Initialize matrix with read dimensions.
	matrix := make([][]T, rows)
	for i := range matrix {
		matrix[i] = make([]T, cols)
	}

	// Read each matrix value.
	rowIndex := 0
	for scanner.Scan() {
		line := scanner.Text()
		numberStrings := strings.Split(line, " ")

		for colIndex, numberStr := range numberStrings {
			var value T
			if intVal, err := strconv.Atoi(numberStr); err == nil {
				value = T(intVal) // Parse int value.
			} else if floatVal, err := strconv.ParseFloat(numberStr, 64); err == nil {
				value = T(floatVal) // Parse float64 value.
			}
			matrix[rowIndex][colIndex] = value // Assign value to matrix.
		}
		rowIndex++
	}

	return matrix // Return the populated matrix.
}

// MultiplyMatrixParallel multiplies two matrices in parallel.
func MultiplyMatrixParallel[T Number](matrixA, matrixB [][]T) [][]T {
	result := make([][]T, len(matrixA)) // Initialize result matrix.
	for i := range result {
		result[i] = make([]T, len(matrixB[0]))
	}

	var wg sync.WaitGroup // Use WaitGroup to wait for all goroutines to finish.
	for i := 0; i < len(matrixA); i++ {
		for j := 0; j < len(matrixB[0]); j++ {
			wg.Add(1) // Indicate a new goroutine is starting.
			go func(i, j int) { // Start a new goroutine for each element of the result matrix.
				defer wg.Done() // Indicate goroutine is done after execution.
				for k := 0; k < len(matrixA); k++ {
					result[i][j] += matrixA[i][k] * matrixB[k][j] // Perform multiplication.
				}
			}(i, j)
		}
	}

	wg.Wait() // Wait for all goroutines to finish.
	return result // Return the result matrix.
}

// MultiplyRowCol multiplies a single row and column, used in MultiplyMatrixParallelNum.
func MultiplyRowCol[T Number](matrixA [][]T, matrixB [][]T, result [][]T, row, col int, wg *sync.WaitGroup,
	sema chan struct{}) {
	defer wg.Done() // Signal goroutine is done on return.
	sema <- struct{}{} // Acquire semaphore to limit concurrency.

	total := T(0) // Initialize total for this element.
	for k := 0; k < len(matrixA); k++ {
		total += matrixA[row][k] * matrixB[k][col] // Perform multiplication.
	}
	result[row][col] = total // Assign result.

	<-sema // Release semaphore.
}

// MultiplyMatrixParallelNum multiplies two matrices in parallel with limited concurrency.
func MultiplyMatrixParallelNum[T Number](matrixA, matrixB [][]T, numGoroutines int) [][]T {
	result := make([][]T, len(matrixA)) // Initialize result matrix.
	for i := range result {
		result[i] = make([]T, len(matrixB[0]))
	}

	var wg sync.WaitGroup // WaitGroup to wait for all goroutines.
	sema := make(chan struct{}, numGoroutines) // Semaphore to limit concurrency.

	for i := 0; i < len(matrixA); i++ {
		for j := 0; j < len(matrixB[0]); j++ {
			wg.Add(1) // Indicate a new goroutine is starting.
			go MultiplyRowCol(matrixA, matrixB, result, i, j, &wg, sema) // Start goroutine with semaphore.
		}
	}

	wg.Wait() // Wait for all goroutines to finish.
	return result // Return the result matrix.
}

// MultiplyMatrix multiplies two matrices sequentially.
func MultiplyMatrix[T Number](matrixA [][]T, matrixB [][]T) [][]T {
	total := T(0) // Initialize total for accumulation.
	result := make([][]T, len(matrixA)) // Initialize result matrix.
	for i := range result {
		result[i] = make([]T, len(matrixB[0]))
	}

	// Sequentially multiply matrixA and matrixB.
	for i := 0; i < len(matrixA); i++ {
		for j := 0; j < len(matrixB[0]); j++ {
			for k := 0; k < len(matrixA); k++ {
				total = total + matrixA[i][k]*matrixB[k][j] // Perform multiplication.
			}
			result[i][j] = total // Assign result.
			total = 0 // Reset total for next element.
		}
	}

	return result // Return the result matrix.
}

func main() {
	//matrixAFloat := ReadMatrix[float64]("../../data/input/matrix_float_500_500_1.txt")
	//matrixBFloat := ReadMatrix[float64]("../../data/input/matrix_float_500_500_2.txt")
	
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
	
	//WriteMatrix[float64]("../../data/output/matrix_go_float.txt", resultFloat)

	//fmt.Println("Time (float64): ", durationFloat.Milliseconds(), "ms")

	// Example usage of the functions above for int matrices.
	matrixAInt := ReadMatrix[int]("../../data/input/matrix_int_500_500_1.txt") // Read matrix A.
	matrixBInt := ReadMatrix[int]("../../data/input/matrix_int_500_500_2.txt") // Read matrix B.
	

	startTimeInt := time.Now() // Read matrix B.

	resultInt := MultiplyMatrix(matrixAInt, matrixBInt) // Multiply matrices sequentially.
	//resultInt := MultiplyMatrixParallel[int](matrixAInt, matrixBInt)
	//resultInt := MultiplyMatrixParallelNum(matrixAInt, matrixBInt, 2)

	endTimeInt := time.Now() // End timing.
	durationInt := endTimeInt.Sub(startTimeInt) // Calculate duration.

	
	WriteMatrix[int]("../../data/output/matrix_go_int.txt", resultInt) // Write result matrix to file.

	fmt.Println("Time (int): ", durationInt.Milliseconds(), "ms") // Print execution time.
}
