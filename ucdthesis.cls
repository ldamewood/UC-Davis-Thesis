\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ucdthesis}[2010/05/25 University of California Davis Thesis Class]
\newif\if@ucd@copyright
\@ucd@copyrightfalse
\newif\if@ucd@thesis
\@ucd@thesisfalse
\providecommand\phantomsection{}
%    ****************************************
%    *               OPTIONS                *
%    ****************************************
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{book}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{book}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{book}}
\DeclareOption{oneside}{\PassOptionsToClass{oneside}{book}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{book}}
\DeclareOption{final}{\PassOptionsToClass{final}{book}}
\DeclareOption{draft}{\PassOptionsToClass{draft}{book}}
\DeclareOption{copyright}{\@ucd@copyrighttrue}
\DeclareOption{thesis}{\@ucd@thesistrue}
\DeclareOption{dissertation}{\@ucd@thesisfalse}
\ProcessOptions\relax
\LoadClass[12pt,letterpaper,oneside,final]{book}
%    ****************************************
%    *              PACKAGES                *
%    ****************************************
\RequirePackage{setspace}
%    ****************************************
%    *         LANGUAGE DECLARATIONS        *
%    ****************************************
\renewcommand\contentsname{Contents}
\renewcommand\listfigurename{List of Figures}
\renewcommand\listtablename{List of Tables}
\renewcommand\bibname{References}
\renewcommand\indexname{Index}
\renewcommand\figurename{Figure}
\renewcommand\tablename{Table}
\renewcommand\chaptername{Chapter}
\renewcommand\appendixname{Appendix}
\renewcommand\partname{Part}
\newcommand\abstractname{Abstract}
\newcommand\vitaename{Curriculum Vit\ae}
%    ****************************************
%    *            CAMPUS SPECIFIC           *
%    ****************************************
\newcommand\graddept{Office of Graduate Studies}
\newcommand\campussystem{University of California}
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
%\let\scriptsize\normalsize
\doublespacing
%    ****************************************
%    *              NUMBERING               *
%    ****************************************
\def\ps@frontmatter{%
  \def\@oddfoot{\hfil-\thepage-\hfil}
  \let\@evenfoot\@oddfoot
  \let\@oddhead\@empty
  \let\@evenhead\@empty
  \let\@mkboth\markboth
  \def\chaptermark##1{%
    \markright {\MakeUppercase{%
      \ifnum \c@secnumdepth >\m@ne
        \if@mainmatter
          \@chapapp\ \thechapter. \ %
        \fi
      \fi
      ##1}}}}
\def\ps@mainmatter{%
  \def\@oddfoot{\hfil\thepage\hfil}
  \let\@evenfoot\@oddfoot
  \let\@oddhead\@empty
  \let\@evenhead\@empty
  \let\@mkboth\markboth
  \def\chaptermark##1{%
    \markright {\MakeUppercase{%
      \ifnum \c@secnumdepth >\m@ne
        \if@mainmatter
          \@chapapp\ \thechapter. \ %
        \fi
      \fi
      ##1}}}}
\let\ps@backmatter\ps@mainmatter
%\let\ps@plain\ps@frontmatter
\pagestyle{frontmatter}
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
\newcommand\@previousdegrees{}
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
\newcommand\@othermembers{}
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
\renewcommand\cleardoublepage{
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
%    *              TITLE PAGE              *
%    ****************************************
\renewcommand\maketitle{%
  \ifx\hyper@@anchor\undefined%
  \else%
    \hypersetup{
      pdftitle={\@title},
      pdfauthor={\@author},
      pdfsubject={\@field},
    }
  \fi%
  \cleardoublepage
  \begin{center}
    \par{\@title}
    \par{By}
    \begin{singlespace}
      \par{\MakeUppercase{\@author}}
      \par{}\@previousdegrees
    \end{singlespace}
    \if@ucd@thesis
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
  \if@ucd@copyright
    \clearpage
    \thispagestyle{empty}
    \vspace*{\fill}
    \begin{center}
      \par{Copyright by}
      \par{\MakeUppercase{\@author}}
      \par{\@degreeyear}
    \end{center}
    \vspace*{\fill}
  \fi
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
  \@starttoc{toc}%
}
%    ****************************************
%    *            FIGURES PAGE              *
%    ****************************************
\renewcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
%    ****************************************
%    *             TABLES PAGE              *
%    ****************************************
\renewcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
%    ****************************************
%    *            ABSTRACT PAGE             *
%    ****************************************
\newcommand\abstract{
  \cleardoublepage
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
%    *              BACK MATTER             *
%    ****************************************
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}
  \pagestyle{frontmatter}
}
\renewcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}
  \setcounter{page}{1}
  \pagestyle{mainmatter}
}
\renewcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse
  \pagestyle{backmatter}
}
%    ****************************************
%    *                CHAPTER               *
%    ****************************************
\renewcommand\chapter{
  \if@openright\cleardoublepage\else\clearpage\fi
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter
}
\def\@makechapterhead#1{%
  \vspace*{0 \p@}%
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
  \vspace*{0 \p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }}
%    ****************************************
%    *           THE BIBLIOGRAPHY           *
%    ****************************************
  %\@ifpackageloaded{natbib}{}{% natbib not loaded
  \AtBeginDocument{
    \renewenvironment{thebibliography}[1]{%
      \chapter{\bibname}
      \begin{thebibitemlist}{#1}}{\end{thebibitemlist}}
      }
      %}
 \newenvironment{thebibitemlist}[1]{
    \list{\@biblabel{\@arabic\c@enumiv}}%
         {\settowidth\labelwidth{\@biblabel{#1}}%
          \leftmargin\labelwidth
          \advance\leftmargin\labelsep
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
%    ****************************************
%    *               THE INDEX              *
%    ****************************************
\renewenvironment{theindex}
{
  \if@twocolumn
    \@restonecolfalse
  \else
    \@restonecoltrue
  \fi
  \twocolumn[
    \phantomsection
    \vspace*{43pt}
    \@makeschapterhead{\indexname}
    \addcontentsline{toc}{chapter}{\indexname}
  ]%
  \@mkboth{\MakeUppercase\indexname}{\MakeUppercase\indexname}%
  \parindent\z@
  \parskip\z@ \@plus .3\p@\relax
  \columnseprule \z@
  \columnsep 35\p@
  \let\item\@idxitem
}{\if@restonecol\onecolumn\else\clearpage\fi}
\endinput
