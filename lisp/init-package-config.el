(package-initialize)


;;company config 
;; 定制 company-mode
(global-company-mode 1)
;;(company--idle-delay nil)
;; 自动补全
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; markdown windows 预览配置
;;设置变量
(when (eq system-type 'windows-nt)
 (custom-set-variables
   '(markdown-command "C:/Users/Finger/scoop/shims/pandoc.exe")
  )
 )

;; highlight-parentheses
;;括号高亮
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

;; projectile 配置
(require 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

(setq projectile-project-search-path '("~/.projects/" "~/work/"))
(setq projectile-switch-project-action #'projectile-dired)

 ;; 文件末尾
(provide 'init-package-config)
