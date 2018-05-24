%!TEX TS-program = XeLaTeX
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uclacs}[2018/02/22  LaTeX Class for CS180 course documents]
\LoadClass[a4paper, 12pt]{article}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Class Initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage{ifpdf}
\RequirePackage{remreset}
\RequirePackage{etoolbox}
\RequirePackage{changepage}
\RequirePackage[utf8x]{inputenc}
\RequirePackage[left=1in, right=1in, top=1.3in, bottom=1in]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{kvoptions-patch}
\RequirePackage{kvoptions}


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
\DeclareBoolOption{notextcomp}
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
\DeclareBoolOption{times}
\DeclareBoolOption{microtype}
\DeclareBoolOption{paralist}
\DeclareBoolOption{setspace}
\DeclareBoolOption{doublespace}

% Class Options
\DeclareBoolOption{noheader}
\DeclareBoolOption{homework}
\DeclareStringOption{hwnum}
\DeclareBoolOption{notebook}
\DeclareStringOption{coursesecnum}
\DeclareStringOption{studentid}
\DeclareStringOption{coursename}


% Process Options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessKeyvalOptions*
\ProcessOptions\relax


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Org Mode Default Packages
\ifthenelse{\boolean{CS@nofontenc}}{}{\RequirePackage[T1]{fontenc}}
\ifthenelse{\boolean{CS@nofixltx2e}}{}{\RequirePackage{fixltx2e}}
\ifthenelse{\boolean{CS@nographicx}}{}{\RequirePackage{graphicx}}
\ifthenelse{\boolean{CS@nolongtable}}{}{\RequirePackage{longtable}}
\ifthenelse{\boolean{CS@nofloat}}{}{\RequirePackage{float}}
\ifthenelse{\boolean{CS@nowrapfig}}{}{\RequirePackage{wrapfig}}
\ifthenelse{\boolean{CS@nosoul}}{}{\RequirePackage{soul}}
\ifthenelse{\boolean{CS@notextcomp}}{}{\RequirePackage{textcomp}}
\ifthenelse{\boolean{CS@nomarvosym}}{}{\RequirePackage{marvosym}}
\ifthenelse{\boolean{CS@nointegrals}}{%
  {\RequirePackage{nointegrals}}%
  {\RequirePackage{integrals}}%
}

\ifthenelse{\boolean{CS@nolatexsym}}{}{\RequirePackage{latexsym}}
\ifthenelse{\boolean{CS@noamssymb}}{}{%
  \RequirePackage{amsmath}
  \RequirePackage{mathptmx}
  \RequirePackage{amsfonts}
  \RequirePackage{amssymb}
  \RequirePackage{calligra}
  \RequirePackage{calrsfs}
  \RequirePackage[mathscr]{euscript}
  \DeclareMathAlphabet{\mathcalligra}{T1}{calligra}{m}{n}
  \newcommand{\R}{\mathbb{R}}
  \newcommand{\N}{\mathbb{N}}
  \newcommand{\Z}{\mathbb{Z}}
}

\ifthenelse{\boolean{CS@noxcolor}}{}{\RequirePackage[dvipsnames,x11names]{xcolor}}


\ifthenelse{\boolean{CS@times}}{
  \RequirePackage{fontspec}
  \setmainfont{Times New Roman}
}{%
  \RequirePackage{fontspec}
  \setmainfont[Ligatures=TeX, Numbers={OldStyle, Proportional}]{Linux Libertine}
}

% Other Default Packages
\ifthenelse{\boolean{CS@noulem}}{}{\RequirePackage[normalem]{ulem}}
\ifthenelse{\boolean{CS@norotating}}{}{\RequirePackage{rotating}}
\ifthenelse{\boolean{CS@nosubcaption}}{}{\RequirePackage{subcaption}}
\ifthenelse{\boolean{CS@nomulticol}}{}{\RequirePackage{multicol}}
\ifthenelse{\boolean{CS@noenumitem}}{}{\RequirePackage{enumitem}}

\ifthenelse{\boolean{CS@noamsthm}}{}{%
  \RequirePackage{amsthm}
  \RequirePackage{thmtools}
  \definecolor{thmtextcolor}{RGB}{0, 175, 236}
  \definecolor{thmbackgroundcolor}{RGB}{226, 244, 253}

  \colorlet{LightGray}{White!90!Periwinkle}

  \AtBeginEnvironment{mdframed}{%
    \def\mdf@footnoterule{}
  }
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
    style=thmsty,
    numberwithin=section
  ]{theorem}

  \declaretheorem[
    style=thmsty,
    sharenumber=theorem
  ]{definition}

  \declaretheorem[
    style=thmsty,
    sharenumber=theorem
  ]{lemma}

  \renewcommand\thmt@space{}

}

\ifthenelse{\boolean{CS@nominted}}{}{%
  \RequirePackage{minted}
  \AtBeginEnvironment{minted}{%
    \renewcommand{\fcolorbox}[4][]{#4}
  } % Remove red boxing around syntax errors
}

\ifthenelse{\boolean{CS@nolistings}}{}{%
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
}

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
 
% \ifthenelse{\boolean{CS@nocleveref}}{}{\RequirePackage{cleveref}}

\ifthenelse{\boolean{CS@noalgorithm2e}}{}{
  % NOTE: algorithm2e contains non UTF-8 characters.
  % Have to manually save algorithme2e.sty as UTF-8 for compatibility 
  % with LuaLaTeX, which may cause issues with 8-bit encodings and pdflatex.
  % https://tex.stackexchange.com/questions/34814/lualatex-and-algorithm2e/34815
  \RequirePackage[algoruled,linesnumbered]{algorithm2e}
  \newcommand{\nosemic}{\SetEndCharOfAlgoLine{\relax}}% Drop semi-colon ;
  \newcommand{\dosemic}{\SetEndCharOfAlgoLine{\string;}}% Reinstate
  \newcommand{\pushline}{\Indp}% Indent
  \newcommand{\popline}{\Indm\dosemic}% Undent
  \SetKwInOut{Input}{Input}
  \SetKwInOut{Output}{Output}
  \SetKwProg{proc}{Procedure}{}{}
  \SetKwComment{Comment}{$\triangleright$\ }{}
  \SetKwProg{Fn}{Function}{:}{end}

  \unless\ifCS@novarioref
    \labelformat{algocf}{\textit{alg.}\,(#1)}
  \fi
}


\ifthenelse{\boolean{CS@nopdfrender}}{}{\RequirePackage{pdfrender}}

\ifthenelse{\boolean{CS@nonatbib}}{}{%
  \RequirePackage[numbers,comma]{natbib}
  \RequirePackage[version=3]{mhchem}
}

\ifthenelse{\boolean{CS@nolua}}{}{%
  \RequirePackage{tikz}
  \usetikzlibrary{graphs,graphdrawing} % Requires LuaLatex
  \usegdlibrary{UclacsGraph}
  \usegdlibrary{trees}
  \usegdlibrary{layered}
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

\def\doctitle{\@title}

\ifCS@homework
  \renewcommand{\doctitle}{\CS@coursename : Homework \CS@hwnum}
\fi

\pagestyle{fancy}
\fancyhead{}
\fancyfoot{}

\ifCS@noheader
  \renewcommand{\headrulewidth}{0pt}
\fi

\fancyhead[L]{%
  \ifthenelse{\value{page}=1}{%
    \large\textbf{\doctitle}
    \ifCS@notebook
    \\ Course Notebook
    \fi
  }{%
    \unless\ifCS@homework
      \CS@coursename
    \fi
  }%
}

\fancyhead[R]{%
  \ifthenelse{\value{page}=1}{}{\rightmark}
}

\fancyfoot[R]{\thepage\ of \pageref{LastPage}}

\newcommand{\guidelines}{%
  \hspace{\dimexpr-\fboxrule-\fboxsep\relax}\fbox{%
    \parbox{0.95\textwidth}{%

      Guidelines: \\

      \begin{itemize}
      \item Upload your assignments to Gradescope by 5:59PM.
      \item Follow the instructions mentioned on the course webpage
        for uploading to Gradescope very carefully (including
        starting each problem on a new page and matching the pages
        with the assignments); this makes it easy and smooth for
        everyone. As the guidelines are simple enough, bad uploads
        will not be graded.
      \item You may use results proved in class without proofs as
        long as you state them clearly.
      \item Most importantly, make sure you adhere to the policies
        for academic honesty set out on the
        course
        \href{https://raghumeka.github.io/CS180/index.html}{webpage}. The
        policies will be enforced strictly. Homework is a stepping
        stone for exams; keep in mind that reasonable partial credit
        will be awarded and trying the problems will help you a lot
        for the exams.
      \end{itemize}
    }
  }
}

\renewcommand{\maketitle}{%
  \bgroup\setlength{\parindent}{0pt}%
  \begin{flushright}
    \@author \\
    \CS@studentid \\
    Section \CS@coursesecnum \\
    \@date
  \end{flushright}\egroup
  \ifCS@homework
    \vspace{5mm} % 5mm vertical space
    \guidelines
  \else
    % Do nothing
  \fi
  
}




