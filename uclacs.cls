%!TEX TS-program = XeLaTeX
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uclacs}[2018/02/22  LaTeX Class for CS-related homework, papers, and assignments.]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Class Initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage{ifpdf}
\RequirePackage{ifluatex}
\RequirePackage{remreset}
\RequirePackage{etoolbox}
\RequirePackage{changepage}
\RequirePackage[utf8x]{inputenc}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{kvoptions-patch}
\RequirePackage{kvoptions}
\RequirePackage{xstring}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Option Declarations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\SetupKeyvalOptions{
  family=CS,
  prefix=CS@
} % use shorter name for family name and prefix

% Org-mode Default Package Options
\DeclareBoolOption{nofontenc}
\DeclareBoolOption{nofixltx2e}
\DeclareBoolOption{nographicx}
\DeclareBoolOption{nolongtable}
\DeclareBoolOption{nofloat}
\DeclareBoolOption{nowrapfig}
\DeclareBoolOption{nosoul}
\DeclareBoolOption{nomarvosym}
\DeclareBoolOption{nowasysym}
\DeclareBoolOption{nointegrals}
\DeclareBoolOption{nolatexsym}
\DeclareBoolOption{noamssymb}
\DeclareBoolOption{nohyperref}

% Other Default Packages
\DeclareBoolOption{noulem}
\DeclareBoolOption{norotating}
\DeclareBoolOption{nosubcaption}
\DeclareBoolOption{nomulticol}
\DeclareBoolOption{noenumitem}
\DeclareBoolOption{noxcolor}
\DeclareBoolOption{noamsmath}
\DeclareBoolOption{noamsthm}
\DeclareBoolOption{nocolorthms}
\DeclareBoolOption{nominted}
\DeclareBoolOption{nolistings}
\DeclareBoolOption{nonameref}
\DeclareBoolOption{nocleveref}
\DeclareBoolOption{novarioref}
\DeclareBoolOption{noalgorithm2e}
\DeclareBoolOption{nopdfrender}
\DeclareBoolOption{nonatbib}
\DeclareBoolOption{nolua}
\DeclareBoolOption{noforest}

% Other Packages
\DeclareBoolOption{nofontspec}
\DeclareBoolOption{microtype}
\DeclareBoolOption{paralist}
\DeclareBoolOption{setspace}
\DeclareBoolOption{doublespace}

% Class Options
\DeclareBoolOption{noheader}
\DeclareBoolOption{homework}
\DeclareStringOption{hwnum}
\DeclareBoolOption{notebook}
\DeclareStringOption{studentid}
\DeclareStringOption{coursename}
\DeclareStringOption{coursenumber}
\DeclareStringOption{profname}
\DeclareStringOption{profemail}
\DeclareStringOption{ta}
% \DeclareStringOption{taemail}
\DeclareStringOption{dissection}
\DeclareStringOption{disnumber}

\DeclareBoolOption{usenix}

% Process Options
%% Fallback
\DeclareDefaultOption{%
  \ifx\CurrentOptionValue\relax
  % Expand \CurrentOption
  \expandafter\PassOptionsToClass
  \expandafter{\CurrentOption}{article}%
  \else
    \@unknownoptionerror
  \fi
}
\ProcessKeyvalOptions*

\ifCS@usenix
  \LoadClass[letterpaper,twocolumn,10pt]{article}
\else
\LoadClass[10pt, a4paper]{article}
\RequirePackage{geometry}
\geometry{twoside=true,
  includeheadfoot, head=13pt, foot=2pc,
  paperwidth=6.75in, paperheight=10in,
  top=58pt, bottom=44pt, inner=46pt, outer=46pt,
  marginparwidth=2pc,heightrounded}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Org Mode Default Packages

\ifthenelse{\boolean{CS@nographicx}}{}{\RequirePackage{graphicx}}
\ifthenelse{\boolean{CS@nolongtable}}{}{\RequirePackage{longtable}}
\ifthenelse{\boolean{CS@nofloat}}{}{\RequirePackage{float}}
\ifthenelse{\boolean{CS@nowrapfig}}{}{\RequirePackage{wrapfig}}
\ifthenelse{\boolean{CS@nosoul}}{}{\RequirePackage{soul}}
\ifthenelse{\boolean{CS@nomarvosym}}{}{\RequirePackage{marvosym}}
\ifthenelse{\boolean{CS@nointegrals}}{%
  {\RequirePackage{nointegrals}}%
  {\RequirePackage{integrals}}%
}

\ifthenelse{\boolean{CS@nolatexsym}}{}{\RequirePackage{latexsym}}
\ifthenelse{\boolean{CS@noxcolor}}{}{%
 \RequirePackage[dvipsnames,x11names]{xcolor}
}

% Other Default Packages
\ifthenelse{\boolean{CS@noulem}}{}{\RequirePackage[normalem]{ulem}}
\ifthenelse{\boolean{CS@norotating}}{}{\RequirePackage{rotating}}
\ifthenelse{\boolean{CS@nosubcaption}}{}{\RequirePackage{subcaption}}
\ifthenelse{\boolean{CS@nomulticol}}{}{\RequirePackage{multicol}}
\ifthenelse{\boolean{CS@noenumitem}}{}{\RequirePackage{enumitem}}
% \RequirePackage[osf]{XCharter} %
\RequirePackage[fleqn,tbtags]{mathtools}
\RequirePackage{fontspec}
\RequirePackage{amsfonts}
\RequirePackage{unicode-math}
\setmainfont{STIX Two Text}
\setmathfont{STIX Two Math}[StylisticSet=02, StylisticSet=08]
\setmonofont[Scale=0.8]{DejaVu Sans Mono}
\RequirePackage{cabin}
\RequirePackage{xpatch}
\RequirePackage{minted}
\AtBeginEnvironment{minted}{%
  \renewcommand{\fcolorbox}[4][]{#4}
} % Remove red boxing around syntax errors
\RequirePackage{amsthm}    % https://ctan.org/pkg/amsthm
\RequirePackage{thmtools}  % https://ctan.org/pkg/thmtools
\definecolor{thmtextcolor}{RGB}{0, 175, 236}
\definecolor{bg}{rgb}{0.95,0.95,0.95}
\definecolor{thmbackgroundcolor}{RGB}{226, 244, 253}
\colorlet{LightGray}{White!90!Periwinkle}
\AtBeginEnvironment{mdframed}{%
  \def\mdf@footnoterule{}
} % Remove footnote rule in amsthm environment frames.

\declaretheoremstyle[%
    mdframed={
      splittopskip=20pt,
      skipabove=16pt,
      nobreak=true,
      hidealllines=true,
      backgroundcolor={LightGray},
      innerleftmargin=-3pt,
      innerrightmargin=2pt,
      innertopmargin=6pt,
      innerbottommargin=6pt,
    },
    spaceabove=3pt,spacebelow=3pt,%
    headfont=\normalfont\bfseries,%
    notefont=\scshape,%
    notebraces={}{. },%
    headpunct={},%
    postheadhook={\hangindent16pt}, % \\ removed
    postheadspace=\newline,%
    headindent=5pt,%
    bodyfont=\normalfont,%
    headformat={\hspace{3pt}\llap{\smash{\parbox[t]{0.8in}{\centering
            {\footnotesize \NAME\\ \NUMBER}}}} \hspace{3pt}\NOTE},%
    ]{thmsty} % theorem style
  % Theorems
  \declaretheorem[style=thmsty, numberwithin=section ]{theorem}
  % Definitions
  \declaretheorem[style=thmsty, numberwithin=section]{definition} % Definitions
  \declaretheorem[style=thmsty, sharenumber=theorem]{lemma}  % Lemmas

  % Provides mathescape in org-mode example-blocks:
% Usage:
%   attr_latex: :environment lstlisting
%   #+begin_example
%    ...
%   #+end_example
%
% https://tex.stackexchange.com/a/149718/156736
\RequirePackage{listings} % http://ctan.org/pkg/listings
\lstset{%
  basicstyle=\ttfamily\footnotesize,
  mathescape
}%

% Cross-References, Smartrefs, and Hyper Links
\ifthenelse{\boolean{CS@nonameref}}{}{\RequirePackage{nameref}}
\ifthenelse{\boolean{CS@novarioref}}{}{\RequirePackage{varioref}}
\ifthenelse{\boolean{CS@nohyperref}}{}{%
  \RequirePackage[hyphens,spaces,obeyspaces]{url}
  \RequirePackage{hyperref}
  \ifCS@noxcolor
    \colorlet{csurlcolor}{Aquamarine!85!black}
  \else
    \colorlet{csurlcolor}{black}
  \fi

  \urlstyle{rm}
  \renewcommand\UrlFont{\color{MidnightBlue}\footnotesize\rmfamily}
  \let\UrlSpecialsOld\UrlSpecials
  \def\UrlSpecials{\UrlSpecialsOld\do\/{\Url@slash}\do\_{\Url@underscore}}%
  \def\Url@slash{\@ifnextchar/{\kern-.11em\mathchar47\kern-.2em}%
    {\kern-.0em\mathchar47\kern-.08em\penalty\UrlBigBreakPenalty}}
  \def\Url@underscore{\nfss@text{\leavevmode \kern.06em\vbox{\hrule\@width.3em}}}
  \AtEndPreamble{
    \hypersetup{
      colorlinks=true,
      linkcolor=black,
      filecolor=black,
      citecolor=black,
      urlcolor=csurlcolor
    }
  }
}

\RequirePackage{booktabs}
% Grammar Diagrams
\RequirePackage{rail}
\railoptions{-t}
\newenvironment{figrail}{\begin{figure}\begin{rail}}{\end{rail}\end{figure}}

\RequirePackage{bitpattern}
\RequirePackage{drawstack}

% algorithm2e
\ifthenelse{\boolean{CS@noalgorithm2e}}{

  \RequirePackage{algpseudocode}
  \RequirePackage{algorithm}

}{
  % NOTE: algorithm2e contains non UTF-8 characters.
  % Have to manually save algorithme2e.sty as UTF-8 for compatibility
  % with LuaLaTeX, which may cause issues with 8-bit encodings and pdflatex.
  % https://tex.stackexchange.com/questions/34814/lualatex-and-algorithm2e/34815
  \RequirePackage{clrscode3e}
  \RequirePackage[algoruled,linesnumbered]{algorithm2e}
% Default Keywords
  \SetKwInOut{Input}{Input}
  \SetKwInOut{Output}{output}
  \SetKwProg{proc}{Procedure}{}{}
  \SetKwComment{Comment}{ $\triangleright$\ }{}
  \SetKwProg{Fn}{Function}{:}{end}
  \newcommand{\nosemic}{\SetEndCharOfAlgoLine{\relax}} % Drop semi-colon ;
  \newcommand{\dosemic}{\SetEndCharOfAlgoLine{\string;}} % Reinstate
  \newcommand{\pushline}{\Indp}% Indent
  \newcommand{\popline}{\Indm\dosemic}% Remove indent
  % 'for' loop Macros
  \newcommand{\forcond}[3]{$#1=#2$ \KwTo $#3$}
  \newcommand{\forcondi}[2]{\forcond{i}{#1}{#2}}
  \newcommand{\forcondj}[2]{\forcond{j}{#1}{#2}}
  \SetFuncSty{textsc}
  % from Russell's Artificial intelligence A Modern Approach
  \SetKwFunction{InitialState}{Initial-State}
  \SetKwFunction{State}{State}
  \SetKwFunction{PathCost}{Path-Cost}
  \SetKwFunction{ChildNode}{Child-Node}
  \SetKwFunction{Actions}{Actions}
  \SetKwFunction{GoalTest}{Goal-Test}
  \SetKwFunction{Solution}{Solution}
  \SetKwFunction{Insert}{Insert}
  % Data
  \SetKwData{node}{node}
  \SetKwData{frontier}{frontier}
  \SetKwData{explored}{explored}
  \SetKwData{problem}{problem}
  \SetKwData{action}{action}
  % Data Structures
  \SetKwFunction{Empty}{Empty?}
  \SetKwFunction{Pop}{Pop}
  \SetKwFunction{Push}{Push}
  \SetKwBlock{Loop}{loop do}{}
  % Use 'algo_' string prefixes for vref labels.
  \unless\ifCS@novarioref
    \labelformat{algocf}{\textit{alg.}\,(#1)}
  \fi
}

% pdfrender
\ifthenelse{\boolean{CS@nopdfrender}}{}{\RequirePackage{pdfrender}}

% natbib
\ifthenelse{\boolean{CS@nonatbib}}{}{%
  \RequirePackage[numbers,comma]{natbib}
  \RequirePackage[version=3]{mhchem}
  \renewcommand{\bibsection}{%
     \section*{\refname}%
     \phantomsection\addcontentsline{toc}{section}{\refname}%
  }
  \renewcommand\setcitestyle[1]{
  \@for\@tempa:=#1\do
  {\def\@tempb{round}\ifx\@tempa\@tempb
     \renewcommand\NAT@open{(}\renewcommand\NAT@close{)}\fi
   \def\@tempb{square}\ifx\@tempa\@tempb
     \renewcommand\NAT@open{[}\renewcommand\NAT@close{]}\fi
   \def\@tempb{angle}\ifx\@tempa\@tempb
     \renewcommand\NAT@open{$<$}\renewcommand\NAT@close{$>$}\fi
   \def\@tempb{curly}\ifx\@tempa\@tempb
     \renewcommand\NAT@open{\{}\renewcommand\NAT@close{\}}\fi
   \def\@tempb{semicolon}\ifx\@tempa\@tempb
     \renewcommand\NAT@sep{;}\fi
   \def\@tempb{colon}\ifx\@tempa\@tempb
     \renewcommand\NAT@sep{;}\fi
   \def\@tempb{comma}\ifx\@tempa\@tempb
     \renewcommand\NAT@sep{,}\fi
   \def\@tempb{authoryear}\ifx\@tempa\@tempb
     \NAT@numbersfalse\fi
   \def\@tempb{numbers}\ifx\@tempa\@tempb
     \NAT@numberstrue\NAT@superfalse\fi
   \def\@tempb{super}\ifx\@tempa\@tempb
     \NAT@numberstrue\NAT@supertrue\fi
   \def\@tempb{nobibstyle}\ifx\@tempa\@tempb
     \let\bibstyle=\@gobble\fi
   \def\@tempb{bibstyle}\ifx\@tempa\@tempb
     \let\bibstyle=\@citestyle\fi
   \def\@tempb{sort}\ifx\@tempa\@tempb
     \def\NAT@sort{\@ne}\fi
   \def\@tempb{nosort}\ifx\@tempa\@tempb
     \def\NAT@sort{\z@}\fi
   \def\@tempb{compress}\ifx\@tempa\@tempb
     \def\NAT@cmprs{\@ne}\fi
   \def\@tempb{nocompress}\ifx\@tempa\@tempb
     \def\NAT@cmprs{\@z}\fi
   \def\@tempb{sort&compress}\ifx\@tempa\@tempb
     \def\NAT@sort{\@ne}\def\NAT@cmprs{\@ne}\fi
   \def\@tempb{mcite}\ifx\@tempa\@tempb
     \let\NAT@merge\@ne\fi
   \def\@tempb{merge}\ifx\@tempa\@tempb
     \@ifnum{\NAT@merge<\tw@}{\let\NAT@merge\tw@}{}\fi
   \def\@tempb{elide}\ifx\@tempa\@tempb
     \@ifnum{\NAT@merge<\thr@@}{\let\NAT@merge\thr@@}{}\fi
   \def\@tempb{longnamesfirst}\ifx\@tempa\@tempb
     \NAT@longnamestrue\fi
   \def\@tempb{nonamebreak}\ifx\@tempa\@tempb
     \def\NAT@nmfmt#1{\mbox{\NAT@up#1}}\fi
   \expandafter\NAT@find@eq\@tempa=\relax\@nil
   \if\@tempc\relax\else
     \expandafter\NAT@rem@eq\@tempc
     \def\@tempb{open}\ifx\@tempa\@tempb
      \xdef\NAT@open{\@tempc}\fi
     \def\@tempb{close}\ifx\@tempa\@tempb
      \xdef\NAT@close{\@tempc}\fi
     \def\@tempb{aysep}\ifx\@tempa\@tempb
      \xdef\NAT@aysep{\@tempc}\fi
     \def\@tempb{yysep}\ifx\@tempa\@tempb
      \xdef\NAT@yrsep{\@tempc}\fi
     \def\@tempb{notesep}\ifx\@tempa\@tempb
      \xdef\NAT@cmt{\@tempc}\fi
     \def\@tempb{citesep}\ifx\@tempa\@tempb
      \xdef\NAT@sep{\@tempc}\fi
  }%
  \NAT@@setcites
  }
  \renewcommand\citestyle[1]{%
    \ifcsname bibstyle@#1\endcsname%
    \csname bibstyle@#1\endcsname\let\bibstyle\@gobble%
    \else%
    \@latex@error{Undefined `#1' citestyle}%
    \fi
  }%
}
\RequirePackage{makeidx}
\makeindex
\renewenvironment{theindex}
{\section*{\indexname}%
  \@mkboth{\MakeUppercase\indexname}%
  {\MakeUppercase\indexname}%
  \thispagestyle{plain}\parindent\z@
  \parskip\z@ \@plus .3\p@\relax
  \columnseprule \z@
  \columnsep 35\p@
  \let\item\@idxitem}
{}
\AtEndPreamble{\renewcommand{\indexname}{}}
\RequirePackage[acronym]{glossaries}
\makeglossaries
\ifthenelse{\boolean{CS@nolua}}{}{%
  \RequirePackage{tikz}
  \ifluatex
    \usetikzlibrary{graphs,graphdrawing} % Requires LuaLatex
    \usegdlibrary{UclacsGraph}
    \usegdlibrary{trees}
    \usegdlibrary{layered}
  \fi
  \newcommand{\vertex}{\node[circle, draw, radius=1cm]}
}

\ifthenelse{\boolean{CS@noforest}}{}{%
  \RequirePackage{adjustbox}
  \RequirePackage[]{forest}
  \forestset{ % tree styles
    default preamble={
      for tree={
        text height=1em, inner ysep=0.5ex, s sep=1em, edge={semithick},
        text depth={}, l sep=1em
      }
    }
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Document Formatting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*\titlehrule[1][0.4pt]{%
  \leavevmode\leaders\hrule height#1\hfill\kern0pt
}

\ifCS@usenix
\RequirePackage{usenix}
\else
\renewcommand{\maketitle}[0]{
  \bgroup\setlength{\parindent}{0pt}%
  \@title\\
  \smallskip\noindent\titlehrule[0.4mm]
  \begin{flushright}
    \@author\\
    \@date\\
    \unless\ifx\CS@profname\@empty
    \CS@profname
    \fi
    \unless\ifx\CS@coursenumber\@empty
    \CS@coursenumber \\
    \fi
  \end{flushright}\egroup
}
\fi
\endinput
