#!/bin/bash

# #!/bin/bash
# count=1

# echo "starting countdown..."
# while [ $count -le 5 ]
# do
#     echo "Count is: $count"
#     ((count++)) # Increments count by 1
# done


#!/bin/bash

# Define the path to your input file
#INPUT_FILE="sample.txt"

# Check if the file actually exists before reading
# if [ ! -f "$INPUT_FILE" ]; then
#     echo "Error: File $INPUT_FILE not found."
#     exit 1
# fi

# The standard, safe way to read line by line
while IFS= read -r line; do
    # Process each line here
    echo "Processing: $line"
done < 20-script-1.sh # input is this
