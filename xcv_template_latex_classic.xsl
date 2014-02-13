<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" encoding="UTF-8"/>

<xsl:variable name="documentPre">
<xsl:text>
\documentclass[10pt]{article}
\usepackage[utf8]{inputenc}
\usepackage[french]{babel}

\usepackage{array, xcolor, lipsum, bibentry}
\usepackage[margin=3cm]{geometry}

\title{\bfseries\Huge Tom T. Texblog}
\author{texblog+cv@gmail.com}
\date{}

\definecolor{lightgray}{gray}{0.8}
\newcolumntype{L}{>{\raggedleft}p{0.14\textwidth}}
\newcolumntype{R}{p{0.8\textwidth}}
\newcommand\VRule{\color{lightgray}\vrule width 0.5pt}

\begin{document}
\maketitle
\vspace{1em}
</xsl:text>
</xsl:variable>

<xsl:variable name="documentPost">
<xsl:text>
{\vspace{20pt}\newline\newline
\vspace{20pt}
\scriptsize\hfill Created by xcv, scripted by Josuah Aron.}

\end{document}
</xsl:text>
</xsl:variable>

<xsl:variable name="addressPre">
<xsl:text>
\begin{minipage}[ht]{0.48\textwidth}
</xsl:text>
</xsl:variable>

<xsl:variable name="addressPost">
<xsl:text>
\end{minipage}
</xsl:text>
</xsl:variable>

</xsl:stylesheet>