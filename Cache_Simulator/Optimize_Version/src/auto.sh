set -v
./cache_simulator -I ../trace2017/01-mcf-gem5-xcg.trace

./cache_simulator -I ../trace2017/01-mcf-gem5-xcg.trace -LIRS l1 -LIRS l2 -PNUM l1 -1 -PNUM l2 2

./cache_simulator -I ../trace2017/02-stream-gem5-xaa.trace

./cache_simulator -I ../trace2017/02-stream-gem5-xaa.trace -LIRS l1 -LIRS l2 -PNUM l1 -1 -PNUM l2 2

