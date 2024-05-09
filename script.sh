#!/bin/bash
#logging program by Selva

#Begin program
echo "Running"

#host info
hostname_short=$(hostname -s -f)
hostname_FQDN=$(hostname -f)

#system time with divider 
date +"~~~~~~~~~~~~~~~Log Updated[%Y/%d/%M Time: %T]~~~~~~~~~~~~~~~" >> ~/Desktop/SelvaLogger.txt

#hostname
echo "Logged From Hostname: $hostname_short / FQDN: $hostname_FQDN" >> ~/Desktop/IanTestlog.txt

#kernal version
uname -srm >> ~/Desktop/SelvaLogger.txt

#OS version and name
os_release=$(grep -E '^(VERSION|NAME)=' /etc/os-release)
echo $os_release >> ~/Desktop/SelvaLogger.txt

#uptime
uptime_main=$(uptime "-p" | grep -v "up")
echo $uptime_main >> ~/Desktop/SelvaLogger.txt

#processer stuff
processer_cores=$(cat /proc/cpuinfo | grep processor | wc -l)
processer_model=$(cat /proc/cpuinfo | grep 'model name' | head -1 )
echo  "-----CPU Info-----" >> ~/Desktop/SelvaLogger.txt
echo -e $processer_model "\n" >> ~/Desktop/SelvaLogger.txt
echo "Number of cores: $processer_cores" >> ~/Desktop/SelvaLogger.txt

#memory available 
memorycheck=$( free -m -h)
echo "----Memory information-----" >> ~/Desktop/SelvaLogger.txt
echo -e $memorycheck "\n" >> ~/Desktop/SelvaLogger.txt

#ip stuff
ip_address_info=$(ip -h "address")
echo "-----IP information-----" >> ~/Desktop/SelvaLogger.txt
echo -e $ip_address_info "\n" >> ~/Desktop/SelvaLogger.txt

#file system usage

dfthing=$(df -h)
echo "------Disk information-----" >> ~/Desktop/SelvaLogger.txt
echo -e $dfthing "\n" >> ~/Desktop/SelvaLogger.txt

#Most recent Errors * 5
echo "-----The Errors-----" >> ~/Desktop/SelvaLogger.txt
grep -i error /var/log/syslog | tail -n 5 >> ~/Desktop/SelvaLogger.txt

echo "Complete"