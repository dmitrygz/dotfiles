;;; my/css-mode/main --- My CSS mode main package
;;; Commentary:
;;; Code:

(require 'css-mode)

(defun my/css-mode/set-style ()
  "Set the style for the CSS mode."
  (setq css-indent-offset 2))

(defun my/css-mode/hook ()
  "The CSS mode hook."
  (my/css-mode/set-style))

(add-hook 'scss-mode 'my/css-mode/hook)
(add-hook 'sass-mode 'my/css-mode/hook)
(add-hook 'css-mode 'my/css-mode/hook)

(provide 'my/css-mode/main)
;;; main.el ends here
