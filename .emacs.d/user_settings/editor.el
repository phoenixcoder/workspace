;; redo Settings
(global-undo-tree-mode 1)
(defalias 'redo 'undo-tree-redo)

;; Global Keybindings
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)
