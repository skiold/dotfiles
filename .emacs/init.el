(server-start)
(prefer-coding-system 'utf-8)

;; common keybindings
(global-set-key [f5] 'compile)

(require 'cc-mode)
(add-to-list 'c-mode-common-hook
  (lambda () (setq c-syntactic-indentation nil))
  (lambda () (setq c-basic-offset 2)))

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-min-dir-content 1)

;; disable auto-fill mode
(setq text-mode-hook (quote (turn-off-auto-fill)))
;; to preserve other hooks use add-hook
;; (add-hook 'LaTeX-mode-hook 'turn-off-auto-fill)
(unless (fboundp 'auto-detect-longlines) (defun auto-detect-longlines () t))

;; c default styles
;; style for wordpres work. Use tabs
(c-add-style "my-wp-style"
  '("awk"
    (c-basic-offset . 4)
    (tab-width . 4)
    (indent-tabs-mode . t)))

;; package config & initialization
(require 'package)
(setq package-load-list '(all))     ;; List of packages to load
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(unless package-archive-contents    ;; Refresh the packages descriptions
  (package-refresh-contents))
(unless (package-installed-p 'org)  ;; Make sure the Org package is
  (package-install 'org))
(package-initialize)

;; modular config loader
;; ripped from https://lists.gnu.org/archive/html/emacs-devel/2011-03/msg00257.html
;; original descriptions et al
(defvar init-directory "~/.emacs.d/init-el"
  "Directory in which PJ keeps elisp files to be executed on startup")

(push init-directory load-path)
(byte-recompile-directory init-directory 0)
(mapc 'load
      (mapcar (lambda(x) (substring x 0 -3))
              (directory-files init-directory nil ".*\\.el$")))
