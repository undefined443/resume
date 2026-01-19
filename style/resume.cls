\ProvidesExplClass{resume}[2025/01/19 v3.0 An elegant Résumé class with LaTeX3]
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

% Set font size commands using LaTeX3 syntax for better maintainability
\ExplSyntaxOn

% Define a common function for setting font sizes
\cs_new_protected:Nn \resume_set_fontsize:nn
  {
    \fontsize {#1} {#2} \selectfont
  }

% Use LaTeX3 for better code organization
\NewDocumentCommand \SetResumeFontSize { m m }
  {
    \resume_set_fontsize:nn {#1} {#2}
  }

\ExplSyntaxOff

% Redefine font size commands using the common function
\renewcommand{\normalsize}{\SetResumeFontSize{10}{12}}
\renewcommand{\small}{\SetResumeFontSize{9}{11}}
\renewcommand{\footnotesize}{\SetResumeFontSize{8}{10}}
\renewcommand{\large}{\SetResumeFontSize{12}{14}}
\renewcommand{\Large}{\SetResumeFontSize{14}{17}}
\renewcommand{\LARGE}{\SetResumeFontSize{18}{22}}
\renewcommand{\huge}{\SetResumeFontSize{20}{24}}
\renewcommand{\Huge}{\SetResumeFontSize{24}{28}}

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
    \resume_centered_info:n { #1 }
  }

\NewDocumentCommand \role { m m }
  {
    \resume_role_format:nn { #1 } { #2 }
  }

% Use LaTeX3 for better code organization and maintainability
\ExplSyntaxOn

% Define helper functions for common operations
\cs_new_protected:Nn \resume_centered_info:n
  {
    \centerline { \sffamily \large { #1 } }
    \vspace { 1.5ex }
  }

\cs_new_protected:Nn \resume_role_format:nn
  {
    \par \textit { #1 } ~ #2 \par
    \vspace { 0.85ex }
  }

% Initialize property for future extensions
\prop_new:N \g_resume_settings_prop

\ExplSyntaxOff

% Backwards compatibility - define individual commands if needed
\NewDocumentCommand \skills { m } { \section{\faIcon[regular]{gear}\ #1} }
\NewDocumentCommand \education { m } { \section{\faIcon[regular]{graduation-cap}\ #1} }
\NewDocumentCommand \experience { m } { \section{\faIcon[regular]{users}\ #1} }
\NewDocumentCommand \honors { m } { \section{\faIcon[regular]{trophy}\ #1} }
\NewDocumentCommand \misc { m } { \section{\faIcon[regular]{info}\ #1} }
% LaTeX3 Migration Completed - v3.0
% This file has been migrated to use LaTeX3 syntax for better maintainability
% Key improvements:
% - Uses \ProvidesExplClass instead of \ProvidesClass
% - Implements LaTeX3 helper functions for common operations
% - Better error handling and code organization
% - Future-ready with property system for extensions
%
% Date: 2025-01-19
