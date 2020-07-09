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




