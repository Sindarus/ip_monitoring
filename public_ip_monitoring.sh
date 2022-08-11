#!/bin/bash
set -e  # exit if one command fails

# Retrieve current public IP
current_ip=`dig +short -4 myip.opendns.com @resolver1.opendns.com`
echo "current IP is $current_ip"

# Retrieve previous IP
script_path=`dirname $0`
previous_ip_file_path=$script_path/previous_ip.txt
previous_ip=`cat $previous_ip_file_path`
echo "previous IP is $previous_ip"

if [ $current_ip == $previous_ip ];
then
    echo "Public IP is still $current_ip"
else
    echo "Public IP has changed from $previous_ip to $current_ip"
    echo -e "From: ***@***.com\nTo: ***@***.com\nSubject: *** has a new public IP $current_ip" | msmtp -a *** ***@***.com
    echo $current_ip > $previous_ip_file_path 
    echo "A mail has been sent"
fi
