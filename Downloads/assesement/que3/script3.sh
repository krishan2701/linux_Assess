

#!/bin/bash

# Initialize an associative array to store ticket counts
declare -A ticket_count

# Read the log file line by line
while IFS= read -r line; do
  # Extract user, action, source, and destination from the line
  user=$(echo "$line" | awk '{print $3}')
  action=$(echo "$line" | awk '{print $4}')
  source=$(echo "$line" | awk '{print $7}')
  destination=$(echo "$line" | awk '{print $9}')

  # Create a unique identifier for the trip
  trip_id="${user}_${source}_${destination}"

  if [[ "$action" == "booked" ]]; then
    # Increment the count for the user if booked
    ((ticket_count[$user]++))
    # Mark the trip as booked
    booked_trips["$trip_id"]=1
  elif [[ "$action" == "cancelled" && "${booked_trips[$trip_id]}" == 1 ]]; then
    # Decrement the count for the user if cancelled
    ((ticket_count[$user]--))
    # Mark the trip as cancelled
    booked_trips["$trip_id"]=0
  fi
done < log.txt

# Print the results
echo -e "User\tNumber of Tickets"
for user in "${!ticket_count[@]}"; do
  echo -e "$user\t${ticket_count[$user]}"
done
  if [[ "$action" == "booked" ]]; then
    # Increment the count for the user if booked
    ((ticket_count[$user]++))
    # Mark the trip as booked
    booked_trips["$trip_id"]=1

  fi
