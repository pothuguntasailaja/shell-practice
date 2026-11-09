#!/bin/bash

#!/bin/bash
count=1

echo "starting countdown..."
while [ $count -le 5 ]
do
    echo "Count is: $count"
    ((count++)) # Increments count by 1
done
