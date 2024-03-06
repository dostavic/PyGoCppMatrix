SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

SOURCE_FILE="$SCRIPT_DIR/../src/python/multiply_matrices.py"

cd ../src/python || exit

echo "Python | 500x500 | int"
python3 multiply_matrices.py

cd ../../run/ || exit

sed -i 's|matrix_int_500_500_1|matrix_int_1000_1000_1|g' "$SOURCE_FILE"
sed -i 's|matrix_int_500_500_2|matrix_int_1000_1000_2|g' "$SOURCE_FILE"


cd ../src/python || exit

echo "Python | 1000x1000 | int"
python3 multiply_matrices.py

cd ../../run/ || exit

sed -i 's|matrix_int_1000_1000_1|matrix_int_2000_2000_1|g' "$SOURCE_FILE"
sed -i 's|matrix_int_1000_1000_2|matrix_int_2000_2000_2|g' "$SOURCE_FILE"


cd ../src/python || exit

echo "Python | 2000x2000 | int"
python3 multiply_matrices.py

cd ../../run/ || exit

sed -i 's/matrix_int_2000_2000_1/matrix_int_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_2000_2000_2/matrix_int_500_500_2/g' "$SOURCE_FILE"




echo

#cd ../../run/ || exit

sed -i 's/matrix_int_500_500_1/matrix_float_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_int_500_500_2/matrix_float_500_500_2/g' "$SOURCE_FILE"

cd ../src/python || exit

echo "Python | 500x500 | float"
python3 multiply_matrices.py

cd ../../run/ || exit

sed -i 's/matrix_float_500_500_1/matrix_float_1000_1000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_500_500_2/matrix_float_1000_1000_2/g' "$SOURCE_FILE"

cd ../src/python || exit

echo "Python | 1000x1000 | float"
python3 multiply_matrices.py

cd ../../run/ || exit

sed -i 's/matrix_float_1000_1000_1/matrix_float_2000_2000_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_1000_1000_2/matrix_float_2000_2000_2/g' "$SOURCE_FILE"

cd ../src/python || exit

echo "Python | 2000x2000 | float"
python3 multiply_matrices.py

cd ../../run/ || exit

sed -i 's/matrix_float_2000_2000_1/matrix_int_500_500_1/g' "$SOURCE_FILE"
sed -i 's/matrix_float_2000_2000_2/matrix_int_500_500_2/g' "$SOURCE_FILE"