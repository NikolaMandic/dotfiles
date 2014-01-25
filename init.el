

(add-to-list 'load-path "~/.emacs.d")
(require 'package)
(add-to-list 'package-archives
'("marmelade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(defvar my-packages '(clojure-mode
clojure-test-mode
cider))
(defvar my-packages '(starter-kit
                      starter-kit-lisp
                                         
                      clojure-mode
                      clojure-test-mode
                      cider))

(dolist (p my-packages)
( when (not (package-installed-p p ))
(package-install p)))
(windmove-default-keybindings)
(setq windmove-wrap-around t)

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
