(setq cabbage-repository (expand-file-name "/home/user/cabbage/"))
(load (concat cabbage-repository "cabbage"))
; list the packages you want

(require 'package)

(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
(setq package-list
    '(python-environment deferred epc
        flycheck ctable jedi concurrent company cyberpunk-theme elpy
        yasnippet pyvenv highlight-indentation find-file-in-project
        sql-indent sql exec-path-from-shell iedit clojure-mode
        auto-complete popup let-alist   fiplr neotree cider
         minimap popup))


; activate all the packages
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
(global-set-key (kbd "C-x f") 'fiplr-find-file)
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)







(defun cider-eval-expression-at-point-in-repl ()
  (interactive)
  (let ((form (cider-sexp-at-point)))
    ;; Strip excess whitespace
    (while (string-match "\\`\s+\\|\n+\\'" form)
      (setq form (replace-match "" t t form)))
    (set-buffer (cider-find-or-create-repl-buffer))
    (goto-char (point-max))
    (insert form)
    (cider-repl-return)))
(global-set-key (kbd "C-`") 'cider-eval-expression-at-point-in-repl)

