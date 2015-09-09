;;
;; OS X Stuff
;;
;;(setq visible-bell t)
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#111" :foreground "#eee" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 240 :width normal :foundry "apple" :family "Inconsolata"))))
 '(mumamo-background-chunk-major ((t (:background "black"))))
 '(mumamo-background-chunk-submode1 ((t (:background "gray12")))))


;;(require 'carbon-font)
;;(fixed-width-set-default-fontset "-apple-inconsolata-medium-r-normal--18-*-*-*-*-*-iso10646-1")

;;(setq mac-command-key-is-meta nil)
;;(setq cua-enable-cua-keys nil)

;;(global-set-key "\M-x" 'cua-cut-region)
;;(global-set-key "\M-c" 'cua-copy-region)
;;(global-set-key "\M-v" 'cua-paste)
;;(global-set-key "\M-z" 'undo)
;; (global-set-key [(alt q)] 'save-buffers-kill-emacs)
;; (global-set-key [(alt w)] 'kill-buffer-and-window)
(global-set-key [(alt p)] 'ps-print-buffer)
(global-set-key [(alt f)] 'isearch-forward)
(global-set-key [(alt g)] 'query-replace)
(global-set-key [(alt l)] 'goto-line)
(global-set-key [(alt m)] 'iconify-frame)
(global-set-key [(alt n)] 'new-frame)
(global-set-key [kp-delete] 'delete-char)
(global-set-key [(control kp-home)] 'beginning-of-buffer)
(global-set-key [(control kp-end)] 'end-of-buffer)

;; Mac Open/Execute from dired
;;     (define-key dired-mode-map "w"
;;(function
;;(lambda ()
;;; (interactive)
;; (shell-command (concat "/usr/bin/open " (dired-get-filename))))))))
;;(set-default-font “Insconsolata-18”)
;;(set-face-attribute 'default nil :font "Inconsolata:pixelsize=23")

;;(let ((path (shell-command-to-string ". ~/.zshrc; echo -n $PATH")))
;;  (setenv "PATH" path)
;;  (setq exec-path
;;        (append
;;         (split-string-and-unquote path ":")
;;         exec-path)))

(provide 'osx)
