#!/bin/bash

TEST_FOLDER="tests"

passed=0

for t in $TEST_FOLDER/*;
do
    python3.8 SemantickiAnalizator.py < $t/Test.in > /tmp/Test.out
    diff -s $t/Test.out /tmp/Test.out

    if [[ $(diff -s $t/Test.out /tmp/Test.out ) == *"identical"* ]];
    then
        passed=$(($passed + 1))
    fi
done

total=$(ls -l $TEST_FOLDER/ | wc -l)
echo -e "\nPassed: $passed \nTotal : $total"

