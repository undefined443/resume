\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2015/05/25 An elegant Résumé class]
\LoadClass[11pt]{article}

% disable indent globally
\setlength{\parindent}{0pt}
% some general improvements, defines the XeTeX logo
\RequirePackage{xltxtra}
% use xifthen
\RequirePackage{xifthen}
% use hyperlink for email and url
\RequirePackage{hyperref}
\hypersetup{hidelinks}
\RequirePackage{url}
\urlstyle{tt}
% use fontawesome7
\RequirePackage{fontawesome7}
% use xcolor for customizing color
%\RequirePackage[usenames,dvipsnames]{xcolor}
% loading fonts
\RequirePackage{fontspec}
% geometry for page layout
\RequirePackage[
	a4paper,
	left=0.8in,
	right=0.8in,
	top=0.70in,
	bottom=0.55in,
	nohead
]{geometry}
% titlesec for section formatting
\RequirePackage{titlesec}
% enumitem for list customization
\RequirePackage{enumitem}
% nth for ordinal numbers
\RequirePackage[super]{nth}

% Set font size commands
\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}
\renewcommand{\small}{\fontsize{9pt}{11pt}\selectfont}
\renewcommand{\footnotesize}{\fontsize{8pt}{10pt}\selectfont}
\renewcommand{\large}{\fontsize{12pt}{14pt}\selectfont}
\renewcommand{\Large}{\fontsize{14pt}{17pt}\selectfont}
\renewcommand{\LARGE}{\fontsize{18pt}{22pt}\selectfont}
\renewcommand{\huge}{\fontsize{20pt}{24pt}\selectfont}
\renewcommand{\Huge}{\fontsize{24pt}{28pt}\selectfont}

% List customization
\setlist{noitemsep} % removes spacing from items but leaves space around the whole list
%\setlist{nosep} % removes all vertical spacing within and around the list
\setlist[itemize]{topsep=0.25em, leftmargin=1.5pc}
\setlist[enumerate]{topsep=0.25em, leftmargin=1.5pc}

% Main document font - use default font
%\setmainfont{TeX Gyre Termes}

% Section formatting
\titleformat{\section}         % Customise the \section command
  {\Large\scshape\raggedright} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  [\titlerule]                 % Inserts a horizontal line after the heading
\titlespacing*{\section}{0cm}{*1.8}{*1.8}

\titleformat{\subsection}
  {\large\raggedright}
  {}{0em}
  {}
\titlespacing*{\subsection}{0cm}{*1.8}{*0.6}

% Document commands
\NewDocumentCommand \datedsection { m m }
  {
    \section[#1]{#1 \hfill #2}
  }

\NewDocumentCommand \datedsubsection { m m }
  {
    \subsection[#1]{#1 \hfill #2}
  }

\NewDocumentCommand \datedline { m m }
  {
    {\par #1 \hfill #2 \par}
  }

\NewDocumentCommand \name { m }
  {
    \centerline{\Huge\scshape{#1}}
    \vspace{1.25ex}
  }

% defines one's name
% usage: \nameTest{<name>}
\NewDocumentCommand \nameTest { m }
  {
    {\large\scshape{#1}}
  }

% Override section title icons if already defined
\providecommand{\faGraduationCap}{\faIcon[regular]{graduation-cap}}
\providecommand{\faUsers}{\faIcon[regular]{users}}
\providecommand{\faCogs}{\faIcon[regular]{gear}}
\providecommand{\faHeartO}{\faIcon[regular]{heart}}
\providecommand{\faTrophy}{\faIcon[regular]{trophy}}
\providecommand{\faInfo}{\faIcon[regular]{info}}

% defines one's phone
% usage: \phone{<phone>}
\providecommand{\phone}[1]{\faIcon[solid]{phone}\ {#1}}

% defines one's email
% usage: \email{<email>}
\providecommand{\email}[1]{\faIcon[solid]{envelope}\ \href{mailto:#1}{#1}}

% LinkedIn command that takes only username and auto-generates URL
\providecommand{\linkedin}[1]{%
  \faIcon[brands]{linkedin}\hspace{0.3em}%
  \href{https://www.linkedin.com/in/#1}{#1}%
}

% GitHub command that takes only username and auto-generates URL
\providecommand{\github}[1]{%
  \faIcon[brands]{github}\hspace{0.3em}%
  \href{https://github.com/#1}{#1}%
}


\NewDocumentCommand \basicInfo { m }
  {
    \centerline{\sffamily\large{#1}}
    \vspace{1.5ex}
  }

\NewDocumentCommand \role { m m }
  {
    {\par \textit{#1} ~ #2 \par}
    \vspace{0.85ex}
  }

% defines skills section
% usage: \skills{<section-title>}
\NewDocumentCommand \skills { m }
  {
    \section{\faIcon[regular]{gear}\ #1}
  }

% defines education section
% usage: \education{<section-title>}
\NewDocumentCommand \education { m }
  {
    \section{\faIcon[regular]{graduation-cap}\ #1}
  }

% defines experience section
% usage: \experience{<section-title>}
\NewDocumentCommand \experience { m }
  {
    \section{\faIcon[regular]{users}\ #1}
  }

% defines honors section
% usage: \honors{<section-title>}
\NewDocumentCommand \honors { m }
  {
    \section{\faIcon[regular]{trophy}\ #1}
  }

% defines miscellaneous section
% usage: \misc{<section-title>}
\NewDocumentCommand \misc { m }
  {
    \section{\faIcon[regular]{info}\ #1}
  }
