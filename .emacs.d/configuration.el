
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
 '(paredit
   clojure-mode
   clojure-mode-extra-font-locking
   cider
   smex
   projectile
   rainbow-delimiters
   magit
   gruvbox-theme))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(load-file "~/git/sensible-defaults.el/sensible-defaults.el")
(sensible-defaults/use-all-settings)

(add-to-list 'load-path "~/git/evil")
(require 'evil)
(evil-mode 1)

(add-to-list 'load-path "~/git/evil-adjust")
(require 'evil-adjust)
(evil-adjust)

(defun my-jk ()
  (interactive)
  (let* ((initial-key ?j)
        (final-key ?k)
        (timeout 0.5)
        (event (read-event nil nil timeout)))
    (if event
        ;; timeout met
        (if (and (characterp event) (= event final-key))
            (evil-normal-state)
          (insert initial-key)
          (push event unread-command-events))
      ;; timeout exceeded
      (insert initial-key))))

(define-key evil-insert-state-map (kbd "j") 'my-jk)

(tool-bar-mode 0)
(menu-bar-mode 0)
(blink-cursor-mode 0)
(global-linum-mode 1)
(when window-system
  (scroll-bar-mode -1))

(setq frame-title-format '((:eval (projectile-project-name))))

(load-theme 'gruvbox-dark-soft t)

(setq ring-bell-function 'ignore)

(show-paren-mode 1)

(global-prettify-symbols-mode t)

(when window-system
  (global-hl-line-mode 1))

(setq-default tab-width 2)

(setq-default indent-tabs-mode nil)

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

(add-hook 'clojure-mode-hook 'enable-paredit-mode)

(add-hook 'clojure-mode-hook 'subword-mode)

(require 'clojure-mode-extra-font-locking)
(add-hook 'clojure-mode-hook
          (lambda ()
            (setq inferior-lisp-program "lein repl")
            (font-lock-add-keywords
            nil
            '(("(\\(facts?\\)"
                (1 font-lock-keyword-face))
              ("(\\(background?\\)"
                (1 font-lock-keyword-face))))
            (define-clojure-indent (fact 1))
            (define-clojure-indent (facts 1))))

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(setq cider-repl-pop-to-buffer-on-connect t)

(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

(setq cider-repl-history-file "~/.emacs.d/cider-history")

(setq cider-repl-wrap-history t)

(add-hook 'cider-repl-mode-hook 'paredit-mode)

(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))
