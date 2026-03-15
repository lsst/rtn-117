# Prefer local UTF-8 lineno.sty (TeX Live ships ISO-8859-1; XeLaTeX expects UTF-8).
$ENV{'TEXINPUTS'} = '.:' . ($ENV{'TEXINPUTS'} // '');
# BibTeX 0.99d corrupts UTF-8 in .bib; bibtexu writes valid UTF-8 .bbl for XeLaTeX.
$bibtex = 'bibtexu %O %S';
