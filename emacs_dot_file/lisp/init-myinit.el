;;; for my own convienence


;; reload the buffer
(defun refresh-file()
     (interactive)
     (revert-buffer t (not (buffer-modified-p)) t))

(global-set-key [(control f5)] 'refresh-file)


;;Start time and close time 
(defun gnu-insert-timestamp-begin ()
  (interactive)
  "Vivek\'s timestamp insertion function"
  (insert "This work begins at : " (gnu-timestamp-string) "\n"))
(defun gnu-insert-timestamp-end ()
  (interactive)
  "Vivek\'s timestamp insertion function"
  (insert "This work ends at : " (gnu-timestamp-string) "\n"))

(global-set-key [(control f10)] 'gnu-insert-timestamp-begin)
(global-set-key [(control f11)] 'gnu-insert-timestamp-end)

;;;{{{ _____________________ Time stamp for diary

(defun gnu-diary-timestamp-string ()
  (interactive)
  (format-time-string "* %Y年%m月%d日【星期(%3a)】%H:%M "  nil nil))

(defun gnu-insert-timestamp-time ()
  (interactive)
  "Vivek\'s timestamp insertion function"
  (insert  (gnu-diary-timestamp-string) "\n"))
(global-set-key "\C-xt" 'gnu-insert-timestamp-time)

(defun gnu-insert-timestamp-YMD ()
  (interactive)
  "Vivek\'s timestamp insertion function"
  (insert  "** "(gnu-diary-timestamp-string) "\n" "      List of work:" "\n         "))

(global-set-key "\C-xl" 'gnu-insert-timestamp-YMD)

(defun gnu-insert-timestamp-FAC ()
  (interactive)
  "Vivek\'s timestamp insertion function"
  (insert  "** "(gnu-diary-timestamp-string) "\n" "\n" "***  事实:" "\n" "\n" "\n" "*** 研判:" "\n - [ ] " "\n - [ ] " "\n - [ ] \n \n \n"  "*** 结论:" "\n - [ ] \n - [ ] "))
(global-set-key "\C-xd" 'gnu-insert-timestamp-FAC)

(defun gnu-week-agenda-string ()
  (interactive)
  "Vivek\'s timestamp insertion function"
  (insert
   "* TODO *日常工作安排* [/]: 
    使用(c-c !)在标题处插入当天时间,每天refile到list中
   *当天工作安排*
   - [ ] 早上，检阅gtd.org, mobileorg.org，添加TODO项目
   - [ ] 晚上，检查工作完成情况，安排明天事务

   *日常工作*
   - [ ] 看一篇文献
   - [ ] 学习一个知识点
   - [ ] 至少与一个学生交流

   *读书写作*
   - [ ] 非专业书籍10页
   - [ ] 英语短文(新闻)一则
   - [ ] 生活事情(研判，日记等)500字

   *日常生活*
   - [ ] 锻炼(压腿，弯腰，深蹲，俯卧撑)
   - [ ] 行走5公里
"  ))


(global-set-key "\C-xe" 'gnu-week-agenda-string)


(defun gnu-day-plan-agenda-string ()
  (interactive)
  "Vivek\'s timestamp insertion function"
  (insert
   "* TODO *当周计划工作安排* [/]: ""\n""    使用(c-c !)在标题处插入当天时间,不用refile到list中""\n" "\n" 
   "   - [ ] c-xe  " "\n" "   - [ ] " "\n" "   - [ ] " "\n" "   - [ ] " "\n" "   - [ ] " "\n"
   "   - [ ]  *周末归档* 对(1) list.org, (2) project.org, (3) learn.org, (4) record.org整理"
 "\n" ))

(global-set-key "\C-xg" 'gnu-day-plan-agenda-string)



(defun gnu-diary-timestamp ()
  (interactive)
  "Vivek\'s timestamp insertion function"
  (insert "{\\large 日期:\\ }" (gnu-diary-timestamp-string) "{\\large 天气:\\ } "))

(global-set-key [(control f6)] 'gnu-diary-timestamp)



(defun my/timenow ()
  (interactive)
  (let ((current-prefix-arg '(16)))
    (call-interactively 'org-time-stamp-inactive)))
(global-set-key "\C-c!" 'my/timenow)

;;;shortcut for convienence
(defun gnu-org-latex-equation ()
  (interactive)
  "Vivek\'s timestamp insertion function"
  (insert
   "\\begin{equation}

\\end{equation}" )
  (previous-line 1))

(global-set-key "\C-xq" 'gnu-org-latex-equation)

(defun gnu-org-latex-array ()
  (interactive)
  "Vivek\'s timestamp insertion function"
  (insert
   "  \\begin{array}{l}

  \\end{array}" )
  (previous-line 1))
(global-set-key "\C-xa" 'gnu-org-latex-array)



;;(setq bookmark-default-file "~/Org/emacs.bmk")

(setq default-directory "~/Cloud/OneDrive/WorkSpace");;设置默认工作目录
;;(setq default-directory "~/Org/");;设置默认工作目录
;;(find-file "~/Org/gtd/gtd.org")

(provide 'init-myinit)
;;;init-myinit.el ends here
