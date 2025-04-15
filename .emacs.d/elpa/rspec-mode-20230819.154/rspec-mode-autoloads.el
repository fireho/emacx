;;; rspec-mode-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from rspec-mode.el

(autoload 'rspec-mode "rspec-mode" "\
Minor mode for RSpec files

\\{rspec-mode-map}

This is a minor mode.  If called interactively, toggle the `RSpec mode'
mode.  If the prefix argument is positive, enable the mode, and if it is
zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable the
mode if ARG is nil, omitted, or is a positive number.  Disable the mode
if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate the variable `rspec-mode'.

The mode's hook is called both when the mode is enabled and when it is
disabled.

(fn &optional ARG)" t)
(autoload 'rspec-verifiable-mode "rspec-mode" "\
Minor mode for Ruby files that have specs

\\{rspec-verifiable-mode-map}

This is a minor mode.  If called interactively, toggle the
`Rspec-Verifiable mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable the
mode if ARG is nil, omitted, or is a positive number.  Disable the mode
if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate the variable `rspec-verifiable-mode'.

The mode's hook is called both when the mode is enabled and when it is
disabled.

(fn &optional ARG)" t)
(autoload 'rspec-dired-mode "rspec-mode" "\
Minor mode for Dired buffers with spec files

\\{rspec-dired-mode-map}

This is a minor mode.  If called interactively, toggle the `Rspec-Dired
mode' mode.  If the prefix argument is positive, enable the mode, and if
it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable the
mode if ARG is nil, omitted, or is a positive number.  Disable the mode
if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate the variable `rspec-dired-mode'.

The mode's hook is called both when the mode is enabled and when it is
disabled.

(fn &optional ARG)" t)
(autoload 'rspec-buffer-is-spec-p "rspec-mode" "\
Return true if the current buffer is a spec.")
(autoload 'rspec-enable-appropriate-mode "rspec-mode")
(dolist (hook '(ruby-mode-hook ruby-ts-mode-hook enh-ruby-mode-hook)) (add-hook hook 'rspec-enable-appropriate-mode))
(add-hook 'rails-minor-mode-hook 'rspec-verifiable-mode)
(register-definition-prefixes "rspec-mode" '("rspec"))

;;; End of scraped data

(provide 'rspec-mode-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; rspec-mode-autoloads.el ends here
