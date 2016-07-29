. t/test-lib.sh
echo "1..3"

TEST_FILE='./t/data/test.kra'
TEST_OUTPUT='./tmp/test/'

##### 1

start_test 'Fails if source file does not exist'
source_path='doesnt-exist'
target="./tmp"
expected="Source file '$source_path' does not exist"
actual=$(krita-explode $source_path $target 2>&1 >/dev/null)
test_equal "$expected" "$actual"
test ! -e "$actual"
end_test

##### 2

start_test 'Fails if target exists'
target='./t/data/'
expected="Target directory '$target' already exists"
actual=$(krita-explode $TEST_FILE $target 2>&1 >/dev/null)
test_equal "$expected" "$actual"
end_test

##### 3

start_test 'Explodes .kra file'
rm -rf "$TEST_OUTPUT"
output=$(krita-explode $TEST_FILE $TEST_OUTPUT)
test_equal "" "$output"
[ -f "$TEST_OUTPUT/documentinfo.xml" ] || fail_test

end_test
