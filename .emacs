;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(manoj-dark))
 '(custom-safe-themes
   '("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))
 '(org-agenda-files '("~/org/life.org"))
 '(org-agenda-fontify-priorities t t)
 '(org-priority-faces
   '((65 :foreground "magenta" :weight bold)
     (66 :foreground "green3")
     (67 :foreground "orange")))
 '(package-selected-packages
   '(add-node-modules-path
     web-beautify
     column-enforce-mode
     indent-tools
     prettier-js
     js2-mode
     go-playground
     org-super-agenda
     undo-tree powerline
     smart-mode-line
     hydra
     exec-path-from-shell
     go-mode
     helm-gtags
     function-args
     )
   ))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(package-install-selected-packages)
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; Inspiration for these settings taken from the following configs:
;; http://aaronbedra.com/emacs.d/

;; General emacs Settings
;; (load-theme 'solarized-dark t)
(global-auto-revert-mode t)
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)
(menu-bar-mode -1)
(global-display-line-numbers-mode)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(show-paren-mode t)

;; Global Key Settings
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c C-a") "∀")
(global-set-key (kbd "C-c C-e") "∃")
(global-set-key (kbd "C-c C-f") "⇒")
(global-set-key (kbd "C-c C-n") 'elfeed)
(global-set-key (kbd "<f5>") 'delete-file)
(global-set-key (kbd "<f12>") (lambda () (interactive) (find-file "~/.emacs")))
(global-set-key (kbd "C-c C-r") (lambda() (interactive) (load-file "~/.emacs")))
(global-set-key (kbd "C-c C-q") 'query-replace)
(global-set-key [mouse-4] (lambda () (interactive) (scroll-down 1)))
(global-set-key [mouse-5] (lambda () (interactive) (scroll-up 1)))

;; Calendar Settings
(require 'calendar)
(defun mimick-diary-insert-entry (&optional omit-day-of-week-p)
  (interactive)
  (end-of-buffer)
  (open-line 2)
  (end-of-buffer)
  (insert (calendar-date-string (calendar-current-date) nil omit-day-of-week-p))
  (end-of-buffer)
  (insert " "))
(setq diary-file "~/workspace/philosophy/journal")
(add-hook 'diary-mode-hook 'mimick-diary-insert-entry)
(define-key global-map (kbd "C-c C-j") (lambda ()
				       (interactive)
				       (find-file "~/workspace/philosophy/journal")))
(define-key global-map (kbd "C-c C-c") 'calendar)

;; Elfeed Settings
(setq elfeed-feeds
      '("http://nullprogram.com/feed/"
        "http://planet.emacsen.org/atom.xml"
	"https://www.technologyreview.com/stories.rss"
	"https://news.ycombinator.com/rss"
	"https://api.quantamagazine.org/feed/"
	"https://lemire.me/blog/feed/"
	"http://feeds.arstechnica.com/arstechnica/technology-lab"
	"http://feeds.arstechnica.com/arstechnica/security"
	"http://feeds.arstechnica.com/arstechnica/science"
	"http://feeds.arstechnica.com/arstechnica/multiverse"
	"http://feeds.arstechnica.com/arstechnica/cardboard"
	"http://brooker.co.za/blog/rss.xml"
	("http://feeds.feedburner.com/se-radio" podcast)
	"https://victorzhou.com/rss.xml"
	"https://compphys.go.ro/feed/"
	"https://blog.coleadership.com/rss/"
	"https://cacm.acm.org/magazine.rss"
	("https://cacm.acm.org/browse-by-subject/human-computer-interaction.rss" hci)
	"https://cacm.acm.org/browse-by-subject/artificial-intelligence.rss"
	"https://cacm.acm.org/browse-by-subject/performance-and-reliability.rss"
	"https://cacm.acm.org/browse-by-subject/education.rss"
	"http://feeds.feedburner.com/martinkl"))

;; Org Settings
(require 'org)
(global-set-key (kbd "C-c <f1>") (lambda () (interactive) (org-agenda nil "a")))
(global-set-key (kbd "C-c c") (lambda () (interactive) (org-capture nil "t")))
(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key org-mode-map (kbd "M-RET") (lambda() (interactive) (org-meta-return) (org-todo "TODO")))
(setq truncate-lines nil)
(setq org-log-done 'time)
(setq org-agenda-files (list "~/org"))
(setq org-default-notes-file (concat org-directory "/tasklist.org"))
(setq org-capture-templates '(("t" "TODO" entry (file+headline "" "tasks") "* TODO %?\nSCHEDULED: %T")))
(setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "WAITING(w)" "REVIEW(r)" "|" "DEFERRED(f)" "DONE(d)" "CANCELED(c)")))
(setq org-todo-keyword-faces
      (quote (("TODO"      :foreground "red"          :weight bold)
              ("NEXT"      :foreground "blue"         :weight bold)
              ("STARTED"   :foreground "cyan"         :weight bold)
              ("WAITING"   :foreground "gold"         :weight bold)
              ("REVIEW"    :foreground "magenta"      :weight bold)
              ("DONE"      :foreground "forest green" :weight bold)
              ("DEFERRED"  :foreground "dark red"     :weight bold)
              ("CANCELED"  :foreground "dark red"     :weight bold))))

;;;; START Org Agenda Formatting
;; Color-code priorities
(customize-set-variable 'org-agenda-fontify-priorities t)
(customize-set-variable 'org-priority-faces
                        (quote ((65 :foreground "magenta" :weight bold)
                                (66 :foreground "green3")
                                (67 :foreground "orange"))))

(setq view-diary-entries-initially t
      mark-diary-entries-in-calendar t
      number-of-diary-entries 7)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)
(add-hook 'org-mode-hook 'toggle-word-wrap)
;;;; END Org Agenda Formatting

;; Godoc Settings
(defun set-exec-path-from-shell-PATH ()
>  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))
(when window-system (set-exec-path-from-shell-PATH))
(setenv "GOPATH" "/Users/phoenixcoder/workspace/projects/go")
(add-to-list 'exec-path "$GOPATH/bin")
(add-hook 'before-save-hook 'gofmt-before-save)

;; JavaScript Settings
(require 'prettier-js)
(add-hook 'js-mode-hook 'prettier-js-mode)
(setq js-indent-level 2)
(setq prettier-js-args '(
			 "--arrow-parens" "always"
			 "--trailing-comma" "none"
			 "--jsx-bracket-same-line" "true"
			 ))

;; ITERM2 MOUSE SUPPORT
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (defun track-mouse (e)) 
  (setq mouse-sel-mode t))

;; Helm Configuration
(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

(load "~/.emacs.d/init.el")
(load "~/.emacs.d/personal.el")
