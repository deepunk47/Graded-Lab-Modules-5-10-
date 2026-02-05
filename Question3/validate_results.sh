#!/bin/bash

PASS_MARK=33
fail_one_count=0
pass_all_count=0

echo "Students who failed in exactly ONE subject:"
echo "-----------------------------------------"

while IFS=',' read -r roll name m1 m2 m3
do
    fail_count=0

    [ "$m1" -lt "$PASS_MARK" ] && fail_count=$((fail_count+1))
    [ "$m2" -lt "$PASS_MARK" ] && fail_count=$((fail_count+1))
    [ "$m3" -lt "$PASS_MARK" ] && fail_count=$((fail_count+1))

    if [ "$fail_count" -eq 1 ]; then
        echo "$roll - $name"
        fail_one_count=$((fail_one_count+1))
    elif [ "$fail_count" -eq 0 ]; then
        pass_all_count=$((pass_all_count+1))
        pass_all_students="$pass_all_students$roll - $name\n"
    fi
done < marks.txt

echo
echo "Students who passed in ALL subjects:"
echo "-----------------------------------"
printf "$pass_all_students"

echo
echo "Summary:"
echo "Students failed in exactly one subject: $fail_one_count"
echo "Students passed in all subjects: $pass_all_count"
