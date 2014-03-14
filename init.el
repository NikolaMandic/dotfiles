(setq cabbage-repository (expand-file-name "/home/nm/.cabbage/"))
(load (concat cabbage-repository "cabbage"))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") )
(add-to-list 'package-archives
             '("marmelade" . "http://marmalade-repo.org/packages/"))
(package-refresh-contents)
(package-initialize)
(defvar my-packages '(starter-kit
                      starter-kit-lisp

                      clojure-mode
                      clojure-test-mode
                      cider))

(dolist (p my-packages)
( when (not (package-installed-p p ))
(package-install p)))
(defun append-to-buffer ()
       "Append the text of the region to BUFFER."
       (interactive)
       (let ((oldbuf (current-buffer))
         (p1 (line-beginning-position))
         (p2 (line-end-position)))

           (set-buffer (get-buffer-create "*IEX*"))
           (insert-buffer-substring oldbuf p1 p2))
       (switch-to-buffer-other-window "*IEX*")
       )
(global-set-key (kbd "M-`") 'append-to-buffer)


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
