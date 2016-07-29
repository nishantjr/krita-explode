. t/test-lib.sh
echo "1..4"

##### 1

start_test 'Check usage return value'
status=$(krita-explode >/dev/null 2>&1; echo $?)
test_equal 129 "$status"
end_test

##### 2

start_test 'Check usage message (no args)'
expected='Usage: krita-explode <input.kra> <output.kra.d>'
actual=$(krita-explode 2>&1 >/dev/null)
test_equal "$expected" "$actual"
end_test

##### 3

start_test 'Check usage message (1 arg)'
actual=$(krita-explode foo.kra 2>&1 >/dev/null)
test_equal "$expected" "$actual"
end_test

##### 3

start_test 'Check usage message (Too many args)'
actual=$(krita-explode foo.kra bar.kra.d foobar 2>&1 >/dev/null)
test_equal "$expected" "$actual"
end_test
