#!/bin/bash

mut='0.1 0.1 1' #Range for mixing factor of topology
muw='0.1 0.1 1' #Range for mixing factor of weights

for i in `seq $mut`
do #For all the values of mut
	for j in `seq $muw`
	do #For all the values of muw
		./benchmark -f flags.dat -mut $i -muw $j #Run the benchmark with the new values
		mkdir mix_t_"$i"_w_"$j" #Create a new directory to store it
		#These next commands just move the files to their new directory
		mv network.dat mix_t_"$i"_w_"$j"/network.dat
		mv community.dat mix_t_"$i"_w_"$j"/community.dat
		mv statistics.dat mix_t_"$i"_w_"$j"/statistics.dat
	done
done
