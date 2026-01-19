#!/usr/bin/env perl

# LaTeXmk configuration for resume project
# This file configures latexmk for optimal compilation

@default_files = ('resume.tex', 'resume-with-avator.tex', 'resume-zh_CN.tex');

# Set default xelatex as the engine
$xelatex = 'xelatex %O %S';

# Clean up unwanted files
@clean_extensions = (
    "aux", "bbl", "blg", "fdb_latexmk", "fls", "log",
    "out", "synctex.gz", "toc", "lot", "lof", "gz",
    "run.xml", "bcf", "glo", "gls", "glsdefs", "idx",
    "ilg", "ind", "ptc", "end"
);

# Set biber command for bibliography
$biber = 'biber %O %B';
$latex = 'xelatex %O %S';
$pdf_mode = 5;  # Use biber backend

# Enable automatic dependency tracking
$recorder = 1;

# Set default bibliography style
$default_bibliography = 'reference';

# Set default bibliography style
$default_bibliography_style = 'IEEEtran';

# Enable quiet mode
$quiet = 2;

# Set output directory to build
$out_dir = 'build';

ensure_path('TEXINPUTS', './style//');
ensure_path('BIBINPUTS', './references//');
ensure_path('BSTINPUTS', './style//');
