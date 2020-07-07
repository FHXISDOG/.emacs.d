(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
  
;; ...
;; default init
;; -----------------------------------------------------------------
(require 'init-better-defaults)
;;require package
;;----------------------------------------------------------
(require 'init-packages)
;; ui
;;---------------------------------------------------
(require 'init-ui)
;; package config
;;----------------------------------
(require 'init-package-config)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-command "C:/Users/Finger/scoop/shims/pandoc.exe")
 '(send-mail-function (quote mailclient-send-it))
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrains Mono" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))
