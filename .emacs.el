(require 'ido)
(ido-mode t)
(tool-bar-mode -1)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'custom-theme-load-path "~/Code/emacs-color-theme-solarized/")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
;;(load-file "~/Code/virtualenvwrapper.el/virtualenvwrapper.el")
(setq ring-bell-function 'ignore)
(setenv "PATH" (concat "/usr/local/bin:/usr/local/sbin:" (getenv "PATH")))
;;(global-visual-line-mode t)
;;(add-hook 'eshell-preoutput-filter-functions
;;           'ansi-color-filter-apply)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(setq-default indent-tabs-mode nil)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support

;(require 'rvm)
;(rvm-use-default) ;; use rvm's default ruby for the current Emacs session
;(load-file "~/.emacs.d/lisp/weblogger.el")

;(add-to-list 'load-path "~/Dropbox/PlatformIndepenence/global/color-theme-6.6.0")
;(require 'color-theme)
;(color-theme-initialize)
;(require 'color-theme-solarized)
;(eval-after-load "color-theme" '(color-theme-solarized-dark))
(load-theme 'solarized-light t)
;;(require 'w3m-load)
;;(if (= emacs-major-version 23)
;;	(require 'w3m-ems)
;;  (require 'w3m))

(setq linum-format "%d ")
(global-linum-mode 1)

(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 125 :width normal :foundry "outline" :family "Source Code Pro"))))
 '(bold ((t (:weight semi-bold))))
 '(org-todo ((t (:background "#c6c6c6" :foreground "#042028" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(org-upcoming-deadline ((t (:foreground "highlightColor")))))

;;(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
;; '(inhibit-startup-screen t))

;; move autosave dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
                `((".*" ,temporary-file-directory t)))
;(add-to-list 'backup-directory-alist (cons "." "~/.emacs.d/backups"))
;;(setq backup-directory-alist (cons "." "~/.emacs.d/backups"))
;(setq auto-save-file-name-transforms
;      `((".*" ,temporary-file-directory t)))

;; set showing full path name in title bar
(setq-default
 frame-title-format
 (list '((buffer-file-name " %f" (dired-directory 
	 			  dired-directory
				  (revert-buffer-function " %b"
				  ("%b - Dir:  " default-directory)))))))
(setq-default
 icon-title-format
 (list '((buffer-file-name " %f" (dired-directory
                                  dired-directory
                                  (revert-buffer-function " %b"
                                  ("%b - Dir:  " default-directory)))))))

;; Org mode stuff
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)
(setq org-agenda-files (list "~/Dropbox/org/top.org"))
(setq org-log-done 'note)

;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/org/")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/org/top.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-files "top.org")


;; setting the prompt to "[{Current Working Dir}] " e.g. "[~/stuff] "
(setq eshell-prompt-function
       (lambda ()
         (concat "[" (eshell/pwd) "] ")))
(setq eshell-prompt-regexp "[[][^#$\n]*[]] ")

(require 'ls-lisp)
(setq ls-lisp-ignore-case t)
(setq eshell-glob-case-insensitive t)
(setq eshell-cmpl-ignore-case t)

'(eshell-glob-case-insensitive t)
(setq-default ispell-program-name "aspell")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(background-color "#fcf4dc")
 '(background-mode light)
 '(compile-command "python /Users/lukas/code/Broadway/build2/scons-2.3.0/Scripts/scons --vars=/Users/lukas/code/Broadway/local-vars.py -U -s --verbose build")
 '(cursor-color "#52676f")
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(foreground-color "#52676f")
 '(org-directory "~/Dropbox/org")
 '(org-mobile-directory "~/Dropbox/Apps/MobileOrg" t)
 '(org-mobile-files org-agenda-files t)
 '(org-mobile-inbox-for-pull "~/Dropbox/org/top.org" t)
 '(weblogger-config-alist (quote (("default" "http://technology-hates-you.com/lm3m/xmlrpc.php" "lm3m" "" "1")))))
(setq org-agenda-prefix-format
      '((agenda . " %i %?-12t% s")
        (timeline . "  % s")))
