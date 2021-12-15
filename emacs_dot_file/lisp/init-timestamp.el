;;;timestamp

(add-hook 'write-file-hooks  'gnu-update-lastmodified-tag)

(defun gnu-timestamp-string ()
  (interactive)
  (format-time-string "%Y-%m-%d %H:%M:%S %z" nil nil))

(defun gnu-insert-timestamp ()
  (interactive)
  "Vivek\'s timestamp insertion function"
  (insert "Last Modified: " (gnu-timestamp-string) "\n"))

(defconst gnu-timestamp-regex
  (concat
   "[12][0-9]\\{3\\}-\\(?:0[1-9]\\|1[012]\\)-\\(?:[012][0-9]\\|3[01]\\)" " "
   "\\(?:[01][0-9]\\|2[0-3]\\)\\(?::[0-5][0-9]\\)\\{2\\}"                " "
   "[-+]\\(?:[01][0-9]\\|2[0-3]\\)\\(?:[0-5][0-9]\\)"                    ) )

(defun gnu-update-lastmodified-tag ()
  "update the Last Modified: timestamp"
  (interactive)
  (let ((tostr (concat "Last Modified: " (gnu-timestamp-string) )))
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward
          (concat "Last Modified: " gnu-timestamp-regex) nil t)
      (replace-match tostr nil t)))))

(provide 'init-timestamp)
;;init-timestamp ends here
