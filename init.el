(package-initialize)

;; Elpa Fix
(when (and (version<  "25" emacs-version)
           (version< emacs-version "26.3"))
  ;; backport fix for https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34341
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

;; Setting repos
(setq package-enable-at-startup nil
      package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Managed packages
(use-package undo-tree)
(use-package evil)
;;(use-package moe-theme)
(use-package web-mode)
(use-package dracula-theme)
(use-package diff-hl)
(use-package omnisharp)
(use-package company)

;; Mods
(evil-mode 1)
(load-theme 'dracula t)
(global-diff-hl-mode 1)
;; Cutting down on clutter files
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
;; Alternatively, use "~/.backups-emacs"
(setq auto-save-default nil)
(setq create-lockfiles nil)
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; UI fixes
(menu-bar-mode -1)
(tool-bar-mode -1)
;;(scroll-bar-mode -1)
(if (fboundp 'set-scroll-bar-mode) (set-scroll-bar-mode 'nil))

;; Omnisharp setup
(add-hook 'csharp-mode-hook 'omnisharp-mode)
(eval-after-load
 'company
 '(add-to-list 'company-backends 'company-omnisharp))
(add-hook 'csharp-mode-hook #'company-mode)
(add-hook 'csharp-mode-hook #'flycheck-mode)

;; Files
;; php
(add-to-list 'auto-mode-alist
	     '("\\.php\\'" . web-mode))
(add-hook 'web-mode 'display-line-numbers-mode)
;; c#
(add-hook 'csharp-mode-hook 'display-line-numbers-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("28caf31770f88ffaac6363acfda5627019cac57ea252ceb2d41d98df6d87e240" default)))
 '(package-selected-packages
   (quote
    (company omnisharp diff-hl dracula-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
