(package-initialize)

(require 'cl)

(setq 
    inhibit-splash-screen 1 ;;关闭帮助画面
    inhibit-compacting-font-caches t ;;解决windows下面卡顿问题
    backup-directory-alist `(("." . "~/.emacsmo.d/backup")) ;;备份文件位置
    make-backup-file-name-function 'my-backup-file-name
    make-backup-files nil ;; 不生成备份文件
    auto-save-default nil ;; 不自动保存
    initial-frame-alist (quote ((fullscreen . maximized))) ;;打开之后全屏
    default-directory "~" ;; 默认文件打开的位置
	ring-bell-function 'ignore
;;	url-proxy-services '(("no_proxy" . "localhost:1081") ;;设置代理
;;						 ("http" . "localhost:1081") 
;;						 ("https" . "localhost:1081")
;;						 )
    )
;; default minor mode
(column-number-mode 1) ;;显示column
(electric-pair-mode 1) ;;自动补全括号
(menu-bar-mode -1) ;;不显示菜单栏
(scroll-bar-mode -1) ;;不显示滚动条
(tool-bar-mode -1) ;; 不显示工具栏
;;tab 宽度
(custom-set-variables
 '(tab-width 4)
)
;;不同操作系统不同配置
;;(when (eq system-type 'windows-nt)
;;  (setq
;;   shell-file-name "/c/Windows/system32/cmd.exe"
;;   )
;; )
;;显示行号
(global-display-line-numbers-mode)
;;高亮当前行
(global-hl-line-mode 1)
;; yes/no -> y/n
(fset 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "s-SPC") nil)
;; 选中之后复制直接删除
(delete-selection-mode 1)
;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)
;;显示启动信息
(add-hook 'emacs-startup-hook
    (lambda ()
        (message "Emacs ready in %s with %d garbage collections."
            (format "%.2f seconds"
                (float-time
                    (time-subtract after-init-time before-init-time)))
        gcs-done)))
;; make backup to a designated dir, mirroring the full path

(defun my-backup-file-name (fpath)
  "Return a new file path of a given file path.
If the new path's directories does not exist, create them."
  (let* (
        (backupRootDir "~/.emacs.d/backup/")
        (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath )) ; remove Windows driver letter in path, for example, “C:”
        (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") ))
        )
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath
  )
  )
;; Englist Font set 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))
;; Chinese Font 配制中文字体
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "思源黑体" :size 18)))

;; 自动补全
(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; example
					    ("fhx" "fuhongxu")
					   ))

;; dired mode config
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
;;======================== windows打开中文文件乱码 =============================
;; 编码设置 begin
(set-language-environment 'Chinese-GB)
;; default-buffer-file-coding-system变量在emacs23.2之后已被废弃，使用buffer-file-coding-system代替
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq-default pathname-coding-system 'euc-cn)
(setq file-name-coding-system 'euc-cn)

;; 另外建议按下面的先后顺序来设置中文编码识别方式。
;; 重要提示:写在最后一行的，实际上最优先使用; 最前面一行，反而放到最后才识别。
;; utf-16le-with-signature 相当于 Windows 下的 Unicode 编码，这里也可写成
;; utf-16 (utf-16 实际上还细分为 utf-16le, utf-16be, utf-16le-with-signature等多种)
(prefer-coding-system 'cp950)
(prefer-coding-system 'gb2312)
(prefer-coding-system 'cp936)
(prefer-coding-system 'gb18030)

;(prefer-coding-system 'utf-16le-with-signature)
(prefer-coding-system 'utf-16)

;; 新建文件使用utf-8-unix方式
;; 如果不写下面两句，只写
;; (prefer-coding-system 'utf-8)
;; 这一句的话，新建文件以utf-8编码，行末结束符平台相关
(prefer-coding-system 'utf-8-dos)
(prefer-coding-system 'utf-8-unix)
;; 编码设置 end

(defun window-half-height ()
     (max 1 (/ (1- (window-height (selected-window))) 2)))
   
(defun scroll-up-half ()
     (interactive)
     (scroll-up (window-half-height)))
   
(defun scroll-down-half ()         
     (interactive)                    
     (scroll-down (window-half-height)))

(defun scroll-half-page-down ()
  "scroll down half the page"
  (interactive)
  (scroll-down (/ (window-body-height) 2)))

(defun scroll-half-page-up ()
  "scroll up half the page"
  (interactive)
  (scroll-up (/ (window-body-height) 2)))

(global-set-key (kbd "C-v") 'scroll-up-half)
(global-set-key (kbd "M-v") 'scroll-down-half)
;; 文件末尾

(provide 'init-better-defaults)
