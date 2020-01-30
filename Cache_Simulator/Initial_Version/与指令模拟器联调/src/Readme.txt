本模拟器开发环境为`Ubuntu 18.04.1 LTS`，使用的编程语言为C++，编译器为`g++`。模拟器源码共包括11个文件：`def.h、storage.h、cache.h、cache.cc、memory.h、memory.cc、Read_Elf.h、Read_Elf.cpp、Simulation.h、Simulation.cpp、Register.h`，都放在`My_Simulator`文件夹中，在该文件夹中还有一个Makefile，如需编译模拟器，在终端输入`make`即可获得可执行程序`my_simulator`。

该模拟器在命令行上的执行方式是

./my_simulator -I input_file_path [-E output_elf_information_path] [-TF] [-S] [-M] [-P]
Parameters: 
        [-I] 下一个参数为输入文件路径，不可省略，输入文件应为elf文件 
        [-E] 下一个参数为输出文件路径，输出文件为模拟器解析输入文件得到的elf信息，默认输出到stdout
        [-TF] 单步调试
        [-S] 单周期处理器模式(默认)
        [-M] 多周期处理器模式
        [-P] 流水线处理器模式

本实验使用的测试程序为lab2-2中使用的10个测试程序，并与lab2-2中的结果进行对比，使用`My_Simulator`文件夹中的`auto.sh`可以重现Part 2部分所有结果，结果记录在文件夹中的`result.txt`文件中。