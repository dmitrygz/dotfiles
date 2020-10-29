;; Evil
(unless (package-installed-p 'undo-tree)
  (package-install 'undo-tree))
(unless (package-installed-p 'evil)
  (package-install 'evil))
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))
(unless (package-installed-p 'evil-collection)
  (package-install 'evil-collection))
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; Counsel, Ivy, Swiper
(unless (package-installed-p 'counsel)
  (package-install 'counsel))
(use-package counsel
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (ivy-mode 1))

;; Magit
(unless (package-installed-p 'magit)
  (package-install 'magit))
(use-package magit
  :ensure t
  :config
  (evil-define-key 'normal 'global (kbd "<leader>gs") 'magit-status))
(unless (package-installed-p 'evil-magit)
  (package-install 'evil-magit))
(use-package evil-magit
  :after magit
  :ensure t)

;; restart-emacs
(unless (package-installed-p 'restart-emacs)
  (package-install 'restart-emacs))

;; evil-mc
(unless (package-installed-p 'evil-mc)
  (package-install 'evil-mc))
(use-package evil-mc
  :ensure t
  :config
  (global-evil-mc-mode 1)
  (evil-define-key 'normal 'global (kbd "C-n") 'evil-mc-make-and-goto-next-match)
  (evil-define-key 'normal 'global (kbd "C-p") 'evil-mc-make-and-goto-previous-match)
  (add-hook
   'evil-mc-mode-hook
   (lambda ()
     (evil-define-key 'normal 'local (kbd "<escape>") 'evil-mc-undo-all-cursors))))

;; bm (Bookmarks)
(unless (package-installed-p 'bm)
  (package-install 'bm))
(use-package bm
  :ensure t
  :demand t
  :config
  (setq bm-repository-file "~/.emacs.d/bm-repository")
  :bind (("<f2>" . bm-next)
	 ("S-<f2>" . bm-previous)
	 ("C-<f2>" . bm-toggle)))

;; evil-nerd-commenters (Comments)
(unless (package-installed-p 'evil-nerd-commenter)
  (package-install 'evil-nerd-commenter))
(use-package evil-nerd-commenter
  :ensure t
  :config
  (evil-define-key 'normal 'global (kbd "C-/") 'evilnc-comment-or-uncomment-lines))

;; Projectile
(unless (package-installed-p 'projectile)
  (package-install 'projectile))
(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (setq projectile-project-search-path '("~/Projects" "~/Work"))
  (setq projectile-globally-ignored-directories (append projectile-globally-ignored-directories '("node_modules" ".venv" "venv" "build" "output" "target" ".git" ".vs")))
  (setq projectile-globally-ignored-files (append projectile-globally-ignored-files '("package-lock.json" "yarn.lock" "Cargo.lock" "*.exe" "*.out" "*.lib" "*.dll")))
  (evil-define-key 'normal 'global (kbd "<leader>pr") 'projectile-discover-projects-in-search-path)
  (evil-define-key 'normal 'global (kbd "<leader>ps") 'projectile-switch-project)
  (evil-define-key 'normal 'global (kbd "<leader>pf") 'projectile-find-file)
  (evil-define-key 'normal 'global (kbd "<f6>") 'projectile-compile-project))

;; Elisp-format
(load "third-party/elisp-format.el")

;; clang-format
(load "third-party/clang-format.el")

;; Company
(unless (package-installed-p 'company)
  (package-install 'company))
(use-package company
  :ensure t
  :config
  (setq
   company-idle-delay nil                     ; Do not show completions automatically
   company-tooltip-flip-when-above t
   company-tooltip-align-annotations t
   company-selection-wrap-around t
   company-show-numbers t)
  (global-set-key (kbd "TAB") 'company-complete)
  (define-key company-active-map (kbd "TAB") 'company-select-next-or-abort)
  (define-key company-active-map (kbd "S-TAB") 'company-select-previous-or-abort))
(unless (package-installed-p 'company-box)
  (package-install 'company-box))
(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

;; all-the-icons
(unless (package-installed-p 'all-the-icons)
  (package-install 'all-the-icons))
(use-package all-the-icons
  :ensure t)

;; Treemacs
(unless (package-installed-p 'treemacs)
  (package-install 'treemacs))
(use-package treemacs
  :ensure t
  :config
  (global-set-key (kbd "<f8>") 'treemacs)
  (setq
   treemacs-indentation 2
   treemacs-indentation-string            " "
   treemacs-position                      'left
   treemacs-show-cursor                   nil
   treemacs-show-hidden-files             t
   treemacs-silent-filewatch              nil
   treemacs-silent-refresh                nil
   treemacs-sorting                       'alphabetic-asc
   treemacs-width                         35))
(use-package treemacs-evil
  :ensure t)
(use-package treemacs-projectile
  :ensure t)
(use-package treemacs-all-the-icons
  :ensure t)

;; Language Server Protocol (LSP)
(unless (package-installed-p 'lsp-mode)
  (package-install 'lsp-mode))
(use-package lsp-mode
  :ensure t
  :commands lsp)
(unless (package-installed-p 'lsp-ivy)
  (package-install 'lsp-ivy))
(use-package lsp-ivy
  :ensure t
  :commands lsp-ivy-workspace-symbol)
(unless (package-installed-p 'lsp-treemacs)
  (package-install 'lsp-treemacs))
(use-package lsp-treemacs
  :commands
  lsp-treemacs-errors-list
  lsp-treemacs-symbols
  lsp-treemacs-references
  lsp-treemacs-implementations
  :config
  ;; Enable bidirectional synchronization of lsp workspace folders and treemacs projects.
  (lsp-treemacs-sync-mode 1)
  (global-set-key (kbd "<leader>te") 'lsp-treemacs-errors-list)
  (global-set-key (kbd "<leader>ts") 'lsp-treemacs-symbols))
(unless (package-installed-p 'lsp-ui)
  (package-install 'lsp-ui))
(use-package lsp-ui
  :ensure t)

;; Web-mode
(unless (package-installed-p 'web-mode)
  (package-install 'web-mode))
(use-package web-mode
  :ensure t
  :mode (("\\.html?\\'" . web-mode)
         ("\\.tsx\\'" . web-mode)
         ("\\.jsx\\'" . web-mode)
         ("\\.js\\'" . web-mode)
         ("\\.ts\\'" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-block-padding 2
        web-mode-comment-style 2
        web-mode-enable-css-colorization t
        web-mode-enable-auto-pairing t
        web-mode-enable-comment-keywords t
        web-mode-enable-current-element-highlight t))

;; Rust-mode
(unless (package-installed-p 'rust-mode)
  (package-install 'rust-mode))
(use-package rust-mode
  :ensure t
  :hook (rust-mode . lsp))

;; Doom themes
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))