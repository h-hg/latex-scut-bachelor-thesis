\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{scutthesis}

\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=scutthesis,
    prefix=
}
\DeclareStringOption{Title}
\DeclareStringOption{Institute}
\DeclareStringOption{Major}
\DeclareStringOption{Name}
\DeclareStringOption{StudentId}
\DeclareStringOption{Supervisor}
\DeclareStringOption{SubmitDate}
\ProcessKeyvalOptions*

\LoadClass[
    UTF8,
    twoside,
    zihao=-4,
    scheme=chinese,
    heading=true,
]{ctexrep}

% page size
\RequirePackage{geometry}
\geometry{
    a4paper,
    margin=15mm,
    top=2.5cm,
    bottom=2.5cm,
    left=2.5cm,
    right=2.5cm
}

% title
\ctexset{
    %% section number depth - subsubsection
    secnumdepth=3,
    %% toc depth - subsection
    tocdepth = 2,
    chapter={
        nameformat={},
        titleformat={},
        name={第,章},
        aftername={\quad},
        number={\chinese{chapter}},
        format={\heiti \zihao{-2} \centering},
        beforeskip={0.5ex},
        afterskip={0.5ex},
    },
    section={
        aftername={\quad},
        format={\heiti \zihao{-3} \raggedright},
        beforeskip={0.5ex},
        afterskip={0.5ex},
    },
    subsection={
        aftername={\quad},
        format={\heiti \zihao{4} \raggedright},
        beforeskip={0.5ex},
        afterskip={0.5ex},
    },
    subsubsection={
        aftername={\quad},
        format={\heiti \zihao{-4} \raggedright},
        afterskip={0.5ex},
        beforeskip={0.5ex},
    }
}


% header and footer for page
%% previous style
\newcommand{\prevstyle}{
    \pagestyle{plain}
    \setcounter{page}{1}
    \pagenumbering{Roman}
}

\RequirePackage{fancyhdr}
\setlength{\headheight}{14.5pt}
\fancypagestyle{main}{%
    \fancyhf{}
    \renewcommand{\headrulewidth}{1pt}
    \fancyhead[CO]{\songti \leftmark}
    \fancyhead[CE]{\songti \zihao{5}华南理工大学学士学位论文}
    \fancyfoot[C]{\zihao{5} \thepage}
}

\newcommand{\mainstyle}{
    \setcounter{page}{1}
    \pagenumbering{arabic}
    \pagestyle{main}
    %% https://tex.stackexchange.com/questions/117328/fancyhdr-does-not-apply-same-header-footer-on-chapter-and-non-chapter-pages
    %% attention: it will effect the abstract(chapter*) and tableofcontents
    \ctexset{
        chapter/pagestyle={main}
    }
}

% tableofcontents
\RequirePackage{titletoc}
\titlecontents{chapter}[0em]{\zihao{4}\heiti}{\contentspush{\thecontentslabel\hspace{0.7em}}}{}{\titlerule*[5pt]{.}\contentspage}
\titlecontents{section}[2.2em]{\zihao{-4}\songti}{\contentspush{\thecontentslabel\hspace{0.7em}}}{}{\titlerule*[5pt]{.}\contentspage}
\titlecontents{subsection}[3.9em]{\zihao{-4}\songti}{\contentspush{\thecontentslabel\hspace{0.7em}}}{}{\titlerule*[5pt]{.}\contentspage}

\newcommand{\chapterx}[1]{
    \chapter*{#1}
    \markboth{#1}{}
    \addcontentsline{toc}{chapter}{#1}
}

% English font for main body
\RequirePackage{times}
\setmainfont{Times New Roman}
% Chinese font for main body
%\setCJKmainfont{\CJKfamily{zhsong}}

% indent first line automatically
\RequirePackage{indentfirst}

% line spacing
\RequirePackage{setspace}
%% 1.5 line height for main body
%% TODO: no effect
%%\onehalfspacing

% float
\RequirePackage{float}

% columns
\RequirePackage{multicol}

% color
\RequirePackage[table,xcdraw]{xcolor}

% url
\RequirePackage{url}

% figure
\RequirePackage{graphicx}
\RequirePackage[]{subfig}
%\numberwithin{figure}{chapter}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
\captionsetup[subfigure]{labelformat=simple, labelsep=space}
\renewcommand\thesubfigure{\alph{subfigure})}

% table
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\renewcommand\tablename{表}
%\numberwithin{figure}{table}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}

% pseudocode
\RequirePackage{algorithm}
\floatname{algorithm}{算法}
\RequirePackage{algorithmic}
\renewcommand{\algorithmicrequire}{\textbf{输入:}}
\renewcommand{\algorithmicensure}{\textbf{输出:}}

% code
\RequirePackage{minted}

% math
%% number
\makeatletter
\@addtoreset{equation}{chapter}
\makeatother
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
%% display
\RequirePackage{amsmath}
\RequirePackage{amssymb}
%% term TODO
%%\RequirePackage{nomencl}
%% theorem
\RequirePackage{amsthm}
\theoremstyle{plain}
\newtheorem{theorem}{定理}[section]
\newtheorem{lemma}[theorem]{引理}
\newtheorem{proposition}[theorem]{命题}
\newtheorem*{corollary}{推论}
\theoremstyle{definition}
\newtheorem{definition}{定义}[section]
\newtheorem{conjecture}{猜想}[section]
\newtheorem{example}{例}[section]
\theoremstyle{remark}
\newtheorem*{remark}{\normalfont\heiti 评论}
\newtheorem*{note}{\normalfont\heiti 注}
\newtheorem{case}{\normalfont\heiti 案例}
\renewcommand*{\proofname}{\normalfont\heiti 证明}
%% custom setting
% \newcommand{\vect}[1]{\mathbf{#1}}      % vector
\newcommand{\vect}[1]{\boldsymbol{#1}}  % vector
\newcommand{\mat}[1]{\mathbf{#1}}       % matrix
\newcommand{\tensor}[1]{\mathcal{#1}}    % tensor
% \newcommand{\tensor}[1]{\mathsf{#1}}    % tensor
\newcommand{\set}[1]{\mathbb{#1}}       % set
\newcommand{\T}{\mathrm{T}}             % transposition
\newcommand{\tr}{\mathrm{tr}}             % trace
\everymath{\displaystyle}               % block style for inline math

% chemical
\RequirePackage{mhchem}
\RequirePackage{chemfig}

% unit
\RequirePackage{siunitx}

% caption
\RequirePackage[
    font={small},
    labelsep=space,
    tableposition=top,
    figureposition=bottom,
]{caption}

% reference
%% method 1
%%% \RequirePackage{biblatex}
%%% \addbibresource{ref.bib}
%%% \newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}
%%% superscript format surrounded by []= \upcite
%%% normal format surround with [] = \cite
%% method 2
\RequirePackage[style=gb7714-2015]{biblatex}
\addbibresource{ref.bib}
%%% superscript format surrounded by []= \cite or \upcite
%%% normal format surrounded  [] = \parencite
%%% superscript format = \supercite


% auto reference
\RequirePackage[
    colorlinks=true,
]{hyperref}
\newcommand{\algorithmautorefname}{算法}
\renewcommand{\tableautorefname}{表}
\renewcommand{\figureautorefname}{图}
\newcommand{\subfigureautorefname}{图}
\renewcommand{\equationautorefname}{式}
%\def\footnoteautorefname{脚注}
%\def\itemautorefname{项}%
%\def\tableautorefname{表}%
%\def\partautorefname{篇}%
%\def\appendixautorefname{附录}%
%\def\chapterautorefname{章}%
%\def\sectionautorefname{节}%
%\def\subsectionautorefname{小小节}%
%\def\subsubsectionautorefname{subsubsection}%
%\def\paragraphautorefname{段落}%
%\def\subparagraphautorefname{子段落}%
%\def\FancyVerbLineautorefname{行}%
%\def\theoremautorefname{定理}%

% cover
\newcommand{\cover}{
    \begin{titlepage}
        \begin{figure}[ht]
            \centering
            \includegraphics[height=2.75cm]{img/logo.png}
        \end{figure}
        \begin{center}
            \zihao{0}
            \heiti
            本科毕业论文
        \end{center}
        \begin{center}
            \zihao{1}
            \ \\
        \end{center}
        \begin{center}
            \zihao{2}
            \heiti
            \textbf{\Title}
        \end{center}
        \vfill
        \begin{spacing}{1.8}
            \begin{center}
                \zihao{-3}
                \songti
                \begin{tabular}{cc}
                    \makebox[2.2cm][s]{\textbf{学院}}\quad       & \makebox[6cm][s]{\hfill\textbf{\Institute}\hfill}   \\ \cline{2-2}
                    \makebox[2.2cm][s]{\textbf{专业}}\quad        & \makebox[6cm][s]{\hfill\textbf{\Major}\hfill}       \\ \cline{2-2}
                    \makebox[2.2cm][s]{\textbf{学生姓名}}\quad     & \makebox[6cm][s]{\hfill\textbf{\Name}\hfill}        \\ \cline{2-2}
                    \makebox[2.2cm][s]{\textbf{学生学号}}\quad     & \makebox[6cm][s]{\hfill\textbf{\StudentId}\hfill}   \\ \cline{2-2}
                    \makebox[2.2cm][s]{\textbf{指导教师}}\quad     & \makebox[6cm][s]{\hfill\textbf{\Supervisor}\hfill}  \\ \cline{2-2}
                    \makebox[2.2cm][s]{\textbf{提交日期}}\quad     & \makebox[6cm][s]{\hfill\textbf{\SubmitDate}\hfill}   \\ \cline{2-2}
                \end{tabular}
            \end{center}
        \end{spacing}
    \end{titlepage}
}

% abstract
%% Chinese abstract
\newenvironment{cabstract}{
    \chapter*{摘\quad~要}
    \addcontentsline{toc}{chapter}{摘要}
    \begin{spacing}{1.5}
        \zihao{-4}
        \songti
}{
    \end{spacing}
}
\newcommand{\ckeywords}[1]{\vskip1ex\par\noindent\zihao{-4}{\heiti 关键词: } \songti#1}
%% English abstract
\newenvironment{eabstract}{
    \chapter*{\fontspec{Times New Roman}Abstract}
    \addcontentsline{toc}{chapter}{Abstract}
    \begin{spacing}{1.5}
        \zihao{-4}
}{
    \end{spacing}
}
\newcommand{\ekeywords}[1]{\vskip1ex\par\noindent\zihao{-4}{\textbf{Keywords: }} #1}

