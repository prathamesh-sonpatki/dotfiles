(live-add-packs '(~/.live-packs/cha1tanya-pack))
(add-to-list 'auto-mode-alist '("Capfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Isolate\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'"   . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(require 'linum)

;; RHTML
(add-to-list 'load-path "~/.emacs.d/rhtml")
(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode)
             )
(ido-mode -1)

;; Custom Font - Inconsolata
(custom-set-faces
 '(default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant italic :weight bold :height 140 :width normal :family "Mensch")))))

;; Hiding scroll bar,tool bar,menu bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; My Own Key Bindings

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\C-x\C-i" 'rvm-gem-install)
(global-set-key "\C-x\C-x" 'eval-buffer )
(global-set-key "\C-x\C-r" 'quickrun)

;; Added pry to emacs
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-pry")
(require 'pry)
;; optional suggestions
(global-set-key [S-f9] 'pry-intercept)
(global-set-key [f9] 'pry-intercept-rerun)

;; Golden Ratio
(add-to-list 'load-path "~/.emacs.d/vendor/golden-ratio.el")
(require 'golden-ratio)
(golden-ratio-enable)

;; Cucumber & Feature mode

(add-to-list 'load-path "~/.emacs.d/vendor/cucumber")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; Syntax highlighting for cucumber

;(eval-after-load 'ruby-mode
;'(progn
;(add-to-list 'ruby-syntax-propertize-function
;'("\\(\\(\\)\\(\\)\\|Given\\|When\\|Then\\)\\s *\\(/\\)[^/\n\\\\]*\\(\\\\.[^/\n\\\\]*\\)*\\(/\\)"
;  (4 (7 . ?/))
;  (6 (7 . ?/))  ))))

;; Open the spec file for any given class

(defun senny-ruby-open-spec-other-buffer ()
  (interactive)
  (when (featurep 'rspec-mode)
    (let ((source-buffer (current-buffer))
          (other-buffer (progn
                          (rspec-toggle-spec-and-target)
                          (current-buffer))))
      (switch-to-buffer source-buffer)
      (pop-to-buffer other-buffer))))

(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "C-c , ,") 'senny-ruby-open-spec-other-buffer)))

;; String interpolation - insert {} when # is inserted

(defun senny-ruby-interpolate ()
  "In a double quoted string, interpolate."
  (interactive)
  (insert "#")
  (when (and
         (looking-back "\".*")
         (looking-at ".*\""))
    (insert "{}")
    (backward-char 1)))

(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "#") 'senny-ruby-interpolate)))

;; Flymake for Ruby syntax checking

(eval-after-load 'ruby-mode
  '(progn
     ;; Libraries
     (require 'flymake)

     ;; Invoke ruby with '-c' to get syntax checking
     (defun flymake-ruby-init ()
       (let* ((temp-file (flymake-init-create-temp-buffer-copy
                          'flymake-create-temp-inplace))
              (local-file (file-relative-name
                           temp-file
                           (file-name-directory buffer-file-name))))
         (list "ruby" (list "-c" local-file))))

     (push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
     (push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)

     (push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3)
           flymake-err-line-patterns)

     ;(add-hook 'ruby-mode-hook 'cabbage-flymake-init)

     (add-hook 'ruby-mode-hook
               (lambda ()
                 (when (and buffer-file-name
                            (file-writable-p
                             (file-name-directory buffer-file-name))
                            (file-writable-p buffer-file-name)
                            (if (fboundp 'tramp-list-remote-buffers)
                                (not (subsetp
                                      (list (current-buffer))
                                      (tramp-list-remote-buffers)))
                              t))
                   (local-set-key (kbd "C-c d")
                                  'flymake-display-err-menu-for-current-line)
                                      (flymake-mode t))))))

;; Adding rvm.el

(add-to-list 'load-path "~/.emacs.d/vendor/rvm.el")
(require 'rvm)
(rvm-use-default)

;; Adding rvm hook to ruby-mode

(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))

;; Adding inf-ruby

(add-to-list 'load-path "~/.emacs.d/vendor/inf-ruby")
(require 'inf-ruby)

;; scss-mode

(add-to-list 'load-path "~/.emacs.d/vendor/scss-mode")
(require 'scss-mode)
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;; quickrun.el

(add-to-list 'load-path "~/.emacs.d/vendor/quickrun")
(require 'quickrun)

;; Rinari

(add-to-list 'load-path "~/.emacs.d/vendor/rinari")
(require 'rinari)

;; Interactively Do Things
(require 'ido)
(ido-mode t)

(setq rinari-tags-file-name "TAGS")

; allows syntax highlighting to work
(global-font-lock-mode 1)

(load-file "~/Projects/sources/cedet-1.1/common/cedet.el")
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
(global-srecode-minor-mode 1)

(add-to-list 'load-path "~/Projects/sources/ecb-2.40/")
(require 'ecb)

;; rcirc reconnect command

(eval-after-load 'rcirc
  '(defun-rcirc-command reconnect (arg)
     "Reconnect the server process."
     (interactive "i")
     (unless process
       (error "There's no process for this target"))
     (let* ((server (car (process-contact process)))
            (port (process-contact process :service))
            (nick (rcirc-nick process))
            channels query-buffers)
       (dolist (buf (buffer-list))
         (with-current-buffer buf
           (when (eq process (rcirc-buffer-process))
             (remove-hook 'change-major-mode-hook
                          'rcirc-change-major-mode-hook)
             (if (rcirc-channel-p rcirc-target)
                 (setq channels (cons rcirc-target channels))
               (setq query-buffers (cons buf query-buffers))))))
       (delete-process process)
       (rcirc-connect server port nick
                      rcirc-default-user-name
                      rcirc-default-full-name
                      channels))))

;; Adding leim to load path

(add-to-list 'load-path "/usr/share/emacs/24.1/leim")

;; RSpec mode

(add-to-list 'load-path "~/.emacs.d/vendor/rspec-mode")
(require 'rspec-mode)

;; Configure Marmalade

(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; प्रथमेश
;; प्रथमेश सोनपाटकी
