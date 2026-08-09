;;; emacspeak-config.el --- Emacspeak-only configuration -*- lexical-binding: t; -*-

;; This file should contain ONLY Emacspeak-related configuration.
;; It assumes Emacspeak is already installed and loadable.

;;; Commentary:
;; - Keeps Emacspeak config separate from init.el
;; - Adds spoken key bindings to minibuffer completion
;; - Designed to work cleanly with Vertico + Marginalia
;; - Does NOT rely on Marginalia annotations being spoken

;;; Code:

(with-eval-after-load 'emacspeak
  ;; Speak only the active candidate, not visual annotations
  (setq emacspeak-minibuffer-verbosity 1)
  (setq emacspeak-completion-annotate nil))

;; ---- Speak candidate + key binding (commands only) ----

(defun emacspeak-speak-completion-with-key ()
  "Speak minibuffer completion candidate and its key binding, if any.
Designed for Vertico-style minibuffers."
  (when (and (boundp 'vertico--index)
             vertico--index)
    (when-let* ((cand (vertico--candidate))
                (cmd  (intern-soft cand)))
      (cond
       ((commandp cmd)
        (let ((keys (where-is-internal cmd overriding-local-map t)))
          (emacspeak-speak-string
           (if keys
               (format "%s. %s" cand (key-description keys))
             cand))))
       (t
        ;; Non-command candidates (buffers, files, etc.)
        (emacspeak-speak-string cand))))))

(with-eval-after-load 'vertico
  ;; Speak candidate + key every time Vertico updates
  (advice-add 'vertico--exhibit
              :after #'emacspeak-speak-completion-with-key))

(provide 'emacspeak-config)

;;; emacspeak-config.el ends here
