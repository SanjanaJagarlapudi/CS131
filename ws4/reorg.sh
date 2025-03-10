#!/bin/bash

DATETIME=$(date "+%F-%T")

for vid in "1.0" "2.0" "4.0"; do
    #Including the header line, or the column names, in each file
    head -n 1 2019-01-h1.csv > "${DATETIME}-${vid}.csv"
    
    # Then, we can add all records for this vendor ID from the dataset
    # we can use grep to find lines starting with the vendor ID followed by a comma, and then add it to its respective file
    grep "^${vid}," 2019-01-h1.csv >> "${DATETIME}-${vid}.csv"
done

# Adding the files to gitignore
for vid in "1.0" "2.0" "4.0"; do
    echo "${DATETIME}-${vid}.csv" >> .gitignore
done

# putting the results in ws4.txt with word count results for each CSV file
echo "Generating word count report..."
> ws4.txt 
for vid in "1.0" "2.0" "4.0"; do
    wc "${DATETIME}-${vid}.csv" >> ws4.txt
done

#Finally, lets add the content of .gitignore to ws4.txt
echo "" >> ws4.txt
echo "Contents of .gitignore:" >> ws4.txt
cat .gitignore >> ws4.txt

echo "Complete. See ws4.txt."
