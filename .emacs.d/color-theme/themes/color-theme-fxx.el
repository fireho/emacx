;; Fxx Colour Theme for Emacs.
;;
;; Defines a colour scheme resembling that of the original TextMate Fxx colour theme.
;; To use add the following to your .emacs file (requires the color-theme package):
;;
;; http://wiki.nofxx.com/_detail/x:xxx2tmscreen.png
;;
;; (require 'color-theme)
;; (color-theme-initialize)
;; (load-file "~/.emacs.d/fxx-emacs/color-theme-fxx.el")
;;
;; And then (color-theme-fxx) to activate it.
;;
;; Several areas still require improvement such as recognition of code that ruby-mode doesn't
;; yet pick up (eg. parent classes), Rails/Merb keywords, or non Ruby code related areas
;; (eg. dired, HTML, etc). Please feel free to customize further and send in any improvements,
;; patches most welcome.
;;
;; Based on the twilight theme by:
;; MIT License Copyright (c) 2008 Marcus Crafter <crafterm@redartisan.com>
;; Credits due to the excellent TextMate Twilight theme
;;
;; MIT License Copyright (c) 2011 Marcos Piccinini
;;

(defun color-theme-fxx ()
  "Color theme by Marcos Piccinini, created 2011-3-3"
  (interactive)
  (color-theme-install
   '(color-theme-fxx
     ((background-color . "#111")
      (background-mode . dark)
      (border-color . "black")
      (cursor-color . "#A7A7A7")
      (foreground-color . "#eee")
      (mouse-color . "sienna1"))
     (default ((t (:background "#111" :foreground "#eee"))))
     (blue ((t (:foreground "blue"))))
     (bold ((t (:bold t))))
     (bold-italic ((t (:bold t))))
     (border-glyph ((t (nil))))
     (buffers-tab ((t (:background "black" :foreground "white"))))
     (font-lock-builtin-face ((t (:foreground "#dd7b3b"))))
     (font-lock-comment-face ((t (:foreground "#666" ))))                  ;; comment
     (font-lock-constant-face ((t (:foreground "#aa5500"))))               ;; symbol
     (font-lock-doc-string-face ((t (:foreground "#9b859d"))))
     (font-lock-function-name-face ((t (:foreground "#e9c062" :bold t))))  ;; fname
     (font-lock-keyword-face ((t (:foreground "#bb2222" :bold t))))        ;; keyword
     (font-lock-preprocessor-face ((t (:foreground "#aeaeae"))))
     (font-lock-reference-face ((t (:foreground "ff00ff"))))               ;; ??
     (font-lock-string-face ((t (:foreground "#188030" :background "#1c1c1c"))))                    ;; string
     (font-lock-type-face ((t (:foreground "#FC9C00"))))                   ;; Capital, coffee var?
     (font-lock-variable-name-face ((t (:foreground "#3387cc"))))          ;; @this
     (font-lock-warning-face ((t (:bold t :background "#420e09" :foreground "#eeeeee"))))

     (font-lock-regexp-grouping-backslash ((t (:foreground "#E9C062"))))
     (font-lock-regexp-grouping-construct ((t (:foreground "#188030"))))

     (highlight ((t (:bold t :slant italic))))
     (highline-face ((t (:background "#4a410d"))))
     (italic ((t (nil))))
     (left-margin ((t (nil))))
     (mmm-default-submode-face ((t (:background "#111"))))
     (primary-selection ((t (:background "#222"))))
     (region ((t (:background "#333")))) ;; suave e continuo!
     (minibuffer-prompt ((t (:foreground "#eeee33" :bold t))))

     (gui-element ((t (:background "#D4D0C8" :foreground "black"))))
     (mode-line ((t (:background "grey75" :foreground "black"))))
     (highlight ((t (:background "#222222"))))
     (text-cursor ((t (:background "#aaa" :foreground "black"))))
     (toolbar ((t (nil))))
     (underline ((nil (:underline nil))))

     (erc-current-nick-face ((t (:foreground "#aeaeae"))))
     (erc-default-face ((t (:foreground "#ddd"))))
     (erc-keyword-face ((t (:foreground "#cf6a4c"))))
     (erc-notice-face ((t (:foreground "#666"))))
     (erc-timestamp-face ((t (:foreground "#65b042"))))
     (erc-underline-face ((t (:foreground "c5af75"))))
     (nxml-attribute-local-name-face ((t (:foreground "#3387cc"))))
     (nxml-attribute-colon-face ((t (:foreground "#e28964"))))
     (nxml-attribute-prefix-face ((t (:foreground "#cf6a4c"))))
     (nxml-attribute-value-face ((t (:foreground "#65b042"))))
     (nxml-attribute-value-delimiter-face ((t (:foreground "#99cf50"))))
     (nxml-namespace-attribute-prefix-face ((t (:foreground "#9b859d"))))
     (nxml-comment-content-face ((t (:foreground "#666"))))
     (nxml-comment-delimiter-face ((t (:foreground "#333"))))
     (nxml-element-local-name-face ((t (:foreground "#e9c062"))))
     (nxml-markup-declaration-delimiter-face ((t (:foreground "#aeaeae"))))
     (nxml-namespace-attribute-xmlns-face ((t (:foreground "#8b98ab"))))
     (nxml-prolog-keyword-face ((t (:foreground "#c5af75"))))
     (nxml-prolog-literal-content-face ((t (:foreground "#dad085"))))
     (nxml-tag-delimiter-face ((t (:foreground "#cda869"))))
     (nxml-tag-slash-face ((t (:foreground "#cda869"))))
     (nxml-text-face ((t (:foreground "#ddd"))))
     (jabber-chat-prompt-local ((t (:foreground "#65b042"))))
     (jabber-chat-prompt-foreign ((t(:foreground "#3387cc"))))
     (jabber-roster-user-xa ((t (:foreground "#e28964"))))
     (jabber-roster-user-online ((t (:foreground "#3387cc"))))
     (jabber-roster-user-away ((t (:foreground "#9b859d"))))
     (magit-log-sha1 ((t (:foreground "#cf6a4c"))))
     (magit-log-head-label-local ((t (:foreground "#3387cc"))))
     (magit-log-head-label-remote ((t (:foreground "#65b042"))))
     (magit-branch ((t (:foreground "#e9c062"))))
     (magit-section-title ((t (:foreground "#9b859d"))))
     (magit-item-highlight ((t (:background "#1f1f1f"))))

     (zmacs-region ((t (:background "snow" :foreground "ble")))))))