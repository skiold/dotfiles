(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-directory "~/priv/gtd-agenda/")
(setq org-tags-exclude-from-inheritance '("VISION" "FOCUS"))
(setq org-agenda-files nil)
(global-set-key "\C-ca" 'org-agenda)

(setq org-agenda-files
      (quote ("gtd.org" "book-of-days.org" "aptivate.org")))

(setq org-agenda-custom-commands
      '(("V" "Guias para o futuro"
	 ((agenda)
	  (tags "VISION")))
	("F" "Foco en proximas accions"
	 ((agenda)
	  (tags "FOCUS")))
	("H" "Office and Home Lists"
	((agenda)
	 (tags "AGEDA")
	 (tags "APTIVATE")
	 (tags "HOME")
	 (tags "COMPUTER")
	 (tags "CLIENT")
	 (tags "MEDIA")
	 (tags "AUDIO")
	 (tags "VIDEO")
	 (tags "WRITING")
	 (tags "DEVELOPMENT")
	 (tags "READING")))))

;; refile config see the gtd with org intro
(setq org-refile-use-outline-path "full-file-path")
(setq org-refile-targets (quote (("gtd.org" :maxlevel . 1)
                              ("mobile.org" :maxlevel . 1)
			      ("ReasonAside.org" :maxlevel . 1))))
