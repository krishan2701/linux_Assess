#!/bin/bash

# Read the properties from tasks.txt
input_file="task.txt"

IFS=',' read -r -a times <<< "$time"
IFS=',' read -r -a emails <<< "$emailIds"
IFS=',' read -r -a tasks <<< "$tasks"

for i in "${!emails[@]}"; do
  # Extract hour and minute from time
  hour=$(echo ${times[$i]} | cut -d':' -f1)
  minute=$(echo ${times[$i]} | cut -d':' -f2)

  # Calculate time minus 30 minutes
  task_time=$(date -d "$hour:$minute today -30 minutes" +"%H:%M")

  # Create directory for the email
  mkdir -p ${emails[$i]}

  # Create .txt file with the task message
  echo "Task at ${times[$i]}: ${tasks[$i]}" > ${emails[$i]}/${task_time}_task.txt
done > task.txt

echo "task done"
                   
