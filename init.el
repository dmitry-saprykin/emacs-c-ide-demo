(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
    (add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/")))

;; NOTE: this call is probably the more expensive function call of the init file
;; but this is also the building block for the rest of the configuration
(package-initialize)

;; Configure and bootstrap `use-package'
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)
(require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-company)
(require 'setup-projectile)
(require 'setup-neotree)
(require 'setup-helm)
;(require 'setup-helm-gtags)
(require 'setup-c)
(require 'setup-project-dirs)

;Slow and unstable
;(require 'setup-irony)

(require 'setup-rtags)
(require 'setup-navigation)

;(global-set-key (kbd "C-x b") 'buffer-menu)

(setq custom-file (expand-file-name "custom.set.variables.el" user-emacs-directory))
(when (file-exists-p custom-file)
    (load custom-file))

(setq
    backup-by-copying t      ; don't clobber symlinks
    backup-directory-alist
        `(("." . ,(expand-file-name "backups" user-emacs-directory)))    ; don't litter my fs tree
    delete-old-versions -1
    ;kept-new-versions 5
    ;kept-old-versions 2
    version-control t
    vc-make-backup-files t
    auto-save-file-name-transforms 
        `((".*" ,(expand-file-name "auto-save-list" user-emacs-directory) t))
    )       ; use versioned backups
