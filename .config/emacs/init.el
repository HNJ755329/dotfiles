
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)
(setq make-backup-files nil)
(setq auto-save-default nil)

;(add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-mozc")
;(require 'mozc)
(load-file "/usr/share/emacs/site-lisp/mozc.el")
(setq default-input-method "japanese-mozc")
(prefer-coding-system 'utf-8) 

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
;(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(grip-mode markdown-preview-mode markdown-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs-Vlivedown"))
;;(custom-set-variables
;; '(livedown-autostart nil) ; automatically open preview when opening markdown files
;; '(livedown-open t)        ; automatically open the browser window
;; '(livedown-port 1337)     ; port for livedown server
;; '(livedown-browser nil))  ; browser to use
;;(require 'livedown)
