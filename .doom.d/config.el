;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Josh Bairstow"
      user-mail-address "joshbairstow@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq-default tab-width 2)
(setq js-indent-level 2)
(setq typescript-indent-level 2)

;; Additional evil leader bindings
(map! :leader
      (:desc "Save current buffer" "," #'save-buffer)
      (:desc "Slurp next expression" "l" #'sp-forward-slurp-sexp)
      (:desc "Slurp next expression" "C-l" #'sp-forward-barf-sexp))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Set projectile configuration options
(setq projectile-project-search-path '("~/git/"
                                       "~/git/bearly-inc/"
                                       "~/git/bb-inc/"
                                       "~/git/contracta-legal/"
                                       "~/git/art/"
                                       "~/git/kogroup/"
                                       "~/git/jb-home/"
                                       "~/.dotfiles/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   (quote
    ((cider-shadow-cljs-default-options . ":app")
     (cider-default-cljs-repl . shadow)
     (cider-shadow-cljs-default-options . "app")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#32302f"))))
 '(header-line ((t (:inherit nil :background "#32302f" :foreground "#ebdbb2")))))

;; rjsx
(use-package! rjsx-mode
  :mode "\\.jsx?$")

;; typescript
(use-package! typescript-mode
  :mode "\\.tsx?$")

;; tide
(defun setup-tide-mode()
  "tide setup"
  (interactive)
  (tide-setup)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package! tide
  :after (:all company flycheck)
  :hook ((rjsx-mode typescript-mode web-mode) . setup-tide-mode)
  :config (map! :leader
                :desc "jump to def" "jd" #'tide-jump-to-definition
                :desc "jump back" "jb" #'tide-jump-back))

(use-package! flycheck
  :after (:all tide-mode)
  :hook ((typescript-mode web-mode) . flycheck-mode)
  :init (setq flycheck-check-syntax-automatically '(save mode-enabled)))

;; prettier-js
(use-package! prettier-js
  :hook ((rjsx-mode typescript-mode web-mode) . prettier-js-mode))

(use-package! yas-minor-mode
  :hook (typescript-mode . yas-minor-mode))