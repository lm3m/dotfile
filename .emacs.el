;; package manager stuff
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; improved file and buffer open stuff
(require 'ido)
(ido-mode t)

;; wordstar mode
(require 'ws-mode)

(require 'wc-mode)

;; turn off the bell
(setq ring-bell-function 'ignore)

;; path for homebrew on the mac
(setenv "PATH" (concat "/usr/local/bin:/usr/local/sbin:" (getenv "PATH")))

;; use ansi colors in console mode
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; tab indent mode
(setq-default indent-tabs-mode nil)

;; when in graphics, aka not console mode
(when (display-graphic-p)
  (load-theme 'solarized-light t)
  (tool-bar-mode -1))

;; disable the startup screen
(setq inhibit-startup-screen t)

;; always show line numbers
(setq linum-format "%d")
(global-linum-mode 1)
(setq line-number-mode nil)

;; make sure home and end are line scoped
(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)

;; writing mode stuff
;;(require 'sublimity)
;; (require 'sublimity-scroll)
;;(require 'sublimity-attractive)
;;(setq sublimity-attractive-centering-width 80)
;;(sublimity-mode 1)
;;(require 'sublimity-map)
(setq cwm-centered-window-width 85)
(require 'centered-window-mode)
(centered-window-mode t)
(require 'mode-local)
;; increase spacing
(defun ltoggle-line-spacing ()
  "Toggle line spacing"
  (interactive)
  (setq line-spacing .75)
  (redraw-frame (selected-frame)))

(setq flyspell-issue-message-flag nil)
;;(setq-default major-mode 'text-mode)
(add-hook 'wordstar-mode-hook 'ltoggle-line-spacing)
(add-hook 'wordstar-mode-hook 'flyspell-mode)
;; (add-hook 'text-mode-hook 'wordstar-mode)
(add-hook 'wordstar-mode-hook 'electric-pair-mode)
(add-hook 'wordstar-mode-hook 'wc-mode t)

;; wrap at words
(global-visual-line-mode t)
;; highlight current line
(global-hl-line-mode +1)
;; spelling 
(add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
(setq-default ispell-program-name "aspell")

;; set the font
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 125 :width normal :foundry "outline" :family "Source Code Pro"))))
 '(bold ((t (:weight semi-bold))))
 '(org-todo ((t (:background "#c6c6c6" :foreground "#042028" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(org-upcoming-deadline ((t (:foreground "highlightColor")))))

;; move autosave dir
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

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
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)
(setq org-agenda-files (list "~/Dropbox/org/top.org"))
(setq org-log-done 'note)
(setq org-capture-templates
  '(    ;; ... other templates
    ("j" "Journal Entry"
         entry (file+datetree "~/Dropbox/org/journal.org")
         "* %<%I:%M %P> - %?\n\n  From: %l"
         :empty-lines 1)
        ;; ... other templates
    ))
;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/org/")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/org/top.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-files "top.org")
(setq org-agenda-prefix-format
      '((agenda . " %i %?-12t% s")
        (timeline . "  % s")))

;; setting the prompt to "[{Current Working Dir}] " e.g. "[~/stuff] "
(setq eshell-prompt-function
       (lambda ()
         (concat "[" (eshell/pwd) "] ")))
(setq eshell-prompt-regexp "[[][^#$\n]*[]] ")

;; in eshell setup 'ls'
(require 'ls-lisp)
(setq ls-lisp-ignore-case t)
(setq eshell-glob-case-insensitive t)
(setq eshell-cmpl-ignore-case t)
'(eshell-glob-case-insensitive t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(background-color "#fcf4dc")
 '(background-mode light)
 '(compile-command
   "python /Users/lukas/code/Broadway/build2/scons-2.3.0/Scripts/scons --vars=/Users/lukas/code/Broadway/local-vars.py -U -s --verbose build")
 '(cursor-color "#52676f")
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(foreground-color "#52676f")
 '(org-directory "~/Dropbox/org" t)
 '(org-mobile-directory "~/Dropbox/Apps/MobileOrg" t)
 '(org-mobile-files org-agenda-files t)
 '(org-mobile-inbox-for-pull "~/Dropbox/org/top.org" t)
 '(package-selected-packages
   (quote
    (centered-window-mode magit wc-mode sublimity minimap solarized-theme)))
 '(wc-modeline-format "Words: %w/%tw ")
 '(weblogger-config-alist
   (quote
    (("default" "http://technology-hates-you.com/lm3m/xmlrpc.php" "lm3m" "" "1")))))

