;;; my/cpp-mode/util --- description
;;; Commentary:
;;; Code:

(require 'projectile)

(defun my/cpp-mode/find-corresponding-file ()
  "Find the file that corresponds to this one
(header file to source file or vice-versa),
and open it in current window."
  (interactive)
  (let ((corresponding-file-name) (base-file-name (buffer-get-base-file-name)))
    (progn
      (cond
       ((string-match "\\.cpp" buffer-file-name)
        (setq corresponding-file-name (concat base-file-name ".hpp")))
       ((string-match "\\.hpp" buffer-file-name)
        (setq corresponding-file-name (concat base-file-name ".cpp"))))
(if corresponding-file-name (find-file corresponding-file-name)
  (error "Unable to find a corresponding C++ file")))))

(defun my/cpp-mode/find-corresponding-file-other-window ()
  "Execute `my/cpp-mode-find-corresponding-file` in other window."
  (interactive)
  (find-file-other-window buffer-file-name)
  (my/cpp-mode/find-corresponding-file)
  (other-window -1))

(defun my/cpp-mode/set-style ()
  "Set the style."
  (c-add-style "custom" '("bsd" (indent-tabs-mode . nil)
                          (c-basic-offset . 2)
                          (tab-width . 2)
                          (c-offsets-alist . ((comment-intro . 0)
                                              (case-label . +)))))
  (c-set-style "custom"))

(defun my/cpp-mode/bind-keys ()
  "Bind the keys for the C mode."
  (local-set-key (kbd "<f8>") 'clang-format-buffer)
  (local-set-key (kbd "<f9>") 'cmake-ide-compile)
  (local-set-key (kbd "<f12>") 'my/cpp-mode/find-corresponding-file)
  (local-set-key (kbd "S-<f12>") 'my/cpp-mode/find-corresponding-file-other-window))

(provide 'my/cpp-mode/util)
;;; util.el ends here
