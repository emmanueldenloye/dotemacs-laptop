;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'package)
(setq package-archives
      '(("melpa-stable" . "https://stable.melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)
;; add your modules path
(add-to-list 'load-path "~/.emacs.d/custom/")

(eval-when-compile
  (require 'cl))

;;; Load and execute the code every .el file in the custom sub directory.
;;; Also load the custom.el file.
;;; If there are any errors, print a message to the back trace buffer.
(let ((debug-on-error t)
      (custom-directory (concat user-emacs-directory "custom/")))
  ; (require 'init-util (concat custom-directory "init-util.el"))
  (setq custom-file (concat user-emacs-directory "custom.el"))
  (when (file-exists-p custom-file)
    (load custom-file))

  (cl-loop for file in (directory-files custom-directory t)
           unless (file-directory-p file)
           do (require (intern (file-name-base file)) file)))

(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; (diminish 'flyspell-mode)
;; (provide 'init)
;; init.el ends here
