%---------------------------------------------------------
% This class file is for thesis/dissertation of
% National Central University, TW, adapted from 
%
% (1) ociamthesis v2.2 (22/11/2010) By Keith A. Gillow 
% <gillow@maths.ox.ac.uk>. Version 1.0 released 26/11/1997
% (2) also from "Minutes in less than Hours: 
% Using \LaTeX Resources" by Jim Hefferon,
% <ftpmaint@tug.ctan.org>
%
% By Jesse LO, Mechanical Engineering, NCU
%   
% For usages limited to personal and within an organization.
% If you modified this file, you should keep this section 
% and MOST importantly DO NOT use the same file name 
% as the file name is for this file EXCLUSIVELY.
%----------------------------------------------------------
\def\fileversion{1.41}
\def\filedate{2013/08/07} %{2012/11/30}
\typeout{}
\typeout{Document Class: ncuthesisCJK.cls 
        \filedate \space v\fileversion \space (Jesse LO)}
\typeout{for National Central University, TW.}
\typeout{}

%-------------------------- identification ----------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ncuthesisCJK}[2013/08/08 v1.41 NCU thesis]
%-------------------------- initial code ------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
%--------------------------- executation ----------------
\ProcessOptions\relax

\LoadClass[a4paper,openright]{report}  % 單雙面印刷 
\if@twoside\else\raggedbottom\fi 
\RequirePackage{graphicx}          % graphics, if any
\RequirePackage[T1]{fontenc}
\RequirePackage{CJKutf8,CJKnumb,CJKvert,fancyvrb,verbatim}
\RequirePackage{pdfpages,pdflscape,ifthen,showframe,printlen,calculator}
\RequirePackage[bookmarks=true,unicode=true,colorlinks=true,
pdfborder={0 0 0},pdfauthor={JCLO},linktoc=all,
pdftitle={An example in TeX/LaTeX/XeLaTeX}]{hyperref}       % 超聯結

%---------------------------- 中文化章節

\RequirePackage[compact]{titlesec}
\RequirePackage{titletoc}

\titleformat{\chapter}[block]
{\centering\Huge\bfseries}
{{\CJKnumber{\thechapter}、}}{1pc}{}
%----------------------------
\titleformat{\section}[block]{\flushleft\LARGE}
{\LARGE\enspace\sf\thesection\enspace}{1pc}{}
%----------------------------
\titleformat{\subsection}[block]{\flushleft\LARGE}
{\filright\enspace\LARGE\sf\thesubsection\enspace}{1pc}{}
%============================   % for Chinese toc 
\titlecontents{chapter}[0em]{}  
{\CJKnumber{\thecontentslabel}、\hspace{4em}}
{}{\titlerule*{.}\contentspage}

%----------------------------
\renewcommand{\indexname}{\protect \centering \bf索~引}
\renewcommand{\bibname}{\protect \centering \bf參~考~文~獻}
\renewcommand{\listfigurename}{\protect\centering\bf圖~目~錄}
\renewcommand{\listtablename}{\protect\centering\bf表~目~錄}
\renewcommand{\contentsname}{\protect \centering \bf目~錄}
\renewcommand{\figurename}{\protect \centering \bf 圖}
\renewcommand{\tablename}{\protect \centering \bf 表}
%\renewcommand*\l@chapter{\@dottedtocline{0}{1em}{5em}}
\renewcommand*\l@section{\@dottedtocline{1}{1em}{5em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{2em}{4em}}
%\renewcommand*\l@subsubsection{\@dottedtocline{3}{4.3em}{3em}}

% DECLARATIONS  宣告

\def\degreedate#1{\gdef\@degreedate{#1}}           % 畢業時間       
\def\degree#1{\gdef\@degree{#1}}                   % 學位
\def\dept#1{\gdef\@dept{#1}}                       % 系所
\def\mprof#1{\gdef\@mprof{#1}}                     % 指導教授
\def\sprof#1{\gdef\@sprof{#1}}                     % 共同指導
%\def\logo{\includegraphics[width=32mm]{NCU_logo}} % 校徽
\def\copyyear#1{\gdef\@copyyear{#1}}               % 版權
\def\subtitle#1{\gdef\@subtitle{#1}}               % 英文題目   
\SUBTRACT{\number\year}{1911}{\roc}
\def\today{
\CJKnumber{\roc}年\space\CJKnumber{\number\month}
月\space\CJKnumber{\number\day}日}
\DeclareOption{draft}{
\renewcommand\@oddhead{
\today \hfil 未完稿 v1.41 \hfil \copyright\ \@author}
}
\DeclareOption{noframe,twoside}{}
\ProcessOptions\relax
\hypersetup{final}
%  paper size

\setlength{\topmargin}{-0.5cm}
\setlength{\oddsidemargin}{5mm}
\setlength{\evensidemargin}{5mm}
\setlength{\textheight}{24cm}
\setlength{\textwidth}{15cm}

\uselengthunit{cm}
\newcommand{\printpagesize}{
\begin{tabular}{l@{ : }r}
The top margin is & \printlength{\topmargin}\\
The odd side margin is & \printlength{\oddsidemargin}\\
The even side margin is & \printlength{\evensidemargin}\\
The text height is & \printlength{\textheight}\\
The text width is  & \printlength{\textwidth}\\
The paper height is & \printlength{\paperheight}\\
The paper width is  &\printlength{\paperwidth}
\end{tabular}
}

% Environments

\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi
       \begin{CJK}{UTF8}{bkai}}%
       {\clearpage\end{CJK}
       \if@restonecol\twocolumn
       \else\newpage\thispagestyle{empty}\fi}

% --------define title page layout for thesis
\newboolean{printcopyright}
\setboolean{printcopyright}{false}
\renewcommand{\maketitle}
{\begin{alwayssingle}
\thispagestyle{empty}
  \null\vfill
\begin{center}
{\Huge\textbf {國\quad立\quad中\quad央\quad大\quad學}\par}
\vspace*{30mm}
{\Huge {\@dept} \par}
\vspace*{2ex}
{\Huge {\@degree}論文\par}	
\vspace*{20mm}
{\Huge {\@title} \par}
\vspace*{5mm}
{\Huge {\@subtitle} \par}
\vspace*{30mm}
{{\Large  {\quad 研究生$\colon$ \@author}} \par}
\vspace*{2ex}
{{\Large {指導教授$\colon$ \@mprof}} \par}
\vspace*{2ex}
{{\Large {\@sprof}} \par}   % 共同指導 (different from Xe)
\vspace*{5ex}
{\Huge {\@degreedate} \par}
\vspace*{2ex}
\ifthenelse{\boolean{printcopyright}}
{{{版權所有\copyright\ \@author\ \@copyyear} \par}}
{\hspace{5cm}}
\end{center}
\renewcommand\bg@material{}
\null\vfill
\end{alwayssingle}}
%--------end of title page for thesis

% 先定義一單欄式的新環境(onecol) 需輸入一標題變數。

\newenvironment{onecol}[1]
{\cleardoublepage\phantomsection
\addcontentsline{toc}{chapter}{#1}
\begin{alwayssingle}
\thispagestyle{plain}
\begin{center}
{\Large \@title \par \vspace*{1ex}}
{\Large \@subtitle \par \vspace*{1.0cm}}
{\large \bfseries #1}
\end{center}}
{\null \vfill
\end{alwayssingle}}
%----------- No thesis title on the top
\newenvironment{onecolnotitle}[1]
{\cleardoublepage\phantomsection
\addcontentsline{toc}{chapter}{#1}
\begin{alwayssingle}
\thispagestyle{plain}
\begin{center}
{\Large \bfseries #1}
\end{center}}
{\null \vfill
\end{alwayssingle}}

% acknowldegements

\newenvironment{acknowledgements}
{\begin{onecol}{謝誌}} 
{\end{onecol}}

% abstract for english

\newenvironment{abstracten}
{\begin{onecol}{英文摘要}}
{\end{onecol}}

% abstract for chinese

\newenvironment{abstractcn} 
{\begin{onecol}{中文摘要}} 
{\end{onecol}}

\newenvironment{appendA} 
{\begin{onecolnotitle}{附錄一}
\setcounter{section}{0}
\renewcommand\thesection{A.\arabic{section}}
\renewcommand\theequation{A.\arabic{equation}}}
{\end{onecolnotitle}}

\newenvironment{appendB} 
{\begin{onecolnotitle}{附錄二}
\setcounter{section}{0}
\renewcommand\thesection{B.\arabic{section}}
\renewcommand\theequation{B.\arabic{equation}}}
{\end{onecolnotitle}}

\newenvironment{symbols}
{\begin{onecol}{符號說明}}
{\end{onecol}}

%---------- To generate a short bookbone
\newcommand{\bookbone}
{\thispagestyle{empty}
\begin{CJK}{UTF8}{bkai}
\begin{landscape}
\noindent
\CJKvert{
\hspace{1cm}
{\rotatebox{90}{\makebox{100}}}\hspace{0.5cm}
\begin{tabular}{c}
國立中央大學\\
\@dept
\end{tabular}
\hspace{0cm}
\LARGE{{\@degree}論文\hspace{0.5cm}
{\@title}\hspace{0.5cm}
{\@author}撰\hspace{1cm}}}
\end{landscape}
\clearpage
\end{CJK}}
%------------- Indentation
\leftskip 0cm
\parindent 1cm   % 內縮
\makeatletter
\let\@afterindentfalse\@afterindenttrue
\@afterindenttrue
\makeatother
%-------------end of ncuthesis  totaling 254 lines