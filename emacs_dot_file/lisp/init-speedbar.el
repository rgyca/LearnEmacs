;;; init-speedbar.el ---                             -*- lexical-binding: t; -*-

;; Copyright (C) 2021  zhou

;; Author: zhou <zhou@MNO.local>
;; Keywords: abbrev, abbrev

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(use-package speedbar
  :config
  (setq speedbar-use-images nil
	speedbar-show-unknown-files t))

(use-package sr-speedbar
  :ensure t
  :config
  (setq sr-speedbar-right-side nil
	 sr-speedbar-auto-refresh t
         sr-speedbar-max-width 25
	 sr-speedbar-width 15
	 sr-speedbar-default-width 15)
  (global-set-key (kbd " s-s ") 'sr-speedbar-toggle)
  )

  ;; (sr-speedbar-toggle)

(provide 'init-speedbar)
;;; init-speedbar.el ends here
