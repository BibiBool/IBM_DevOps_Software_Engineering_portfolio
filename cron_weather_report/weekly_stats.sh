#!/bin/bash

# Load the historical accuracies into an array covering the last week
cat synthetic_historical_fc_accuracy.tsv | tail -7 | cut -f6 > scratch.txt 
week_fc=($(cat scratch.txt))

# Validate the result
for i in {0..6}; do
    echo ${week_fc[$i]}
done

# Display the min and max absolute forecasting error for the week
for i in {0..6}; do
    if [[ ${week_fc[$i]} < 0 ]]
    then
        week_fc[$i]=$(((-1)*week_fc[$i]));
    fi 
    echo ${week_fc[$i]};
done

minimum=${week_fc[1]}
maximum=${week_fc[1]}

for value in ${week_fc[@]}; do
    if [[ $minimum > $value ]]; then
        minimum=$value
    fi
    if [[ $maximum < $value ]]; then
        maximum=$value
    fi
done

echo "minimum absolute error = $minimum"
echo "maximum absolute error = $maximum"