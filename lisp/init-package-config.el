(package-initialize)


;;company config 

;; 定制 company-mode
(global-company-mode 1)
;;(company--idle-delay nil)




(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;;设置变量
(when (eq system-type 'windows-nt)
 (custom-set-variables
   '(markdown-command "C:/Users/Finger/scoop/shims/pandoc.exe")
  )
)
 ;; 文件末尾
(provide 'init-package-config)
