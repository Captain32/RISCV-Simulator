本模拟器开发环境为`Ubuntu 18.04.1 LTS`，使用的编程语言为C++，编译器为`g++`。模拟器源码共包括7个文件：`def.h、storage.h、cache.h、cache.cc、memory.h、memory.cc、main.cc`，都放在`Cache_Simulator`文件夹中，在该文件夹中还有一个Makefile，如需编译模拟器，在终端输入`make`即可获得可执行程序`cache_simulator`。

该模拟器在命令行上的执行方式是：

./my_simulator -I input_file_path [-CS CacheSize] [-BS BlockSize] [-A Associativity] [-WT IsWriteThrough] [-WA IsWriteAllocate] [-CHL CacheHitLatency] [-CBL CacheBusLatency] [-MHL MemoryHit Latency] [-MBL MemoryBusLatency]
Parameters: 
        [-I] 下一个参数为输入文件路径，不可省略，输入文件应为trace文件
        [-CS] 下一个参数为Cache大小取log(例如默认32KB即2^15B应设为15)
        [-BS] 下一个参数为Block大小取log(例如默认64B应设为6)
        [-A] 下一个参数为组相联度取log(例如默认8-way应设为3)
        [-WT] 下一个参数1为Write Through，0为Write Back(默认)
        [-WA] 下一个参数1为Write Allocate(默认)，0为No Write Allocate
        [-CHL] 下一个参数为Cache Hit Latency(默认为10)
        [-CBL] 下一个参数为Cache Bus Latency(默认为3)
        [-MHL] 下一个参数为Memory Hit Latency(默认为100)
        [-MBL] 下一个参数为Memory Bus Latency(默认为6)

使用`Cache_Simulator`文件夹中的`auto.sh`可以重现Part 1部分所有结果，结果记录在文件夹中的`result.txt`文件中。