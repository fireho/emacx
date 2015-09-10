;;
;;
;;
;; Emacs for fun and profit !!
;;
;;
;; User
(require 'package) ;; You might already have this line
;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/"))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

;; Load Path
(setq load-path
        (append (list nil "~/.emacs.d/vendor"
                          "~/.emacs.d/color-theme")
                          load-path))


(package-initialize)

(setq initial-scratch-message ";;# Scratch!
;;
;;    M-s     'save-buffer
;;    M-a     'magit-status
;;    M-b     'magit-branch-manager
;;    M-[     'indent-region
;;    M-]     'indent-according-to-mode
;;
;;    M-t     'ido-find-file
;;    M-p     'projectile-switch-project
;;    M-f     'projectile-find-file
;;    M-q     'kill-this-buffer
;;    M-r     'query-replace
;;    M-w     'ido-switch-buffer
;;    M-W     'bookmark-jump
;;
;;    C-f     'multi-occur-in-this-mode
;;    C-o     'occur
;;
;;    C-c t   'translate
;;
;;    howdoi
;;    git-timemachine

")


(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path "/usr/share/emacs/site-lisp/ecb")

;;
;;
;; SO Detection
(setq macosx-p (string-match "darwin" (symbol-name system-type)))
(setq linux-p (string-match "linux" (symbol-name system-type)))
(if macosx-p   (require 'osx))
(if linux-p    (require 'linux))

(server-start)

(require 'iso-transl)
(setq user-full-name "nofxx")
(setq user-mail-address "user@user.com")
(setq visible-bell 'top-bottom)
(setq-default truncate-lines t)
(setq warning-minimum-level :error)
(setq truncate-partial-width-windows nil) ;; for vertically-split windows
(setq x-select-enable-clipboard t) ;; make emacs use the clipboard
(global-linum-mode)

(defalias 'yes-or-no-p 'y-or-n-p)
(prefer-coding-system 'utf-8)
;;(desktop-save-mode 1) ;; Desktop Save Nice....

;; Transparently open compressed files
(auto-compression-mode t)

;;    Backup
;;
;; (setq backup-directory-alist `(("." . "~/.saves")))
;; (setq backup-by-copying t)
(setq backup-inhibited t)
(setq make-backup-file nil)
(setq create-lockfiles nil)
;; (setq backup-by-copying t               ; don't clobber symlinks
;;       delete-old-versions t
;;       kept-new-versions 6
;;       kept-old-versions 2
;;       version-control t)

(projectile-global-mode)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

;; Add color to a shell running in emacs 'M-x shell'
;; (require 'ansi-color)
;; (add-hook 'compilation-filter-hook 'ansi-color-for-comint-mode-on)
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Compilation minor mode
(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)
(add-hook 'eshell-mode-hook 'compilation-shell-minor-mode)

;; Tabs
;;(setq c-basic-offset 2)
;;(setq indent-tabs-mode nil)
(setq js-indent-level 2)
(setq-default tab-width 2) ; or any other preferred value

;;
;; Whitespace
;;
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing space-before-tab))
(global-whitespace-mode t)
(powerline-default-theme)
;; (setq whitespace-line-count 80 whitespace-style '(lines))
;; '(whitespace-global-modes (quote (ruby-mode emacs-lisp-mode scheme-mode enh-ruby-mode c-mode racket-mode sml-mode)))

;;
;;
;;   Requires!
;;
(require 'paren) (show-paren-mode t)
(require 'cheat)
(require 'howdoi)

;; Webs
(require 'web-mode)
(require 'slim-mode)
(require 'haml-mode)
(require 'sass-mode)
(require 'scss-mode)
(require 'less-css-mode)

(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode 1)


(add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss$'" . scss-mode)) ;; // or $
(add-to-list 'auto-mode-alist '("\\.emblem$" . slim-mode))
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

;; PKGBUILD
;;
(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))

;; GIT
;;
(autoload 'magit-status "magit" nil t)

;; Markdown
;;
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
; YAML Mode
(autoload 'yaml-mode "yaml-mode" "Major mode for editing yaml files." t)
(setq auto-mode-alist  (cons '(".yml$" . yaml-mode) auto-mode-alist))

;;
;;
;;   Cosmetics
;;
;;
(set-face-background 'vertical-border "white")
(set-face-foreground 'vertical-border "white")

;; change magit diff colors
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))

(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . diff-mode))
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

;;
;; Color Theme and fonts
(require 'color-theme)
(color-theme-initialize)
;;(color-theme-twilight)
;;(color-theme-railscasts)
;;(color-theme-sunburst)
(color-theme-fxx)

(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings 'meta))

;; Set Toolbar Text
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))

;; multi-occur cool!
(eval-when-compile
  (require 'cl))

(defun get-buffers-matching-mode (mode)
  "Returns a list of buffers where their major-mode is equal to MODE"
  (let ((buffer-mode-matches '()))
   (dolist (buf (buffer-list))
     (with-current-buffer buf
       (if (eq mode major-mode)
           (add-to-list 'buffer-mode-matches buf))))
   buffer-mode-matches))

(defun multi-occur-in-this-mode ()
  "Show all lines matching REGEXP in buffers with this major mode."
  (interactive)
  (multi-occur
   (get-buffers-matching-mode major-mode)
   (car (occur-read-primary-args))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;
;;   Ruby
;;
;;
;; Part of the Emacs Starter Kit
;;
(require 'inf-ruby)
(require 'ruby-tools)
(require 'ruby-additional)
(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)
;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(setq auto-mode-alist  (cons '(".god$" . ruby-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Assetfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

(eval-after-load 'ruby-mode
  '(progn
     ;; work around possible elpa bug
     (ignore-errors (require 'ruby-compilation))
     (setq ruby-use-encoding-map nil)
     ;; (add-hook 'ruby-mode-hook 'inf-ruby-keys)
     (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
     (define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)
     (define-key ruby-mode-map (kbd "M-/") 'ruby-toggle-string<>simbol)
     (define-key ruby-mode-map (kbd "C-c l") "lambda")))

;; (global-set-key (kbd "C-h r") 'ri)
;; We never want to edit Rubinius bytecode
(add-to-list 'completion-ignored-extensions ".rbc")

;; Require REl
(add-hook 'ruby-mode-hook
          (lambda()
            (require 'ruby-electric)
            (ruby-electric-mode t)
            ))

;;; Rake
;; (defun rake (task)
;;   (interactive (list (completing-read "Rake (default: default): "
;;                                       (pcmpl-rake-tasks))))
;;   (shell-command-to-string (concat "rake " (if (= 0 (length task)) "default" task))))


;; Clear the compilation buffer between test runs.
(eval-after-load 'ruby-compilation
  '(progn
     (defadvice ruby-do-run-w/compilation (before kill-buffer (name cmdlist))
       (let ((comp-buffer-name (format "*%s*" name)))
         (when (get-buffer comp-buffer-name)
           (with-current-buffer comp-buffer-name
             (delete-region (point-min) (point-max))))))
     (ad-activate 'ruby-do-run-w/compilation)))

;; (add-hook 'ruby-mode-hook 'run-coding-hook)

;;; Flymake

(defun flymake-ruby-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    ;; Invoke ruby with '-c' to get syntax checking
    (list "ruby" (list "-c" local-file))))

(defun flymake-ruby-enable ()
  (when (and buffer-file-name
             (file-writable-p
              (file-name-directory buffer-file-name))
             (file-writable-p buffer-file-name)
             ;;(if (fboundp 'tramp-list-remote-buffers)
             ;;    (not (subsetp
             ;;         (list (current-buffer))
             ;;  (tramp-list-remote-buffers)))
             t)
    (local-set-key (kbd "C-c d")
                   'flymake-display-err-menu-for-current-line)
    (flymake-mode t)))


;;
;;
;; LINT
;;
(defun untabify-buffer ()
 "Untabify current buffer"
 (interactive)
 (untabify (point-min) (point-max)))

(defun progmodes-hooks ()
  "Hooks for programming modes"
  (setq truncate-lines t)
  (add-hook 'before-save-hook 'progmodes-write-hooks))

(defun progmodes-write-hooks ()
  "Hooks which run on file write for programming modes"
  (prog1 nil
    (set-buffer-file-coding-system 'utf-8-unix)
    (untabify-buffer)
    ;;(copyright-update)
    (delete-trailing-whitespace)))


(add-hook 'ruby-mode-hook 'progmodes-hooks)
(add-hook 'haml-mode-hook 'progmodes-hooks)
(add-hook 'sass-mode-hook 'progmodes-hooks)
(add-hook 'js2-mode-hook 'progmodes-hooks)

;; Law & Order
(require 'rubocop)
(add-hook 'ruby-mode-hook 'rubocop-mode)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;
;;   IDO Interactively Do Things
;;
;;
(require 'ido)
(ido-mode t)
                                        ;(setq ido-enable-flex-matching t)
(setq ;; Use it for many file dialogs
 ido-everywhere t
 ido-case-fold t)  ;; Don’t be case sensitive
;;ido-use-filename-at-point t);; If the file at point exists, use that
;;ido-use-url-at-point t ;; Or if it is an URL…
;; Even if TAB completes uniquely,;; still wait for RET
;;ido-confirm-unique-completion t)
;; If the input does not exist,;; don’t look in unexpected places.
;; I probably want a new file.
;;ido-auto-merge-work-directories-length -3)

;; EMACS WRITES HERE
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-interval 9999)
 '(auto-save-timeout 9999)
 '(blink-cursor-mode nil)
 '(cua-mode t nil (cua-base))
 '(debug-on-error nil)
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(flymake-js-off t)
 '(fset (quote yes-or-no-p) t)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(rails-indent-and-complete nil)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(save-abbrevs (quote silently))
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
;;'(twit-pass "")
;;'(twit-user ""))
;;'(auto-save-visited-file-name t)
;; '(cua-mode t nil (cua-base))

;; Byte compile ~/.emacs.d
(defun byte-recompile-home ()
  (interactive)
  (byte-recompile-directory "~/.emacs.d" 0))

;;
;; Rspec & Friends
(require 'rspec-mode)
(autoload 'feature-mode "feature-mode" "Mode for editing cucumber files" t)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(defun autotest ()
  (interactive)
  (let ((buffer (shell "autotest")))
    (comint-send-string buffer "autotest\n")))

(defun autotest-switch ()
  (interactive)
  (if (equal "autotest" (buffer-name))
      (previous-buffer)
    (switch-to-buffer "autotest")))
                                        ; add to ruby mode hook:
;;(define-key ruby-mode-map "\C-c\C-s" 'autotest-switch)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;
;; Coffee-Script
;;
;; http://github.com/defunkt/coffee-mode.git
(autoload 'coffee-mode "coffee-mode" "Major mode for editing coffee files." t)
;; http://cx4a.org/software/auto-complete/manual.html#Enable_auto-complete-mode_automatically_for_specific_modes

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;
;; Findr!
;;
(autoload 'findr "findr" "Find file name." t)
(define-key global-map [(meta control S)] 'findr)

(autoload 'findr-search "findr" "Find text in files." t)
(define-key global-map [(meta control s)] 'findr-search)

(autoload 'findr-query-replace "findr" "Replace text in files." t)
(define-key global-map [(meta control r)] 'findr-query-replace)


(cua-mode t)
(setq cua-auto-tabify-rectangles nil)
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t)

(defadvice align (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice align-regexp (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice indent-relative (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(setq vhdl-indent-tabs-mode t)

(autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)
(moz-minor-mode 1)

(defun dld-deselect-frame-hook ()
  (save-some-buffers 1))

;; Save on switch buffer
(defadvice switch-to-buffer (before save-buffer-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice other-window (before other-window-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice other-frame (before other-frame-now activate)
  (when buffer-file-name (save-buffer)))


(add-hook 'deselect-frame-hook 'dld-deselect-frame-hook)

;; C/C++
(setq auto-mode-alist (append '(("\\.cu$" . c++-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("\\.pde$" . c++-mode)) auto-mode-alist))

;;
;; TODO/FIXME/BUG
;;
(lambda ()
  (font-lock-add-keywords nil
                          '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t))))


;;;;;;;;;;;;;;;;;;;;;;;;';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;
;;
;;   Shortcuts
;;
;;
;;
(global-set-key "\M-a" 'magit-status)
(global-set-key "\M-b" 'magit-branch-manager)
(global-set-key "\M-[" 'indent-region)
(global-set-key "\M-]" 'indent-according-to-mode)
(global-set-key "\M-s" 'save-buffer)

(global-set-key "\M-t" 'ido-find-file)
(global-set-key "\M-p" 'projectile-switch-project)
(global-set-key "\M-f" 'projectile-find-file)
(global-set-key "\M-q" 'kill-this-buffer)
(global-set-key "\M-r" 'query-replace)
(global-set-key "\M-w" 'ido-switch-buffer)
(global-set-key "\M-W" 'bookmark-jump)

(global-set-key [S-return] 'open-line)
(global-set-key "\C-f" 'multi-occur-in-this-mode)
(global-set-key "\C-o" 'occur)

(global-set-key"\M-i" 'run-ruby)
(global-set-key (kbd "C-M-i") 'run-ruby)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)

(global-set-key "\C-l" 'goto-line)

(global-set-key "\M-1" 'ibuffer)
(global-set-key "\M-2" 'bookmark-bmenu-list)
;; (global-set-key "\M-3" 'eshell)f

(global-set-key [f5] 'bookmark-set)
(global-set-key [f6] 'eshell)
(global-set-key [f7] 'mshell)
(global-set-key [f8] 'bookmark-jump)
(global-set-key [f9] 'recompile)
(global-set-key [f10] 'compile)

(setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")

(global-set-key [f11] 'delete-other-windows)
(global-set-key [f12] 'toggle-truncate-lines) ;; Add F12 to toggle line wrap

;; Mouse Keys
;;
(global-set-key [mouse-10] 'magit-status)
(global-set-key [mouse-9] 'magit-status)
(global-set-key [mouse-8] 'magit-status)


;; Evil commands
(put 'erase-buffer 'disabled nil)

;; Autocomplete
;; http://cx4a.org/software/auto-complete/
(setq ac-dwim t)
(global-auto-complete-mode t)

;;(setq ac-auto-start nil)
(global-set-key "\M-/" 'ac-start)

;;
;; or
;;
;;     ;; start completion when entered 3 characters
;;     (setq ac-auto-start 3)
;;

(define-key ac-complete-mode-map "\t" 'ac-complete)

;;     (define-key ac-complete-mode-map "\r" nil)
;;
(add-to-list 'ac-modes 'coffee-mode)
(add-to-list 'ac-modes 'ruby-mode)


;; Remap selfish modes...
(eval-after-load 'cc-mode
  '(progn
     (define-key c++-mode-map (kbd "M-q") 'kill-this-buffer)
     (define-key c++-mode-map (kbd "M-a") 'magit-status)
     (define-key c-mode-map (kbd "M-q") 'kill-this-buffer)
     (define-key c-mode-map (kbd "M-a") 'magit-status)))

;;
;; Le Font Face
;;
;; Monaco Inconsolata Hack
;;
(set-face-attribute 'default nil :font  "Inconsolata-17" )
(set-frame-font   "Inconsolata-17" nil t)


(let ((path (shell-command-to-string ". ~/.zshrc; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path
        (append
         (split-string-and-unquote path ":")
         exec-path)))


(eval-after-load 'mumamo
  '(progn
     (define-key mumamo-map (kbd "M-q") 'kill-this-buffer)
     (define-key mumamo-map (kbd "M-a") 'magit-status)))

(message "Good work!")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
