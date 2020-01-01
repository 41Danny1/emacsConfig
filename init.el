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

;; Mods
(evil-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
