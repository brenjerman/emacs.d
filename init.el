(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  (package-initialize))

(setq inhibit-startup-message t)
;; auto-complete framework
;; (condition-case nil
;;     (init--install-packages)
;;   (error
;;    (package-refresh-contents)
;;    (init--install-packages)))

(load "~/.emacs.d/PLScript_mode.el")
(add-hook 'plscript-mode-hook
	  (lambda () 
	    (setq-local company-backends (append '((company-dabbrev-code)) company-backends))))

(require 'company)
(global-company-mode 't)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-default-style "stroustrup")
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 2)
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(inhibit-startup-screen t)
 '(mwheel-follow-mouse t)
 '(package-selected-packages
   (quote
    (find-file-in-project counsel ivy yasnippet evil-leader company))))

(require 'yasnippet)
(yas-global-mode 1)
(setq yas/prompt-functions '(yas/ido-prompt))

(require 'evil)
(evil-mode 1)

(show-paren-mode)

(require 'find-file-in-project)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq enable-recursive-minibuffers t)

(require 'evil-leader)
(global-evil-leader-mode)
(setq evil-leader/in-all-states 1)

(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;; functions to insert a centered comment 
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "<SPC>c" 'pl/insert-section-comment
  "b" 'plscript-add-break-point
  "c" 'comment-region
  "f" 'counsel-find-file
  "g" 'counsel-git
  "i" 'indent-for-tab-command
  "jc" 'evil-ace-jump-char-mode
  "jw" 'evil-ace-jump-word-mode
  "k" 'kill-buffer
  "s" 'query-replace
  "jc" 'evil-ace-jump-char-mode
  "jw" 'evil-ace-jump-word-mode
  "tg" 'yas-insert-snippet
  "u" 'uncomment-region
  "3" 'evil-window-vsplit)

(defun my-esc (prompt)
  "Functionality for escaping generally.  Includes exiting Evil insert state and C-g binding. "
  (cond
   ;; If we're in one of the Evil states that defines [escape] key, return [escape] so as
   ;; Key Lookup will use it.
   ((or (evil-insert-state-p) (evil-normal-state-p) (evil-replace-state-p) (evil-visual-state-p)) [escape])
   (t (kbd ""))))
;;(define-key key-translation-map (kbd "C-c") 'my-esc)
;; Works around the fact that Evil uses read-event directly when in operator state, which
;; doesn't use the key-translation-map.
;;(define-key evil-operator-state-map (kbd "C-c") 'keyboard-quit)
;; Not sure what behavior this changes, but might as well set it, seeing the Elisp manual's
;; documentation of it.
;; (set-quit-char "C-c")

(global-linum-mode 1)
;; ido
;; (ido-mode 1)
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (setq ido-file-extensions-order '(".dat" ".pls" ".cpp" ".h" ".pg"))


;;(global-evil-surround-mode 1)

;; plscript
(require 'vc) ;; rcs

;; reroute autosaves/backups to temp directory
;; (setq backup-directory-alist
;;       `((".*" . ,temporary-file-directory)))
;; (setq auto-save-file-name-transforms
;;       `((".*"  ,temporary-file-directory)))

;; (message "Deleting old backup files...")
;; (let ((week (* 60 60 24 7))
;;       (current (float-time (current-time))))
;;   (dolist (file (directory-files temporary-file-directory t))
;;     (when (and (backup-file-name-p file)
;;                (> (- current (float-time (fifth (file-attributes file))))
;;                   week))
;;       (message "%s" file)
;;       (delete-file file))))

;; (setq python-shell-interpreter "/c/Users/seaton.benjamin/AppData/Local/Programs/Python/Python35-32/python.exe")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
