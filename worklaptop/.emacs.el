(require 'ido)
(ido-mode t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(setq ring-bell-function 'ignore)
(setenv "PATH" (concat "/usr/local/bin:/usr/local/sbin:" (getenv "PATH")))
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(setq-default indent-tabs-mode nil)

(when (display-graphic-p)
  (load-theme 'solarized t)
  (tool-bar-mode -1))

(setq inhibit-startup-screen t)
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
 '(org-upcoming-deadline ((t (:foreground "gray50" :weight bold)))))

;; move autosave dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
                `((".*" ,temporary-file-directory t)))
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
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#839496" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#002b36"))
 '(background-color "#fcf4dc")
 '(background-mode dark)
 '(compile-command
   "python /Users/lukas/code/Broadway/build2/scons-2.3.0/Scripts/scons --vars=/Users/lukas/code/Broadway/local-vars.py -U -s --verbose build")
 '(cursor-color "#52676f")
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "ba078b3b404e071f335fa68d052160f24de625f90cde3166794dfa5d147ad139" "da41bd3b7c22675bb45cdeb737d4e03d24a8b6ee2de5bfde7ccfbecb09a9fd48" "e372efe45a3836a92fe964cb2ef8d12340c63b6e4dcbe50ee58d2803c608b482" "541beaee2213f0b03318eda1fedefd3ed28b598aca676dd6a0798eaff9eb1283" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(fci-rule-color "#073642")
 '(foreground-color "#52676f")
 '(frame-background-mode (quote dark))
 '(org-directory "~/Dropbox/org")
 '(org-mobile-directory "~/Dropbox/Apps/MobileOrg" t)
 '(org-mobile-files org-agenda-files t)
 '(org-mobile-inbox-for-pull "~/Dropbox/org/top.org" t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil)
 '(weblogger-config-alist
   (quote
    (("default" "http://technology-hates-you.com/lm3m/xmlrpc.php" "lm3m" "" "1")))))
(setq org-agenda-prefix-format
      '((agenda . " %i %?-12t% s")
        (timeline . "  % s")))
