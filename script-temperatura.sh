#!/bin/bash


#cria um arquivo txt para armazenar o histórico de temperatura 
touch historico_temperatura.txt

#limpa o arquivo a cada execução e na primeira linha, adiciona a data
echo "$(date) @ $(hostname)" > historico_temperatura.txt	
	

while :
do
	
	clear
	echo ""


	#realiza a leitura
	cpu=$(</sys/class/thermal/thermal_zone0/temp)
	temp_atual=$((cpu/1000))

	#grava no arquivo
	echo $temp_atual >> historico_temperatura.txt
	
	
	#mostra no terminal
	echo "$(date) @ $(hostname)"
	echo "-------------------------------------------"
	echo "GPU => $(/opt/vc/bin/vcgencmd measure_temp)"
	echo "CPU => $((temp_atual))'C"



	#mostra informações do disco /
	echo ""
	echo "Espaço no dir /"
	df -h /
	echo ""


	echo "Press [CTRL+C] to stop.."


	#os eventos são atualizados a cada 5s
	sleep 5



	

done



