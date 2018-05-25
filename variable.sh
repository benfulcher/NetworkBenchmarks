#!/bin/bash

#Variable coeffs defined, all default values in file flags.dat
k='3 1 6'
maxk='5 1 9'
mut='0.3 0.2 0.9'
muw='0.3 0.2 0.9'
beta='1.1 0.2 1.9'
t1='1 0.5 3'
t2='0.5 0.5 2'
on='7 1 11'
om='3 1 5'

declare -a arr=("k" "maxk" "mut" "muw" "beta" "t1" "t2" "on" "om") #This creates a string array for our for loop to read through

#This for loop goes through all variables that we want to change
for i in ${arr[@]}
do
	mkdir "$i"_variable #This makes a directory for our data
	subject=0 #Resets the subject creation counter

	#This loop goes through all the varied numbers we want to test
	for variable in `seq ${!i}`
	do
		((subject++)) #adds one to the subject name

		while : #Infinite loop
		do
			[[ -f network.dat ]] && break #Checks whether the network.dat file exists, if not, this will loop over again
			./benchmark -f flags.dat -$i $variable #Calls upon the function to make the benchmark
		done
			#The next four lines stores the data files from the function
			mv statistics.dat "$i"_variable/statistics_"$i"_"$variable".dat
			mv community.dat "$i"_variable/community_"$i"_"$variable".dat
			cp network.dat "$i"_variable/subject"$subject".txt
			mv network.dat "$i"_variable/network_"$i"_"$variable".dat
	done
done
