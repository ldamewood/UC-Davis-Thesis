\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ucdthesis}[2010/05/25 University of California Davis Thesis Class]
\newif\if@copyright
\@copyrightfalse
\newif\if@thesis
\@thesisfalse
\newif\if@editor
\@editorfalse
\newif\if@twoside
\@twosidefalse
%    ****************************************
%    *               OPTIONS                *
%    ****************************************
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{book}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{book}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{book}}
\DeclareOption{editor}{\@editortrue}
\DeclareOption{final}{\PassOptionsToClass{final}{book}}
\DeclareOption{oneside}{
  \@twosidefalse
  \PassOptionsToClass{oneside}{book}
}
\DeclareOption{twoside}{
  \@twosidetrue
  \PassOptionsToClass{twoside}{book}
}
\DeclareOption{copyright}{\@copyrighttrue}
\DeclareOption{thesis}{\@thesistrue}
\DeclareOption{dissertation}{\@thesisfalse}
\ProcessOptions\relax
\LoadClass[12pt,letterpaper,oneside]{book}
%    ****************************************
%    *              PACKAGES                *
%    ****************************************
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{multicol}
\RequirePackage{hyperref}
\if@editor%
  % Avoid editormode in externalized figures
  \ifx\tikzexternalrealjob\undefined%
    \RequirePackage{xcolor}%
    \RequirePackage{showkeys}%
    \def\SK@refcolor{\color{lightgray}}%
    \def\SK@labelcolor{\color{lightgray}}%
    \RequirePackage[texcoord,noframe,grid,gridunit=in,gridcolor=lightgray,%
      subgridcolor=lightgray!25%
    ]{showframe}%
    \RequirePackage{showidx}%
    \if@twoside%
      \RequirePackage[mathlines,switch]{lineno}%
    \else%
      \RequirePackage[mathlines]{lineno}%
    \fi%
    \def\linenumberfont{\normalfont\tiny\ttfamily}%
    \linenumbers%
    \AtBeginDocument{
      \newcommand*\patchAmsMathEnvironmentForLineno[1]{%
        \expandafter\let\csname old#1\expandafter\endcsname\csname #1\endcsname
        \expandafter\let\csname oldend#1\expandafter\endcsname\csname end#1\endcsname
        \renewenvironment{#1}%
           {\linenomath\csname old#1\endcsname}%
           {\csname oldend#1\endcsname\endlinenomath}}%
      \newcommand*\patchBothAmsMathEnvironmentsForLineno[1]{%
        \patchAmsMathEnvironmentForLineno{#1}%
        \patchAmsMathEnvironmentForLineno{#1*}}%
      
      \ifx\nolimits@\undefined%
      \else%
       \patchBothAmsMathEnvironmentsForLineno{equation}%
       \patchBothAmsMathEnvironmentsForLineno{align}%
       \patchBothAmsMathEnvironmentsForLineno{flalign}%
       \patchBothAmsMathEnvironmentsForLineno{alignat}%
       \patchBothAmsMathEnvironmentsForLineno{gather}%
       \patchBothAmsMathEnvironmentsForLineno{multline}%
      \fi
    }
  \fi%
\fi
%    ****************************************
%    *         LANGUAGE DECLARATIONS        *
%    ****************************************
\def\contentsname{Contents}
\def\listfigurename{List of Figures}
\def\listtablename{List of Tables}
\def\bibname{References}
\def\indexname{Index}
\def\figurename{Figure}
\def\tablename{Table}
\def\chaptername{Chapter}
\def\appendixname{Appendix}
\def\partname{Part}
\def\abstractname{Abstract}
\def\vitaename{Curriculum Vit\ae}
%    ****************************************
%    *            CAMPUS SPECIFIC           *
%    ****************************************
\def\graddept{Office of Graduate Studies}
\def\campussystem{University of California}
%    ****************************************
%    *              PAGE STYLE              *
%    ****************************************
\setlength\hoffset{0in}
\setlength\voffset{0in}
\setlength\oddsidemargin{0.0in}
\setlength\evensidemargin{0.0in}
\setlength\topmargin{-0.5in}
\setlength\headheight{0.25in}
\setlength\headsep{0.25in}
\setlength\textwidth{6.5in}
\setlength\textheight{9.0in}
\setlength\marginparsep{0.0in}
\setlength\marginparwidth{1.0in}
\setlength\footskip{0.5in}
\let\scriptsize\normalsize
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\doublespacing
%    ****************************************
%    *              NUMBERING               *
%    ****************************************
% Front matter page numbering
\newcommand\frontmatterpagenumbering{%
  \fancyhf{}
  \pagenumbering{roman}
  \if@twoside
    \fancyfoot[CO,CE]{-\roman{page}-}
  \else
    \fancyfoot[CO]{-\roman{page}-}
  \fi
% \cfoot[-\roman{page}-]{-\roman{page}-}
}
% Default page numbering
\newcommand\defaultpagenumbering{%
  \fancyhf{}
  \pagenumbering{arabic}
%  \rhead[\arabic{page}]{\arabic{page}}
  \if@twoside
    \fancyhead[RO,LE]{\arabic{page}}
  \else
    \fancyhead[RO]{\arabic{page}}
  \fi
}
%    ****************************************
%    *           USER DECLARATIONS          *
%    ****************************************
% Author
\def\author#1{\gdef\@author{#1}}
% The year the degree will be officially conferred
\def\degreeyear#1{\gdef\@degreeyear{#1}}
% The month the degree will be officially conferred
\def\degreemonth#1{\gdef\@degreemonth{#1}}
% The semester (Fall or Spring) the degree will be officially conferred
\def\degreesemester#1{\gdef\@degreesemester{#1}}
% The full (unabbreviated) name of the degree
\def\degreename#1{\gdef\@degreename{\MakeUppercase{#1}}}
% Previous degrees (type, university, campus, year)
\def\@previousdegrees{}
\newcommand*{\previousdegree}[4]{%
  \protected@edef\@previousdegrees{%
    \@previousdegrees%
    \noexpand\par{#1 (#2, #3) #4}%
  }%
}
\def\prevdegrees#1{\gdef\@prevdegrees{#1}}
%
\newcommand*{\signline}{%
  \underline{$\mbox{\hspace{0.6\textwidth}}$}
}
% The name of your committees chair
\def\chair#1{\gdef\@chair{#1}}
% The names of your other committe members, one per line
\def\@othermembers{}
\newcommand*{\othermember}[1]{%
  \protected@edef\@othermembers{%
    \@othermembers%
    \noexpand\par{\signline}%
    \noexpand\par{#1}%
  }%
}
% The name of your degrees field (e.g. Psychology, Computer Science)
\def\field#1{\gdef\@field{#1}}
% The name of your UC Campus (e.g. Berkeley, Los Angeles)
\def\campus#1{\gdef\@campus{\MakeUppercase{#1}}}
%    ****************************************
%    *               TWOSIDE                *
%    ****************************************
\def\cleardoublepage{
  \clearpage
  \if@twoside
    \ifodd
      \c@page
    \else
      \hbox{}
      \vspace*{\fill}
      \begin{center}
        %This page intentionally contains only this sentence.
      \end{center}
      \vspace{\fill}
      \thispagestyle{empty}
      \newpage
    \fi
  \fi
}
%    ****************************************
%    *             FRONT MATTER             *
%    ****************************************
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \frontmatterpagenumbering
}
%    ****************************************
%    *              TITLE PAGE              *
%    ****************************************
\def\maketitle{%
  \hypersetup{
    pdftitle={\@title},
    pdfauthor={\@author},
    pdfsubject={\@field},
  }
  \cleardoublepage
  \begin{center}
    \par{\@title}
    \par{By}
    \begin{singlespace}
      \par{\MakeUppercase{\@author}}
      \par{}\@previousdegrees
    \end{singlespace}
    \if@thesis
      \par{THESIS}
    \else
      \par{DISSERTATION}
    \fi
    \par{Submitted in partial satisfaction of the requirements for the degree of}
    \par{\@degreename}
    \par{in}
    \par{\@field}
    \par{in the}
    \par{\MakeUppercase{\graddept}}
    \par{of the}
    \par{\MakeUppercase{\campussystem}}
    \par{\@campus}
    \par{Approved:}
    \par{\signline}
    \par{{\@chair}, Chair}
    \par{}\@othermembers
    \par{Committee in Charge}
    \par{\@degreeyear}
  \end{center}
  \if@copyright
    \clearpage
    \thispagestyle{empty}
    \vspace*{\fill}
    \begin{center}
      Copyright by\\\MakeUppercase{\@author}\\\@degreeyear
    \end{center}
    \vspace*{\fill}
  \fi
  \cleardoublepage
}
%    ****************************************
%    *            COPYRIGHT PAGE            *
%    ****************************************
\def\makecopyright{%
  \clearpage
  \thispagestyle{empty}
  \vspace*{\fill}
  \begin{center}
    Copyright by\\\MakeUppercase{\@author}\\\@degreeyear
  \end{center}
  \vspace*{\fill}
  \cleardoublepage
}
%    ****************************************
%    *            DEDICATION PAGE           *
%    ****************************************
\newenvironment{dedication}{%
  \cleardoublepage
  \begin{center}
  \vspace*{\fill}
}{%
  \vspace*{\fill}
  \end{center}
}
%    ****************************************
%    *           CONTENTS PAGE              *
%    ****************************************
\renewcommand\tableofcontents{%
    \chapter*{\contentsname}%
    \@starttoc{toc}
    }
%    ****************************************
%    *            FIGURES PAGE              *
%    ****************************************
\renewcommand\listoffigures{%
  \chapter{\listfigurename}%
  \@mkboth{\MakeUppercase\listfigurename}%
          {\MakeUppercase\listfigurename}%
          \@starttoc{lof}%
}
%    ****************************************
%    *             TABLES PAGE              *
%    ****************************************
\renewcommand\listoftables{%
  \chapter{\listtablename}%
  \@mkboth{\MakeUppercase\listtablename}%
          {\MakeUppercase\listtablename}%
          \@starttoc{lot}%
}
%    ****************************************
%    *            ABSTRACT PAGE             *
%    ****************************************
\def\abstract{
  \cleardoublepage %
  \phantomsection
  \addcontentsline{toc}{chapter}{\abstractname}
  \begin{singlespace}
  \begin{flushright}
  \@author\par\@degreemonth~\@degreeyear\par\@field
  \end{flushright}
  \end{singlespace}
  \begin{center}
  \@title\par
  \underline{\bf\abstractname}
  \end{center}
}
%    ****************************************
%    *              MAIN MATTER             *
%    ****************************************
\renewcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \defaultpagenumbering
  \setcounter{page}{1}
}
%    ****************************************
%    *                CHAPTER               *
%    ****************************************
\renewcommand\chapter{\cleardoublepage
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@makechapterhead#1{%
  \vspace*{1em}
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@
  }}
\def\@makeschapterhead#1{%
  \vspace*{1em}
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }}
%    ****************************************
%    *              BACK MATTER             *
%    ****************************************
\renewcommand\backmatter{%
  \cleardoublepage
  \@mainmatterfalse
}
%    ****************************************
%    *           THE BIBLIOGRAPHY           *
%    ****************************************
\renewenvironment{thebibliography}[1]
     {\chapter{\bibname}% <-- this line was changed from \chapter* to \section*
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            %\advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty 'thebibliography' environment}}%
      \endlist}
\newcommand\citetextlink[2]{\NAT@open#1\NAT@close}
%    ****************************************
%    *               THE INDEX              *
%    ****************************************
\renewenvironment{theindex}{
  %\@mkboth{\MakeUppercase\indexname}%
  %  {\MakeUppercase\indexname}%
  %  \parindent \z@
  %  \parskip\z@ \@plus .3\p@\relax
  %  \columnseprule \z@
  %  \columnsep 35\p@
  \chapter{\indexname}
  \begin{multicols}{2}
    \let\item\@idxitem
}{\end{multicols}\cleardoublepage}
\endinput
