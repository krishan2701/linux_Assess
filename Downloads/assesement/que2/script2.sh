#Solution to Second question

echo "Memory usage"

free -h

# b. Disk space (alert should be generated when it is more than 50 percent)

#echo "Disk space"


echo "Disk Space Usage:"

df -h

df -h | awk '$5+0 > 10 {print "Alert: Disk space usage is above 50% on "$1" ("$5")"}'



df -h | awk '$5+0 > 10  {print "Alert: Disk space usage is above 50% on "$1" ("$5")" > "alerts/"$1".txt"}'


#du . | sort -nr | head -n10
sudo du -a -x /var | sort -n -r | head -n 10
