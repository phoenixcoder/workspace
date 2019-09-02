;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'package)
(require 'org)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-milk" . "http://melpa.milkbox.net/packages/"))
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
 '(custom-enabled-themes (quote (manoj-dark)))
 '(org-agenda-files (quote ("~/org/life.org")))
 '(package-selected-packages (quote (hydra exec-path-from-shell go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; General emacs Settings
(global-display-line-numbers-mode)

;; Global Key Settings
(global-set-key (kbd "S-<f1>") (lambda () (interactive) (org-agenda t)))
(global-set-key (kbd "S-<f2>") 'elfeed)
(global-set-key (kbd "<f12>") (lambda () (interactive) (find-file "~/.emacs")))
(global-set-key [mouse-4] (lambda () (interactive) (scroll-up 1)))
(global-set-key [mouse-5] (lambda () (interactive) (scroll-down 1)))				  
(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)

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
(setq org-log-done 'time)
(setq org-agenda-files (list "~/org"))

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

;; (add-to-list 'exec-path "/Users/phoenixcoder/workspace/projects/go/bin")
(add-to-list 'exec-path "$GOPATH/bin")
(add-hook 'before-save-hook 'gofmt-before-save)

;; Keymappings
;; hydra Settings

;; ITERM2 MOUSE SUPPORT
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (defun track-mouse (e)) 
  (setq mouse-sel-mode t))
