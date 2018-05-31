$test1 = 1,2,3,4,5
$test2 = 1,3,5
$test3 = Compare-Object -ReferenceObject $test2 -DifferenceObject $test1 -PassThru
$test3

#Compare-Object $test1 $test2 | Foreach-object {}
