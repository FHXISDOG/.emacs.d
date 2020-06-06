(package-initialize)
(setq 
    inhibit-splash-screen 1 ;;关闭帮助画面
    inhibit-compacting-font-caches t ;;解决windows下面卡顿问题
    backup-directory-alist `(("." . "~/.emacs.d/backup")) ;;备份文件位置
    make-backup-file-name-function 'my-backup-file-name
    make-backup-files nil ;; 不生成备份文件
    auto-save-default nil ;; 不自动保存
    initial-frame-alist (quote ((fullscreen . maximized))) ;;打开之后全屏
    default-directory "~" ;; 默认文件打开的位置
    menu-bar-mode t
)
;;显示行号
(global-display-line-numbers-mode)
;; 不显示工具栏
(tool-bar-mode -1)
;; yes/no -> y/n
(fset 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "s-SPC") nil)
;; 选中之后复制直接删除
(delete-selection-mode 1)
;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)

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
 '(default ((t (:family "JetBrains Mono" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))
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
;; 文件末尾

(provide 'init-better-defaults)
