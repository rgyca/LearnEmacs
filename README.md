# emacs 安装过程

	这是一个安装在mac系统上的emacs，移植到windows上，在配置时，没有分情况考虑，所以做了相应的修改。

## 把文件解压到D:盘中

	保证可以看到D:\Work_Space\emacs

## 设置跟目录，过程

- 桌面，右键点击 我的电脑（或此电脑）->属性->点击右侧靠下处 *高级系统设置* ->系统属性上面的 高级-> 下面的  *环境变量* -> 中间的 *新建* -> 变量名设为 HOME ，变量值设为  D:\Work_Space\emacs   确定

## 回到D:盘 Work_Space 目录下

	点击 D:\Work_Space\emacs\emacs-27\x86_64\bin\runemacs.exe，看看是否下载配置插件（需要联网）[这里使用了上海交通大学的镜像]

## 基本操作

打开新建  文件 C-x C-f

关闭   C-x C-c

保存   C-x C-s

移动光标  C-f(b n p)

切分窗口 C-x 3(2 1 0)

调整大小  C-{  ( } )

删除窗口  C-x k

标记 mark  C-z (Or C-@)

Undo C-x u (C- -)    对 undo - redo tree 不了解

注释      M-;

撤销 C-x u

释放操作 c-g

缓冲区开头   M-< 
缓冲区结尾   M-> 

## Org 标识
定格星号（*）加空格标识标题，一个星号标识一级标题，两个星号标识二级标题，以此类推。

	Check box [/]
		- [ ] check 1
		- [ ] check 2

	Itermize1
		- 项目1
		- 项目2
 
	Itermize2
		+ 项目1
		+ 项目2
		
## Org Agenda基本操作
	
	C-c a 查看日程安排
## Orgmode 插入时间

	C-c . 插入时间
	C-c C-s schedule time
	C-c C-d deadline
	C-c @ 插入时间，但是不列入agenda

## 书签设置

C-x r m(设置) 
C-x r l（列表）
列表中操作同Dired

## eaf

在mac上eaf会出现python错误，退出现象，不知道什么原因

目前只是好奇试了一下，以后再说。
	
## org-roam

在windows下，不能使用，需要Emacsql等，需要安装mingw。

但是在MacOS下好使。



## mu4e

邮件没有配置好，现在不用，现在不是特别需要。


# Emacs

	Emacs，对我来说，真不知道怎么说它好，到底用它做了多少正事？有爱又恨啊。

# Markdown 
在网上抄的，可以通过pandoc转换成html文件，并且可以实时更行。似乎对机器的性能有所要求，在老实台式机上，速度慢，卡顿，但是笔记本上，还好，基本能够实时输入和显示。

# 学习emacs 有哪些经验？

发现对于emacs，玩的成分多一些，配置的内容必须要使用的多，多而不精，就像照相馆里的ps，打印社的office，一个软件的精通 vs 多个软件的了解? 
	
很长时间，一直在用emacs，但是好像没有什么是必须的，不可替代的？别人不用emacs，用其它的软件，好像事情做得也很好，花时间去学emacs，到底值不值得？
	
对于emacs，自己也是能用的，而且一些插件基本都知道些，但是就是感觉好多功能没有用起来，能否用它做些事情，比如，用emacs写本书、写文章？ 想来想去，好像感觉emacs还是一个工具，用起来很爽，如果不能系统的用它做事，或做些系统的事，有些浪费它的强大功能。

学习emacs本身怎么样，不敢说，也就是说，其功能可以通过其它类似的软件可以实现，可能花费的时间和精力更少，但是有两个副产品收获：

	1) Lisp，从这个知道lisp (scheme)，看了一下SICP；

	2) 知道程序原理可以这样干的(本身采用解释器的形式来做编辑器)，知道（但是不会）shell,regular express等东西。

# Timestamp (M-x gnu-insert-timestamp)

通过 M-x 可以插入时间戳，是一个随修改而变更的时间搓！



Last Modified: 2022-02-18 13:35:09 +0800
