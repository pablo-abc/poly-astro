;;; poly-astro.el --- a polymode for astro files

;; Copyright (C) 2021  Pablo Berganza

;; Author: Pablo Berganza <pablo@berganza.dev>
;; Version: 0.0.1
;; Package-Requires: ((polymode "0.2.2") (web-mode "17.0.4"))
;; Keywords: astro poly polymode
;; URL: https://github.com/pablo-abc/.emacs.d/tree/master/lisp/poly-astro

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This file is *NOT* part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:

;; A poly mode for .astro files for https://astro.build.
;; It currently works ok-ish for general purposes.
;; Syntax highlighting sometimes does not appear until you start
;; typing, but it is generally useable.

;;; code:
(require 'polymode)
(require 'web-mode)

(define-hostmode poly-astro-hostmode :mode 'web-mode)
(define-innermode poly-astro-fm-innermode
  :mode 'js-mode
  :head-matcher "\\`[ \t\n]*---\n"
  :tail-matcher "^---\n"
  :head-mode 'fundamental-mode
  :tail-mode 'fundamental-mode)
(define-auto-innermode poly-astro-style-tag-lang-innermode
  :head-matcher "<[[:space:]]*style[[:space:]]*lang=[[:space:]]*[\"'][[:space:]]*[[:alpha:]]+[[:space:]]*[\"'][[:space:]]*>\n"
  :tail-matcher "</[[:space:]]*style[[:space:]]*[[:space:]]*>"
  :mode-matcher (cons  "<[[:space:]]*style[[:space:]]*lang=[[:space:]]*[\"'][[:space:]]*\\([[:alpha:]]+\\)[[:space:]]*[\"'][[:space:]]*>" 1)
  :head-mode 'host
  :tail-mode 'host
  :body-indent-offset 2)
(define-innermode poly-astro-style-innermode
  :mode 'css-mode
  :head-matcher "<[[:space:]]*style[[:space:]]*[[:space:]]*>\n"
  :tail-matcher "</[[:space:]]*style[[:space:]]*[[:space:]]*>"
  :head-mode 'host
  :tail-mode 'host
  :body-indent-offset 2)
(define-polymode poly-astro
  :hostmode 'poly-astro-hostmode
  :innermodes '(poly-astro-fm-innermode
                poly-astro-style-tag-lang-innermode
                poly-astro-style-innermode))

(provide 'poly-astro)
;;; poly-astro.el ends here
