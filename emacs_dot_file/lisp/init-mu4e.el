;; load mu4e from the installation path.
;; yours might differ check with the Emacs installation
(use-package mu4e
  :load-path  "/usr/local/share/emacs/site-lisp/mu/mu4e/")

;; for sending mails
(require 'smtpmail)

;; we installed this with homebrew
(setq mu4e-mu-binary (executable-find "mu"))

;; this is the directory we created before:
(setq mu4e-maildir "~/.maildir")

;; this command is called to sync imap servers:
(setq mu4e-get-mail-command (concat (executable-find "mbsync") " -a"))
;; how often to call it in seconds:
(setq mu4e-update-interval 300)

;; save attachment to desktop by default
;; or another choice of yours:
(setq mu4e-attachment-dir "~/Downloads")

;; rename files when moving - needed for mbsync:
(setq mu4e-change-filenames-when-moving t)

;; list of your email adresses:
(setq mu4e-user-mail-address-list '(;"dummy@icloud.com"
                                    ;;"dummy@gmail.com"
                                    "zhoujhwd@icloud.com"))

;; check your ~/.maildir to see how the subdirectories are called
;; for the generic imap account:
;; e.g `ls ~/.maildir/example'
(setq   mu4e-maildir-shortcuts
        '(("/icloud/INBOX" . ?i)
;;          ("/icloud/Sent Messages" . ?I)
;;          ("/gmail/INBOX" . ?g)
;;          ("/gmail/[Gmail]/Sent Mail" . ?G)
;;          ("/example/INBOX" . ?e)
          ("/icloud/Sent" . ?E)))



;; the following is to show shortcuts in the main view.
(add-to-list 'mu4e-bookmarks
             (make-mu4e-bookmark
              :name "Inbox - icloud"
              :query "maildir:/icloud/INBOX"
              :key ?i))
;; (add-to-list 'mu4e-bookmarks
;;              (make-mu4e-bookmark
;;               :name "Inbox - Gmail"
;;               :query "maildir:/gmail/INBOX"
;;               :key ?g))
;; (add-to-list 'mu4e-bookmarks
;;              (make-mu4e-bookmark
;;               :name "Inbox - example"
;;               :query "maildir:/example/INBOX"
;;               :key ?e))


(setq mu4e-contexts
      `(,(make-mu4e-context
          :name "icloud"
          :enter-func
          (lambda () (mu4e-message "Enter zhoujhwd@icloud.com context"))
          :leave-func
          (lambda () (mu4e-message "Leave zhoujhwd@icloud.com context"))
          :match-func
          (lambda (msg)
            (when msg
              (mu4e-message-contact-field-matches msg
                                                  :to "zhoujhwd@icloud.com")))
          :vars '((user-mail-address . "zhoujhwd@icloud.com" )
                  (user-full-name . "Zhoujhwd")
                  (mu4e-drafts-folder . "/icloud/Drafts")
                  (mu4e-refile-folder . "/icloud/Archive")
                  (mu4e-sent-folder . "/icloud/Sent_Messages")
                  (mu4e-trash-folder . "/icloud/Deleted_Messages")))

        ;; ,(make-mu4e-context
        ;;   :name "example"
        ;;   :enter-func
        ;;   (lambda () (mu4e-message "Enter dummy@example.de context"))
        ;;   :leave-func
        ;;   (lambda () (mu4e-message "Leave dummy@example.de context"))
        ;;   :match-func
        ;;   (lambda (msg)
        ;;     (when msg
        ;;       (mu4e-message-contact-field-matches msg
        ;;                                           :to "dummy@example.de")))
        ;;   :vars '((user-mail-address . "dummy@example.de")
        ;;           (user-full-name . "Dummy McDummerson")
        ;;           ;; check your ~/.maildir to see how the subdirectories are called
        ;;           ;; e.g `ls ~/.maildir/example'
        ;;           (mu4e-drafts-folder . "/example/Drafts")
        ;;           (mu4e-refile-folder . "/example/Archive")
        ;;           (mu4e-sent-folder . "/example/Sent")
        ;;           (mu4e-trash-folder . "/example/Trash")))
	))

(setq mu4e-context-policy 'pick-first) ;; start with the first (default) context;
(setq mu4e-compose-context-policy 'ask) ;; ask for context if no context matches;




;; gpg encryptiom & decryption:
;; this can be left alone
(require 'epa-file)
(epa-file-enable)
(setq epa-pinentry-mode 'loopback)
(auth-source-forget-all-cached)

;; don't keep message compose buffers around after sending:
(setq message-kill-buffer-on-exit t)

;; send function:
(setq send-mail-function 'sendmail-send-it
      message-send-mail-function 'sendmail-send-it)

;; send program:
;; this is exeranal. remember we installed it before.
(setq sendmail-program (executable-find "msmtp"))

;; select the right sender email from the context.
(setq message-sendmail-envelope-from 'header)

;; chose from account before sending
;; this is a custom function that works for me.
;; well I stole it somewhere long ago.
;; I suggest using it to make matters easy
;; of course adjust the email adresses and account descriptions
(defun timu/set-msmtp-account ()
  (if (message-mail-p)
      (save-excursion
        (let*
            ((from (save-restriction
                     (message-narrow-to-headers)
                     (message-fetch-field "from")))
             (account
              (cond
               ;; ((string-match "dummy@icloud.com" from) "icloud")
               ;; ((string-match "dummy@gmail.com" from) "gmail")
               ((string-match "zhoujhwd@icloud.com" from) "icloud"))))
          (setq message-sendmail-extra-arguments (list '"-a" account))))))

(add-hook 'message-send-mail-hook 'timu/set-msmtp-account)

;; mu4e cc & bcc
;; this is custom as well
(add-hook 'mu4e-compose-mode-hook
          (defun timu/add-cc-and-bcc ()
            "My Function to automatically add Cc & Bcc: headers.
    This is in the mu4e compose mode."
            (save-excursion (message-add-header "Cc:\n"))
            (save-excursion (message-add-header "Bcc:\n"))))

;; mu4e address completion
(add-hook 'mu4e-compose-mode-hook 'company-mode)




;; store link to message if in header view, not to header query:
(setq org-mu4e-link-query-in-headers-mode nil)
;; don't have to confirm when quitting:
(setq mu4e-confirm-quit nil)
;; number of visible headers in horizontal split view:
(setq mu4e-headers-visible-lines 20)
;; don't show threading by default:
(setq mu4e-headers-show-threads nil)
;; hide annoying "mu4e Retrieving mail..." msg in mini buffer:
(setq mu4e-hide-index-messages t)
;; customize the reply-quote-string:
(setq message-citation-line-format "%N @ %Y-%m-%d %H:%M :\n")
;; M-x find-function RET message-citation-line-format for docs:
(setq message-citation-line-function 'message-insert-formatted-citation-line)
;; by default do not show related emails:
(setq mu4e-headers-include-related nil)
;; by default do not show threads:
(setq mu4e-headers-show-threads nil)


(provide 'init-mu4e)
;; init-mu4e.el ends here
