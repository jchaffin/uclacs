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
  \RequirePackage{usenix,epsfig,endnotes}
\else
  \LoadClass[12pt, a4paper]{article}
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

\RequirePackage{amsmath}
\RequirePackage{fontspec}
\RequirePackage{unicode-math}

\RequirePackage{cabin}
\RequirePackage{xpatch}

\RequirePackage{minted}
\AtBeginEnvironment{minted}{%
  \renewcommand{\fcolorbox}[4][]{#4}
} % Remove red boxing around syntax errors


\setmainfont{STIX Two Text}
\setmathfont{STIX Two Math}[StylisticSet=02, StylisticSet=08]
\setmonofont[Scale=MatchUppercase]{DejaVu Sans Mono}

% \RequirePackage[greek.polutoniko,english]{babel}
% \RequirePackage[scale=1.15,p,osf]{stickstootext}
\RequirePackage{amsthm}    % https://ctan.org/pkg/amsthm
% \RequirePackage[stix2,vvarbb]{newtxmath}
% \RequirePackage[no-math]{fontspec}

\RequirePackage{thmtools}  % https://ctan.org/pkg/thmtools

\definecolor{thmtextcolor}{RGB}{0, 175, 236}
\definecolor{thmbackgroundcolor}{RGB}{226, 244, 253}

\colorlet{LightGray}{White!90!Periwinkle}

\AtBeginEnvironment{mdframed}{%
  \def\mdf@footnoterule{}
} % Remove footnote rule in amsthm environment frames.

\declaretheoremstyle[%
    mdframed={
      skipabove=8pt,
      skipbelow=6pt,
      nobreak=true,
      hidealllines=true,
      backgroundcolor={LightGray},
      innerleftmargin=-3pt,
      innerrightmargin=5pt,
      align=center
    },
    spaceabove=3pt,spacebelow=3pt,%
    headfont=\normalfont\bfseries,%
    notefont=\normalfont\bfseries,%
    notebraces={}{. },%
    headpunct={},%
    postheadspace=0pt,%
    postheadhook={\hangindent16pt},
    headindent=0pt,%
    bodyfont=\normalfont,%
    headformat={\llap{\smash{\parbox[t]{0.8in}{\centering \NAME\\
            \NUMBER}}} \hspace{8pt} \NOTE},%
    ]{thmsty}

\declaretheorem[



  % Theorems
  \declaretheorem[
    style=thmsty,
    numberwithin=section
  ]{theorem}

  % Definitions
  \declaretheorem[
    style=thmsty,
  ]{definition}

  % Lemmas
  \declaretheorem[
    style=thmsty,
    sharenumber=theorem
  ]{lemma}




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
  basicstyle=\ttfamily,
  mathescape
}%

% Cross-References, Smartrefs, and Hyper Links
\ifthenelse{\boolean{CS@nonameref}}{}{\RequirePackage{nameref}}
\ifthenelse{\boolean{CS@novarioref}}{}{\RequirePackage{varioref}}
\ifthenelse{\boolean{CS@nohyperref}}{}{%
  \RequirePackage{hyperref}
  \ifCS@noxcolor
    \colorlet{csurlcolor}{Aquamarine!85!black}
  \else
    \colorlet{csurlcolor}{black}
  \fi

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
% algorithm2e
\ifthenelse{\boolean{CS@noalgorithm2e}}{

  \RequirePackage{algpseudocode}
  \RequirePackage{algorithm}
}{
  % NOTE: algorithm2e contains non UTF-8 characters.
  % Have to manually save algorithme2e.sty as UTF-8 for compatibility
  % with LuaLaTeX, which may cause issues with 8-bit encodings and pdflatex.
  % https://tex.stackexchange.com/questions/34814/lualatex-and-algorithm2e/34815
  \RequirePackage[algoruled,linesnumbered]{algorithm2e}
  \newcommand{\nosemic}{\SetEndCharOfAlgoLine{\relax}} % Drop semi-colon ;
  \newcommand{\dosemic}{\SetEndCharOfAlgoLine{\string;}} % Reinstate
  \newcommand{\pushline}{\Indp}% Indent
  \newcommand{\popline}{\Indm\dosemic}% Remove indent
  % Default Keywords
  \SetKwInOut{Input}{Input}
  \SetKwInOut{Output}{Output}
  \SetKwProg{proc}{Procedure}{}{}
  \SetKwComment{Comment}{$\triangleright$\ }{}
  \SetKwProg{Fn}{Function}{:}{end}
  \newcommand{\forcond}[3]{$#1=#2$ \KwTo $#3$}

  \newcommand{\forcondi}[2]{\forcond{i}{#1}{#2}}
  \newcommand{\forcondj}[2]{\forcond{j}{#1}{#2}}
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
}

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
  \RequirePackage{forest}
  \forestset{
    default preamble={%
      for tree={circle,draw, l sep=2mm}%
    }%
  }%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Document Formatting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% \pagestyle{fancy}
% \fancyhead{}
% \fancyfoot{}

% \ifCS@noheader
%   \renewcommand{\headrulewidth}{0pt}
% \fi

% \fancyhead[R]{%
%   \ifthenelse{\value{page}=1}{}{\rightmark}
% }

% \fancyfoot[R]{\thepage\ of \pageref{LastPage}}

% \renewcommand{\maketitle}{%
%   \bgroup\setlength{\parindent}{0pt}%
%   \begin{flushright}
%     \@author \\
%     \@date
%   \end{flushright}\egroup
% }
% \fancyhead[L]{%
%   \ifthenelse{\value{page}=1}{%
%     \large\textbf{\doctitle}
%     \ifCS@notebook
%     \\ Course Notebook
%     \fi
%   }{%
%     \unless\ifCS@homework
%       \CS@coursename
%     \fi
%   }%
% }
