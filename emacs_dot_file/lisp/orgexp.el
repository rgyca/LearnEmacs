;;; init-orgexport.el --- template                   -*- lexical-binding: t; -*-

;; Copyright (C) 2021  zhou

;; Author: zhou <zhou@MNO.local>
;; Keywords: abbrev, abbrev,

;;;;;;;;;;;;;;;;;;;;;;;; org=>latex
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))

(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
	       '("article" "\\documentclass[11pt,a4paper]{article}
%\\usepackage{fontspec,xltxtra,xunicode}
\\usepackage[slantfont,boldfont]{xeCJK}

\\setCJKmainfont[BoldFont=STHeiti,ItalicFont=STKaiti]{STSong}
\\setCJKsansfont{STHeiti}
\\setCJKmonofont{STFangsong}

\\setCJKfamilyfont{zhsong}{STSong}
\\setCJKfamilyfont{zhhei}{STHeiti}
\\setCJKfamilyfont{zhfs}{STFangsong}
\\setCJKfamilyfont{zhkai}{STKaiti}

\\newcommand*{\\songti}{\\CJKfamily{zhsong}} % 宋体
\\newcommand*{\\heiti}{\\CJKfamily{zhhei}}   % 黑体
\\newcommand*{\\kaishu}{\\CJKfamily{zhkai}}  % 楷书
\\newcommand*{\\fangsong}{\\CJKfamily{zhfs}} % 仿宋
"
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		 ("\\paragraph{%s}" . "\\paragraph*{%s}")
		 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))

	       ))

(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
	       '("book" "\\documentclass[11pt]{book} 
%\\usepackage{fontspec,xltxtra,xunicode}
\\usepackage[slantfont,boldfont]{xeCJK}

\\setCJKmainfont[BoldFont=STHeiti,ItalicFont=STKaiti]{STSong}
\\setCJKsansfont{STHeiti}
\\setCJKmonofont{STFangsong}

\\setCJKfamilyfont{zhsong}{STSong}
\\setCJKfamilyfont{zhhei}{STHeiti}
\\setCJKfamilyfont{zhfs}{STFangsong}
\\setCJKfamilyfont{zhkai}{STKaiti}

\\newcommand*{\\songti}{\\CJKfamily{zhsong}} % 宋体
\\newcommand*{\\heiti}{\\CJKfamily{zhhei}}   % 黑体
\\newcommand*{\\kaishu}{\\CJKfamily{zhkai}}  % 楷书
\\newcommand*{\\fangsong}{\\CJKfamily{zhfs}} % 仿宋
"
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		 ("\\paragraph{%s}" . "\\paragraph*{%s}")
		 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
	       ))


(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
	       '("slide" "\\documentclass[aspectratio=169]{beamer}
%\\usepackage{fontspec,xunicode,xltxtra,beamerthemesplit}
\\usepackage{beamerthemesplit}
\\usepackage[slantfont,boldfont]{xeCJK} 
\\usetheme{Warsaw} %{Madrid}
\\beamertemplateballitem
\\setlength{\\parindent}{2em}       %设置缩进为两个大写M的宽度，大约为两个汉字的宽度
%==================================================
\\setCJKmainfont[BoldFont=STHeiti,ItalicFont=STKaiti]{STSong}
\\setCJKsansfont{STHeiti}
\\setCJKmonofont{STFangsong}

\\setCJKfamilyfont{zhsong}{STSong}
\\setCJKfamilyfont{zhhei}{STHeiti}
\\setCJKfamilyfont{zhfs}{STFangsong}
\\setCJKfamilyfont{zhkai}{STKaiti}

\\newcommand*{\\songti}{\\CJKfamily{zhsong}} % 宋体
\\newcommand*{\\heiti}{\\CJKfamily{zhhei}}   % 黑体
\\newcommand*{\\kaishu}{\\CJKfamily{zhkai}}  % 楷书
\\newcommand*{\\fangsong}{\\CJKfamily{zhfs}} % 仿宋
"
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		 ("\\paragraph{%s}" . "\\paragraph*{%s}")
		 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
	       ) )

(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
	       '("report" "\\documentclass[11pt]{report}
\\usepackage{hyperref}"
		 ("\\part{%s}" . "\\part*{%s}")
		 ("\\chapter{%s}" . "\\chapter*{%s}")
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
	       ))



(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
                              "xelatex -interaction nonstopmode %f"
			      "/Applications/Skim.app/Contents/SharedSupport/displayline %o"
			      ))


;; (use-package ox-reveal
;;   :ensure ox-reveal)

;; (setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
;; (setq org-reveal-theme "black")
;; (setq org-reveal-width 1200)
;; (setq org-reveal-height 1000)
;; (setq org-reveal-margin "0.1")
;; (setq org-reveal-min-scale "0.5")
;; (setq org-reveal-max-scale "2.5")
;; (setq org-reveal-transition "cube")
;; (setq org-reveal-plugins '(classList markdown zoom notes))
;; (setq org-reveal-control t)
;; (setq org-reveal-center t)
;; (setq org-reveal-progress t)
;; (setq Org-Reveal-title-slide nil)
;; (setq org-reveal-mathjax t)
;; (setq org-reveal-history nil)


(provide 'init-orgexport)

;;;init-orgexport.el ends here
