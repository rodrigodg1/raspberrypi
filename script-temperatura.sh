#!/bin/bash
# Script: my-pi-temp.sh
# Purpose: Display the ARM CPU and GPU  temperature of Raspberry Pi 2/3 
# Author: Vivek Gite <www.cyberciti.biz> under GPL v2.x+
# -------------------------------------------------------

touch historico_temperatura.txt

echo "$(date) @ $(hostname)" > historico_temperatura.txt	
	

while :
do
	
	clear
	echo ""



	cpu=$(</sys/class/thermal/thermal_zone0/temp)
	temp_atual=$((cpu/1000))

	echo $temp_atual >> historico_temperatura.txt
	
	
	echo "$(date) @ $(hostname)"
	echo "-------------------------------------------"
	echo "GPU => $(/opt/vc/bin/vcgencmd measure_temp)"
	echo "CPU => $((temp_atual))'C"




	echo ""
	echo "Espaço no dir /"
	df -h /
	echo ""


	echo "Press [CTRL+C] to stop.."
	sleep 5



	

done



