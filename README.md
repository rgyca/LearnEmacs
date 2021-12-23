# emacs 安装过程

	这是一个安装在mac系统上的emacs，移植到windows上，在配置时，没有分情况考虑，所以做了相应的修改。

## 把文件解压到D:盘中

	保证可以看到D:\Work_Space\emacs

## 设置跟目录，过程

- 桌面，右键点击 我的电脑（或此电脑）->属性->点击右侧靠下处 *高级系统设置* ->系统属性上面的 高级-> 下面的  *环境变量* -> 中间的 *新建* -> 变量名设为 HOME ，变量值设为  D:\Work_Space\emacs   确定

## 回到D:盘 Work_Space 目录下

	点击   D:\Work_Space\emacs\emacs-27\x86_64\bin\runemacs.exe，看看是否下载配置插件（需要联网）[这里使用了上海交通大学的镜像]

## 基本操作

打开新建  文件 C-x C-f

关闭   C-x C-c

保存   C-x C-s

移动光标  C-f(b n p)

切分窗口 C-x 3(2 1 0)

调整大小  C-{  ( } )

标记 mark  C-z (Or C-@)

Undo C-x u (c- -)

注释      M-;

撤销 C-x u

释放操作 c-g

========================================

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
	
## org-roam

在windows下，不能使用，需要Emacsql等，需要安装mingw。

但是在MacOS下好使。


## mu4e

邮件没有配置好，现在不用
