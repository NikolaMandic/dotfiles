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



  (require 'evil)
(evil-mode 1)
   (setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq evil-emacs-state-modes nil)
   (defun my-move-key (keymap-from keymap-to key)
     "Moves key binding from one keymap to another, deleting from the old location. "
     (define-key keymap-to key (lookup-key keymap-from key))
     (define-key keymap-from key nil))
   (my-move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
(my-move-key evil-motion-state-map evil-normal-state-map " ")
 (define-key evil-normal-state-map "c" nil)
(define-key evil-motion-state-map "cu" 'universal-argument)
   (define-key key-translation-map (kbd "ch") (kbd "C-h"))
   (define-key key-translation-map (kbd "cx") (kbd "C-x"))

   ;; Note: lexical-binding must be t in order for this to work correctly.
   (defun make-conditional-key-translation (key-from key-to translate-keys-p)
     "Make a Key Translation such that if the translate-keys-p function returns true,
   key-from translates to key-to, else key-from translates to itself.  translate-keys-p
   takes key-from as an argument. "
     (define-key key-translation-map key-from
       (lambda (prompt)
         (if (funcall translate-keys-p key-from) key-to key-from))))
   (defun my-translate-keys-p (key-from)
     "Returns whether conditional key translations should be active.  See make-conditional-key-translation function. "
     (and
       ;; Only allow a non identity translation if we're beginning a Key Sequence.
       (equal key-from (this-command-keys))
       (or (evil-motion-state-p) (evil-normal-state-p) (evil-visual-state-p))))
(define-key evil-normal-state-map "c" nil)
 (require 'package)
  (push '("marmalade" . "http://marmalade-repo.org/packages/")
        package-archives )
  (push '("melpa" . "http://melpa.milkbox.net/packages/")
        package-archives)
(package-initialize)

  (require 'evil)
(evil-mode 1)
   ;; -*- lexical-binding: t -*-
   ;; Note: lexical-binding must be t in order for this to work correctly.
    ;;; C-c as general purpose escape key sequence.
   ;;;
   (defun my-esc (prompt)
     "Functionality for escaping generally.  Includes exiting Evil insert state and C-g binding. "
     (cond
      ;; If we're in one of the Evil states that defines [escape] key, return [escape] so as
      ;; Key Lookup will use it.
      ((or (evil-insert-state-p) (evil-normal-state-p) (evil-replace-state-p) (evil-visual-state-p)) [escape])
      ;; This is the best way I could infer for now to have C-c work during evil-read-key.
      ;; Note: As long as I return [escape] in normal-state, I don't need this.
      ;;((eq overriding-terminal-local-map evil-read-key-map) (keyboard-quit) (kbd ""))
      (t (kbd "C-g"))))
   (define-key key-translation-map (kbd "C-c") 'my-esc)
   ;; Works around the fact that Evil uses read-event directly when in operator state, which
   ;; doesn't use the key-translation-map.
   (define-key evil-operator-state-map (kbd "C-c") 'keyboard-quit)
   ;; Not sure what behavior this changes, but might as well set it, seeing the Elisp manual's
   ;; documentation of it.
   (set-quit-char "C-c")

   (define-key evil-motion-state-map "\C-x\C-]" 'find-tag)

  (when (fboundp 'cl-loop)
        ;; cl-loop iterates from ASCII '!' to ASCII '~'.
        (cl-loop for ascii-code-i from 33 to 126 by 1 do
                 (make-conditional-key-translation (kbd (format "c%c" ascii-code-i))
                                                   (kbd (format "C-%c" ascii-code-i))
                                                   'my-translate-keys-p)))
  (load "elscreen" "ElScreen" t)
    (elscreen-start)
    (define-key evil-normal-state-map (kbd "C-w t") 'elscreen-create) ;creat tab
(define-key evil-normal-state-map (kbd "C-w x") 'elscreen-kill) ;kill tab
    (define-key evil-normal-state-map "gT" 'elscreen-previous) ;previous tab
    (define-key evil-normal-state-map "gt" 'elscreen-next) ;next tab
    (defun evil-toggle-input-method ()
      "when toggle on input method, switch to evil-insert-state if possible.
    when toggle off input method, switch to evil-normal-state if current state is evil-insert-state"
      (interactive)
      (if (not current-input-method)
          (if (not (string= evil-state "insert"))
              (evil-insert-state))
        (if (string= evil-state "insert")
            (evil-normal-state)
            ))
      (toggle-input-method))
    
(global-set-key (kbd "C-\\") 'evil-toggle-input-method)
   (key-chord-define evil-normal-state-map ",," 'evil-force-normal-state)
   (key-chord-define evil-visual-state-map ",," 'evil-change-to-previous-state)
   (key-chord-define evil-insert-state-map ",," 'evil-normal-state)
   (key-chord-define evil-replace-state-map ",," 'evil-normal-state)
  (defun make-conditional-key-translation (key-from key-to translate-keys-p)
     "Make a Key Translation such that if the translate-keys-p function returns true,
   key-from translates to key-to, else key-from translates to itself.  translate-keys-p
   takes key-from as an argument. "
     (define-key key-translation-map key-from
       (lambda (prompt)
         (if (funcall translate-keys-p key-from) key-to key-from))))
   (defun my-translate-keys-p (key-from)
     "Returns whether conditional key translations should be active.  See make-conditional-key-translation function. "
     (and
       ;; Only allow a non identity translation if we're beginning a Key Sequence.
       (equal key-from (this-command-keys))
       (or (evil-motion-state-p) (evil-normal-state-p) (evil-visual-state-p))))
(define-key evil-normal-state-map "c" nil)
   (define-key evil-motion-state-map "cu" 'universal-argument)
   (make-conditional-key-translation (kbd "ch") (kbd "C-h") 'my-translate-keys-p)
   (make-conditional-key-translation (kbd "g") (kbd "C-x") 'my-translate-keys-p)

   (define-key evil-motion-state-map "cu" 'universal-argument)
   (make-conditional-key-translation (kbd "ch") (kbd "C-h") 'my-translate-keys-p)
   (make-conditional-key-translation (kbd "g") (kbd "C-x") 'my-translate-keys-p)
   ;; change mode-line color by evil state
   (lexical-let ((default-color (cons (face-background 'mode-line)
                                      (face-foreground 'mode-line))))
     (add-hook 'post-command-hook
       (lambda ()
         (let ((color (cond ((minibufferp) default-color)
                            ((evil-insert-state-p) '("#e80000" . "#ffffff"))
                            ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                            ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                            (t default-color))))
           (set-face-background 'mode-line (car color))
           (set-face-foreground 'mode-line (cdr color))))))
(eval-after-load "evil"
  '(progn
     (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
     (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
     (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)))
