;; Load config file definition
(org-babel-load-file "~/.emacs.d/configuration.org")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" default)))
 '(exec-path
   (quote
    ("/home/josh/.local/bin" "/home/josh/bin" "/usr/local/sbin" "/usr/local/bin" "/usr/sbin" "/usr/bin" "/sbin" "/bin" "/usr/games" "/usr/local/games" "/usr/lib/x86_64-linux-gnu/emacs/26.2/x86_64-linux-gnu" "/usr/bin/java/jdk1.8.0_202/bin" "/home/josh/.nvm/versions/node/v11.10.1/bin")))
 '(js-indent-level 2)
 '(package-selected-packages (quote (cider gruvbox-theme)))
 '(safe-local-variable-values
   (quote
    ((cider-shadow-cljs-default-options . "app")
     (cider-default-cljs-repl . shadow)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
