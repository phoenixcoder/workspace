;; Aliases
(defun changeToDirAtRoot (root)
  ((lambda (workspacePath)
     (message (format "Changing Dir: %s" workspacePath))
     (shell-command (format "mkdir -p %s" workspacePath))
     (cd workspacePath)
     )
   (format "%s/new_workspace/test" root)
   )
  )
(defalias 'work_new (lambda() 
		      (interactive)
		      (changeToDirAtRoot (getenv "HOME"))		 
		      )
  )
(defalias 'workg (lambda() (interactive)(cd "$HOME/workspace/projects/go/src/")))
(defalias 'workggh (lambda() (interactive) (cd "$HOME/workspace/projects/go/src/github.com")))
