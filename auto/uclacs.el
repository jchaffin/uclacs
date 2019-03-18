(TeX-add-style-hook
 "uclacs"
 (lambda ()
   (setq TeX-command-extra-options
         "-shell-escape")
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "letterpaper" "twocolumn" "10pt" "12pt" "a4paper")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8x") ("xcolor" "dvipsnames" "x11names") ("ulem" "normalem") ("mathtools" "fleqn" "tbtags") ("url" "hyphens" "spaces" "obeyspaces") ("algorithm2e" "algoruled" "linesnumbered") ("natbib" "numbers" "comma") ("mhchem" "version=3") ("glossaries" "acronym")))
   (TeX-run-style-hooks
    "latex2e"
    "ifthen"
    "calc"
    "ifpdf"
    "ifluatex"
    "remreset"
    "etoolbox"
    "changepage"
    "inputenc"
    "fancyhdr"
    "lastpage"
    "kvoptions-patch"
    "kvoptions"
    "xstring"
    "article"
    "art10"
    "art12"
    "geometry"
    "graphicx"
    "longtable"
    "float"
    "wrapfig"
    "soul"
    "marvosym"
    "nointegrals"
    "integrals"
    "latexsym"
    "xcolor"
    "ulem"
    "rotating"
    "subcaption"
    "multicol"
    "enumitem"
    "mathtools"
    "fontspec"
    "unicode-math"
    "cabin"
    "xpatch"
    "minted"
    "amsthm"
    "thmtools"
    "listings"
    "nameref"
    "varioref"
    "url"
    "hyperref"
    "booktabs"
    "algpseudocode"
    "algorithm"
    "algorithm2e"
    "pdfrender"
    "natbib"
    "mhchem"
    "makeidx"
    "glossaries"
    "tikz"
    "adjustbox"
    "forest"
    "usenix")
   (TeX-add-symbols
    '("titlehrule" ["argument"] 0)
    '("forcondj" 2)
    '("forcondi" 2)
    '("forcond" 3)
    "nosemic"
    "dosemic"
    "pushline"
    "popline"
    "vertex"
    "UrlSpecialsOld"
    "UrlSpecials"
    "bibstyle"
    "item")
   (LaTeX-add-environments
    '("problem" LaTeX-env-args ["argument"] 0)))
 :latex)

