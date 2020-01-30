本模拟器开发环境为`Ubuntu 18.04.1 LTS`，使用的编程语言为C++，编译器为`g++`。模拟器源码共包括7个文件：`def.h、storage.h、cache.h、cache.cc、memory.h、memory.cc、main.cc、LIRSContainer.h`，都放在`Cache_Simulator`文件夹中，在该文件夹中还有一个Makefile，如需编译模拟器，在终端输入`make`即可获得可执行程序`cache_simulator`。

该模拟器在命令行上的执行方式是

./cache_simulator -I input_file_path [-LIRS CacheName]* [-PNUM CacheName num]*
Parameters: 
        [-I] 下一个参数为输入文件路径，不可省略，输入文件应为trace文件
        [-LIRS] 下一个参数为cache名称(l1或l2)，指定的cache将以LIRS替换算法代替LRU
        [-PNUM] 下一个参数为cache名称(l1或l2)，下下一个参数为预取模式(默认为0，不预取，-1则是streambuffer预取，大于0为直接预取之后num个block)

使用`Cache_Simulator`文件夹中的`auto.sh`可以重现所有结果，结果记录在文件夹中的`result.txt`文件中。

默认模式命令示例为：
./cache_simulator -I ../trace2017/01-mcf-gem5-xcg.trace

优化模式命令示例为：
./cache_simulator -I ../trace2017/01-mcf-gem5-xcg.trace -LIRS l1 -LIRS l2 -PNUM l1 -1 -PNUM l2 2