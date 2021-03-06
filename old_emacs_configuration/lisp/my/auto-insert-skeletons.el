;;; my/auto-insert-skeletons --- Package that defines skeletons for file-types
;;; Commentary:
;;; Code:

(require 'my/util)
(require 'my/user-info)

(defun my/gen-doxygen-file-top-comment ()
  "Generate a Doxygen top comment."
  (concat "/**\n"
          " * @file " (my/util/buffer-file-name-nondir) "\n"
          " * @author " my/user-info/name-and-email "\n"
          " * @date " (my/util/get-current-date) "\n"
          " * @brief Brief file description.\n"
          " *\n"
          " * The long description of the file.\n"
          " */\n"))

(defun my/gen-c-file-top-comment ()
  "Generate a C file top comment."
  (my/gen-doxygen-file-top-comment))

(defun my/gen-cpp-file-top-comment ()
  "Generate a C++ file top comment."
  (my/gen-doxygen-file-top-comment))

(defun my/gen-lua-file-top-comment ()
  "Generate a Lua file top comment."
  (concat
   "-- File: " (my/util/buffer-file-name-nondir) "\n"
   "-- Creation date: " (my/util/get-current-date) "\n"
   "-- Creator: " my/user-info/name-and-email "\n"
   "-- Description:\n"))

(defun my/gen-elisp-file-top-comment ()
  "Generate a Emacs Lisp file top comment."
  (let ((file-name-nondir (my/util/buffer-file-name-nondir)))
    (concat ";;; " file-name-nondir " --- description\n" ";;; Commentary:\n" ";;; Code:\n\n\n"
            "(provide '" (my/util/buffer-get-base-file-name) ")\n" ";;; " file-name-nondir " ends here")))

(defun my/gen-sh-file-top-comment ()
  "Generate a SH file top comment."
  (concat
   "# File: " (my/util/buffer-file-name-nondir) "\n"
   "# Creation date: " (my/util/get-current-date) "\n"
   "# Creator: " my/user-info/name-and-email "\n"
   "# Description:\n"))

(defun my/gen-python-file-top-comment ()
  "Generate a Python file top comment."
  (my/gen-sh-file-top-comment))

(defun my/gen-make-file-top-comment ()
  "Generate a file top comment for the Make files."
  (my/gen-sh-file-top-comment))

(defun my/gen-cmake-file-top-comment ()
  "Generate a file top comment for the CMake file."
  (my/gen-sh-file-top-comment))

(defun my/gen-css-file-top-comment ()
  "Generate a file top comment for the CSS file."
  (concat
   "/**\n"
   " * The style brief description.\n"
   " *\n"
   " * The style long description.\n"
   " *\n"
   " * @author " my/user-info/name-and-email "\n"
   " * @copyright " (my/util/get-current-year) "\n"
   " * @license MIT\n"
   " */"))

(defun my/gen-sass-file-top-comment ()
  "Generate a file top comment for the SASS file."
  (my/gen-css-file-top-comment))

(defun my/gen-scss-file-top-comment ()
  "Generate a file top comment for the SCSS file."
  (my/gen-css-file-top-comment))

(defun my/gen-stylus-file-top-comment ()
  "Generate a file top comment for the Stylus file."
  (my/gen-css-file-top-comment))

(defun my/gen-html-file-top-comment ()
  "Generate a file top comment for the HTML file."
  (concat
   "<!--\n" "  File: " (my/util/buffer-file-name-nondir) "\n"
   "  Creation date: " (my/util/get-current-date) "\n"
   "  Creator: " my/user-info/name-and-email "\n"
   "  Description:\n" "-->\n"))

(defun my/gen-js-file-top-comment ()
  "Generate a file top comment for the JavaScript file."
  (concat "/**\n"
          " * @file " (my/util/buffer-file-name-nondir) "\n"
          " * @author " my/user-info/name-and-email "\n"
          " */\n"))

(defun my/gen-yaml-file-top-comment ()
  "Generate a file top comment for the YAML file."
  (my/gen-sh-file-top-comment))

(defun my/gen-dart-file-top-comment ()
  "Generate a file top comment for the Dart file."
  (concat "// File: " (my/util/buffer-file-name-nondir) "\n"
          "// Creation date: " (my/util/get-current-date) "\n"
          "// Creator: " my/user-info/name-and-email))

(defun my/gen-c-source-file-skeleton ()
  "Generate a skeleton for the C source file."
  (let ((base-file-name (my/util/buffer-get-base-file-name)))
    (concat (my/gen-c-file-top-comment) "\n#include \"" base-file-name ".h\"\n")))

(defun my/gen-cpp-source-file-skeleton ()
  "Generate a skeleton for the C++ source file."
  (let ((base-file-name (my/util/buffer-get-base-file-name)))
    (concat (my/gen-c-file-top-comment) "\n#include \"" base-file-name ".hpp\"\n")))

(defun my/gen-c-header-file-skeleton ()
  "Generate a skeleton for the C header file."
  (let ((base-file-name (my/util/buffer-get-base-file-name)))
    (let ((upcase-base-file-name (upcase base-file-name)))
      (concat (my/gen-c-file-top-comment) "\n" "#ifndef " upcase-base-file-name "_H\n" "#define "
              upcase-base-file-name "_H\n\n\n\n" "#endif /* " upcase-base-file-name "_H */"))))

(defun my/gen-cpp-header-file-skeleton ()
  "Generate a skeleton for the C++ header file."
  (my/gen-c-header-file-skeleton))

(defun my/gen-lua-file-skeleton ()
  "Generate a skeleton for the Lua file."
  (concat (my/gen-lua-file-top-comment) "\n"))

(defun my/gen-elisp-file-skeleton ()
  "Generate a skeleton for the Emacs Lisp file."
  (my/gen-elisp-file-top-comment))

(defun my/gen-sh-file-skeleton ()
  "Generate a skeleton for the Sh file."
  (my/gen-sh-file-top-comment))

(defun my/gen-python-file-skeleton ()
  "Generate a skeleton for the Python file."
  (my/gen-python-file-top-comment))

(defun my/gen-make-file-skeleton ()
  "Generate a skeleton for the Make file."
  (my/gen-make-file-top-comment))

(defun my/gen-cmake-file-skeleton ()
  "Generate a skeleton for the CMake file."
  (my/gen-cmake-file-top-comment))

(defun my/gen-css-file-skeleton ()
  "Generate a skeleton for the CSS file."
  (my/gen-css-file-top-comment))

(defun my/gen-sass-file-skeleton ()
  "Generate a skeleton for the SASS file."
  (my/gen-sass-file-top-comment))

(defun my/gen-scss-file-skeleton ()
  "Generate a skeleton for the SCSS file."
  (my/gen-scss-file-top-comment))

(defun my/gen-stylus-file-skeleton ()
  "Generate a skeleton for the Stylus file."
  (my/gen-stylus-file-top-comment))

(defun my/gen-html-file-skeleton ()
  "Generate a skeleton for the HTML file."
  (my/gen-html-file-top-comment))

(defun my/gen-js-file-skeleton ()
  "Generate a skeleton for the JavaScript file."
  (concat
   (my/gen-js-file-top-comment)
   "\n"
   "\'use strict\';"))

(defun my/gen-yaml-file-skeleton ()
  "Generate a file top comment for the YAML file."
  (my/gen-yaml-file-top-comment))

(defun my/gen-dart-file-skeleton ()
  "Generate a file top comment for the Dart file."
  (my/gen-dart-file-top-comment))

;; Definition of skeletons

(define-auto-insert '("\\.c" . "C source file skeleton")
  '("Short description: " (my/gen-c-source-file-skeleton)))

(define-auto-insert '("\\.h" . "C header file skeleton")
  '("Short description: " (my/gen-c-header-file-skeleton)))

(define-auto-insert '("\\.cpp" . "C++ source file skeleton")
  '("Short description: " (my/gen-cpp-source-file-skeleton)))

(define-auto-insert '("\\.hpp" . "C++ header file skeleton")
  '("Short description: " (my/gen-cpp-header-file-skeleton)))

(define-auto-insert '("\\.lua" . "Lua file skeleton")
  '("Short description: " (my/gen-lua-file-skeleton)))

(define-auto-insert '("\\.el" . "Emacs Lisp file skeleton")
  '("Short description: " (my/gen-elisp-file-skeleton)))

(define-auto-insert '("\\.sh" . "Sh file skeleton")
  '("Short description: " (my/gen-sh-file-skeleton)))

(define-auto-insert '("\\.py" . "Python file skeleton")
  '("Short description: " (my/gen-python-file-skeleton)))

(define-auto-insert '("\\.mk" . "Make file skeleton")
  '("Short description: " (my/gen-make-file-skeleton)))

(define-auto-insert '("Makefile" . "Make file skeleton")
  '("Short description: " (my/gen-make-file-skeleton)))

(define-auto-insert '("CMakeLists.txt" . "CMake file skeleton")
  '("Short description: " (my/gen-cmake-file-skeleton)))

(define-auto-insert '("\\.cmake" . "CMake file skeleton")
  '("Short description: " (my/gen-cmake-file-skeleton)))

(define-auto-insert '("\\.css" . "CSS file skeleton")
  '("Short description: " (my/gen-css-file-skeleton)))

(define-auto-insert '("\\.scss" . "SCSS file skeleton")
  '("Short description: " (my/gen-scss-file-skeleton)))

(define-auto-insert '("\\.sass" . "SASS file skeleton")
  '("Short description: " (my/gen-sass-file-skeleton)))

(define-auto-insert '("\\.styl" . "Stylus file skeleton")
  '("Short description: " (my/gen-stylus-file-skeleton)))

(define-auto-insert '("\\.html" . "HTML file skeleton")
  '("Short description: " (my/gen-html-file-skeleton)))

(define-auto-insert '("\\.\\(js?\\|jsx\\|ts\\|tsx\\)\\'" . "JavaScript file skeleton")
  '("Short description: " (my/gen-js-file-skeleton)))

(define-auto-insert '("\\.yml" . "YAML file skeleton")
  '("Short description: " (my/gen-yaml-file-skeleton)))

(define-auto-insert '("\\.dart" . "Dart file skeleton")
  '("Short description: " (my/gen-dart-file-skeleton)))

(provide 'my/auto-insert-skeletons)
;;; auto-insert-skeletons.el ends here
