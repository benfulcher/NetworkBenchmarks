mkdir iters
for i in `seq 1 100`
do
	./benchmark -f flags.dat
	mv network.dat iters/network"$i".dat
	mv community.dat iters/community"$i".dat
	rm statistics.dat
done
