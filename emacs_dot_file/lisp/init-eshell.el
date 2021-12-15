;;; eshell config

(defun with-face (str &rest face-plist)
  (propertize str 'face face-plist))

(defun shk-eshell-prompt ()
  (concat
     (with-face "┌─" :foreground "red")   
     (with-face "\x5468" :foreground "red")
     (with-face (concat (eshell/pwd) "") :foreground "#87af5f")
;     (with-face "\x008")
     (with-face "\x89C1" :foreground "#f75f5f")
     (with-face (format-time-string "(%Y-%m-%d %H:%M)" (current-time)) :foreground "#87af5f")
     (with-face "\x7EA2" :foreground "#ffaf5f")
     (with-face "\n")
     (with-face "└─>" :foreground "red")   
     (with-face ">" :foreground "#f75f5f")
     (with-face ">" :foreground "#ffaf5f")
     (with-face ">" :foreground "#87af5f")
     (with-face " #" :foreground "#322B2B")
     (with-face " " :foreground "green")
     ))
(setq eshell-prompt-function 'shk-eshell-prompt)
(setq eshell-highlight-prompt nil)

;; (setq eshell-prompt-function (lambda nil
;; (concat
;; (propertize (concat (eshell/pwd) " ") 'face `(:foreground "#f75f5f"))
;; (propertize (format-time-string "(%Y-%m-%d %H:%M) " (current-time)) 'face `(:foreground "#ffaf5f"))
;; (propertize "\n")
;; (propertize user-login-name 'face `(:foreground "#87af5f"))
;; (propertize "@" 'face `(:foreground "red"))
;; (propertize "localhost" 'face `(:foreground "green"))
;; (propertize ">" 'face `(:foreground "#f75f5f"))
;; (propertize ">" 'face `(:foreground "#ffaf5f"))
;; (propertize ">" 'face `(:foreground "#87af5f"))
;; (propertize " $ " 'face `(:foreground "green"))
;; )))

;; (setq eshell-highlight-prompt nil)

(provide 'init-eshell)
;; init-eshell ends here
