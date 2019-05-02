(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(add-to-list 'load-path "~/git/packages/evil")
(require 'evil)
(evil-mode 1)

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
