;; package manager stuff
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(require 'use-package)

(use-package langtool :ensure t :defer t)
(setq langtool-language-tool-jar "C:/bin/LanguageTool-3.7/languagetool-commandline.jar")
;;(setq langtool-language-tool-jar "D:/LanguageTool-3.7/languagetool-commandline.jar")
(setq langtool-default-language "en-US")

;; git stuff
(use-package magit :ensure t :defer t)
(use-package magit-filenotify :ensure t :defer t)
(use-package magit-find-file :ensure t :defer t)
(use-package git-timemachine :ensure t :defer t)

;; improved file and buffer open stuff
(use-package ido :ensure t :defer t)
(ido-mode t)

;;(use-package color-theme-sanityinc-solarized-light :ensure t :defer t)

(use-package wc-mode :ensure t :defer t)
(setq wc-modeline-format "Words:%w/%tw ")

;; turn off the bell
(setq ring-bell-function 'ignore)

;; path for homebrew on the mac
(setenv "PATH" (concat "/usr/local/bin:/usr/local/sbin:" (getenv "PATH")))
(setenv "PATH" (concat "~/Code/lemacs-stuff/wordstar-mode:" (getenv "PATH")))
(load-file "~/Code/lemacs-stuff/wordstar-mode/lws-mode.el")
(add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
(add-to-list 'exec-path "/usr/local/bin")

;; my wordstar mode
(require 'lws-mode)


;; tab indent mode
(setq-default indent-tabs-mode nil)

;; when in graphics, aka not console mode
(when (display-graphic-p)
  (load-theme 'sanityinc-solarized-dark t)
  (tool-bar-mode -1))

;; disable the startup screen
(setq inhibit-startup-screen t)

;; always show line numbers
;;(setq linum-format "%d ")
;;(global-linum-mode 1)
;;(setq line-number-mode nil)
(use-package smart-mode-line :ensure t :defer t)
(smart-mode-line-enable)

;; make sure home and end are line scoped
(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)

;; writing mode stuff
;;(use-package sublimity :ensure t :defer t)
;; (use-package sublimity-scroll :ensure t :defer t)
;;(use-package sublimity-attractive :ensure t :defer t)
;;(setq sublimity-attractive-centering-width 80)
;;(sublimity-mode 1)
;;(use-package sublimity-map :ensure t :defer t)
(setq cwm-centered-window-width 85)
(use-package centered-window-mode :ensure t :defer t)
;;(centered-window-mode t)
(use-package mode-local :ensure t :defer t)

;; increase spacing
(defun ltoggle-line-spacing ()
  "Toggle line spacing"
  (interactive)
  (setq line-spacing .75)
  (redraw-frame (selected-frame)))

(setq flyspell-issue-message-flag nil)
(use-package writegood-mode :ensure t :defer t)

;; auto modes
;;(setq-default major-mode 'text-mode)
(add-hook 'wordstar-mode-hook 'ltoggle-line-spacing)
(add-hook 'wordstar-mode-hook 'flyspell-mode)
;; (add-hook 'text-mode-hook 'wordstar-mode)
(add-hook 'wordstar-mode-hook 'centered-window-mode t)
(add-hook 'wordstar-mode-hook 'electric-pair-mode)
(add-hook 'wordstar-mode-hook 'wc-mode t)

(defun my-flyspell-hook ()
  (define-key flyspell-mode-map "\C-c\$" nil)
  (define-key flyspell-mode-map "\C-c" nil)
  (define-key wordstar-mode-map "\C-c" 'scroll-up-command)
  (add-to-list 'ispell-extra-args "--sug-mode=ultra"))
(add-hook 'flyspell-mode-hook 'my-flyspell-hook)

(defun my-wc-hook ()
  (define-key wc-mode-map "\C-c\C-w a" nil)
  (define-key wc-mode-map "\C-c\C-w c" nil)
  (define-key wc-mode-map "\C-c\C-w l" nil)
  (define-key wc-mode-map "\C-c\C-w w" nil)
  (define-key wc-mode-map "\C-c\C-w" nil)
  (define-key wordstar-mode-map "\C-c" 'scroll-up-command))

(add-hook 'wc-mode-hook 'my-wc-hook)

(defun my-wordstar-hook ()
  (define-key wordstar-mode-map "\C-c" 'scroll-up-command))
(add-hook 'wordstar-mode-hook 'my-wordstar-hook)

;; wrap at words
(global-visual-line-mode t)
;; highlight current line
(global-hl-line-mode +1)
;; spelling 
(setq-default ispell-program-name "aspell")
(use-package flyspell-lazy :ensure t :defer t)
(flyspell-lazy-mode 1)

;;(set-frame-parameter nil 'background-mode 'dark)

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
(use-package org :ensure t :defer t)
(use-package org-autolist :ensure t :defer t)
(use-package org-bullets :ensure t :defer t)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-startup-indented t)
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

(use-package projectile :ensure t :defer t)
(use-package org-projectile :ensure t :defer t)
(use-package ibuffer-projectile :ensure t :defer t)
(projectile-global-mode 1)

(use-package company :ensure t :defer t)
(add-hook 'after-init-hook 'global-company-mode)

(use-package clang-format :ensure t :defer t)

(use-package irony :ensure t :defer t)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(use-package cmake-ide :ensure t :defer t)
(cmake-ide-setup)

(use-package company-irony :ensure t :defer t)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;; Windows performance tweaks
;;
(when (boundp 'w32-pipe-read-delay)
  (setq w32-pipe-read-delay 0))
;; Set the buffer size to 64K on Windows (from the original 4K)
(when (boundp 'w32-pipe-buffer-size)
  (setq irony-server-w32-pipe-buffer-size (* 64 1024)))

(if (eq window-system 'w32)
    (progn
      ;; c# goo
      (setq omnisharp-server-executable-path "C:\\omnisharp-win-x64-net46.1.9-beta\\OmniSharp.exe")
      (load-library "omnisharp")
      (add-hook 'csharp-mode-hook 'omnisharp-mode)
      (setq omnisharp-debug t)
      ;;(setq omnisharp-use-http t)
      ))

;; one line at a time
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) 
;; don't accelerate scrolling
(setq mouse-wheel-progressive-speed nil)
