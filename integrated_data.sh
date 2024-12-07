#!/bin/bash
for file in data-hub/*.csv; do
    echo "Processing $file"
done

# Create the output folder and file
mkdir -p db
> db/combined_data.csv

# Get the header from the first file
first_file=$(ls data-hub/*.csv | head -n 1)
head -n 1 "$first_file" > db/combined_data.csv

# Append data from all files, skipping headers
for file in data-hub/*.csv; do
    tail -n +2 "$file" >> db/combined_data.csv
done

# Confirm the output
echo "Merged data saved to db/combined_data.csv"                                                                                                                                                                     