---
layout: post
title:  "linux设备节点查看方式"
date:   2017-06-19 20:32:54
categories: COM
tags: linux kernel devicenode
---

* content
{:toc}


## 1、主设备号与次设备号的功能 ##

在Linux内核中，主设备号标识设备对应的驱动程序，告诉Linux内核使用哪一个驱动程序为该设备(也就是/dev下的设备文件)服务；而次设备号则用来标识具体且唯一的某个设备。




比如说在linux的终端打入命令:

```
**@ubuntu:/dev$ ls –l   
crw-rw----  1 root   root      4,   0 2010-05-25 06:50 tty0 
crw-------  1 root   root      4,   1 2010-05-25 06:51 tty1
```

 

会出现很多的文件列表，这里举例字符串设备文件【字符串设备的开头表示为c，当然块设备表示为b】，这些文件可以称为文件系统书的节点，都是位于/dev目录下。另外上面2行中的数字，4【紫红表示】，0，1【蓝色表示】分别表示的是该设备的主设备号，次设备号。一个主设备号和一个次设备号就组成了该设备的唯一标识符。虽然现在的linux内核允许多个驱动程序共享主设备号，但是现在大多数的设备仍然按照“一个主设备号对应一个驱动程序”的原则组织。次设备号用来指向驱动程序所实现的设备，内核本身基本上不会去关心关于次设备号的任何其他信息。

查看系统已经分配的主设备有哪些：
```
#cat /proc/devices  
```

## 2、设备编号的内部表达 ##

设备号的类型是dev_t类型（2.4内核为kdev_t），在<linux/coda.h>中定义。
```
typedef  unsigned  long        dev_t ;
```
其中dev_t是一个32位的数，12位表示主设备号，另外20位表示次设备号。

2.6内核把主设备号由8位扩展到12位，而次设备号由8位扩展到20位。

获取主设备号和次设备号的方法如下：
```
MAJOR(dev_t dev)：根据设备号dev获得主设备号； 
MINOR(dev_t dev)：根据设备号dev获得次设备号；
``` 

 

在<linux/kdev_t.h> 中以上宏的定义如下：
```
#define MAJOR(dev)    ((unsigned int) ((dev) >> MINORBITS)) 
#define MINOR(dev)    ((unsigned int) ((dev) & MINORMASK))
 ```

 

 根据主设备号major和次设备号minor构建设备号（转换成dev_t的类型），可以使用
```
MKDEV(int major, int minor);
 ```

 

在<linux/kdev_t.h> 中以上宏的定义如下：
```
#define MKDEV(ma,mi)    (((ma) << MINORBITS) | (mi))
 ```

 

## 3、杂项设备的介绍 ##

misc设备，主设备号为10，函数注册的方式也不一样。使用如下：
```
misc_register(&XXX_miscdev);
misc_deregister(&XXX_miscdev);
 ```

 

上面的函数需指定miscdevice结构体，

在#include <linux/miscdevice.h>中定义：
```
struct miscdevice   
{   
     int minor;                        //次设备号   
      const char *name;          //设备驱动程序的名称   
      struct file_operations *fops;    //file_operation   
     struct   miscdevice  *next,  *prev;     //用于内部管理   
      devfs_handle_t devfs_handle;        //用于内部管理   
} 
```
 开发人员必须定义的filed包括：minor ,name 及fops如下：
```
static struct miscdevice mymisc_dev = {   
.minor = MISC_DYNAMIC_MINOR,   
.name = "mymisc",   
.fops = &mymisc_fops,   
};  
```

 

 可以通过#cat /proc/misc来查看misc设备的注册情况。

misc设备主要针对没有多个同类设备的驱动程序

---
