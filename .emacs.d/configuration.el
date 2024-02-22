(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(defvar my-packages
  '(paredit
    cider
    smex
    rainbow-delimiters
    magit))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/git/packages/awesome-tab")
(require 'awesome-tab)
(awesome-tab-mode t)

(add-to-list 'load-path "~/git/packages/projectile")
(require 'projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-project-search-path '("~/git/"))

(add-to-list 'load-path "~/git/packages/evil")
(require 'evil)
(evil-mode 1)

(add-to-list 'load-path "~/git/packages/evil-leader")
(require 'evil-leader)
(global-evil-leader-mode 1)
(evil-leader/set-leader ",")
(evil-leader/set-key "," 'save-buffer)
(evil-leader/set-key "t" 'awesome-tab-ace-jump)

(add-to-list 'load-path "~/git/packages/evil-adjust")
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

(menu-bar-mode -1)

(tool-bar-mode -1)

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(blink-cursor-mode 0)

(setq ring-bell-function 'ignore)

(global-linum-mode 1)

(setq inhibit-startup-message t)



(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'gruvbox-dark-soft t)

(show-paren-mode 1)

(add-hook 'clojure-mode-hook 'enable-paredit-mode)

(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(setenv "PATH" (concat (getenv "PATH") ":/usr/bin/java/jdk1.8.0_202/bin"))
(setq exec-path (append exec-path '("/usr/bin/java/jdk1.8.0_202/bino")))
