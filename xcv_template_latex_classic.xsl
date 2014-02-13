<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
               xmlns:xcv="http://dje.josuah.aron/09/05/1983/xcv"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:output method="text" omit-xml-declaration="yes" encoding="UTF-8"/>

<xsl:template match="xcv:cv">
<xsl:text>
\documentclass[10pt]{article}
\usepackage[utf8]{inputenc}
\usepackage[french]{babel}
%\usepackage[T1]{fontenc}

\usepackage{array, xcolor, lipsum, bibentry}
\usepackage[margin=3cm]{geometry}&#xA;&#xA;
</xsl:text>

<!-- OWNER'S NAME AND QUALIFICATION -->
<!-- these will be added by the \maketitle command -->
<xsl:text>\title{\bfseries\Huge </xsl:text>
<xsl:value-of select="xcv:identity/xcv:definitive/xcv:name/xcv:firstname"/>
<xsl:text> </xsl:text>
<xsl:value-of select="xcv:identity/xcv:definitive/xcv:name/xcv:lastname"/>
<xsl:text>}&#xA;\author{</xsl:text>
<xsl:value-of select="xcv:identity/xcv:evolving/xcv:qualification"/>
<xsl:text>}&#xA;&#xA;</xsl:text>

<xsl:text>
\date{} %delete the date

\definecolor{lightgray}{gray}{0.8}
\newcolumntype{L}{>{\raggedleft}p{0.14\textwidth}}
\newcolumntype{R}{p{0.8\textwidth}}
\newcommand\VRule{\color{lightgray}\vrule width 0.5pt}

\begin{document}
\maketitle
\vspace{1em}&#xA;
</xsl:text>

  <!-- OWNER'S ADDRESS -->
<xsl:text>\begin{minipage}[ht]{0.45\textwidth}&#xA;</xsl:text>
<xsl:value-of select="xcv:identity/xcv:evolving/xcv:address/xcv:appartment/xcv:appmisc"/>
<xsl:text>, bat. </xsl:text><xsl:value-of select="xcv:identity/xcv:evolving/xcv:address/xcv:appartment/xcv:building"/>
<xsl:text>, app. </xsl:text><xsl:value-of select="xcv:identity/xcv:evolving/xcv:address/xcv:appartment/xcv:appnum"/>
<xsl:text>\\&#xA;</xsl:text><xsl:value-of select="xcv:identity/xcv:evolving/xcv:address/xcv:road/xcv:rdnum"/>
<xsl:text> </xsl:text><xsl:value-of select="xcv:identity/xcv:evolving/xcv:address/xcv:road/xcv:rdext"/>
<xsl:text> </xsl:text><xsl:value-of select="xcv:identity/xcv:evolving/xcv:address/xcv:road/xcv:rdtype"/>
<xsl:text> </xsl:text><xsl:value-of select="xcv:identity/xcv:evolving/xcv:address/xcv:road/xcv:rdname"/>
<xsl:text>\\&#xA;</xsl:text><xsl:value-of select="xcv:identity/xcv:evolving/xcv:address/xcv:zipcode"/>
<xsl:text> </xsl:text><xsl:value-of select="xcv:identity/xcv:evolving/xcv:address/xcv:city"/>
<xsl:text>, </xsl:text><xsl:value-of select="xcv:identity/xcv:evolving/xcv:address/xcv:country"/>
<xsl:text>&#xA;\end{minipage}&#xA;&#xA;</xsl:text>

  <!-- OWNER'S CONTACTS -->
<xsl:text>\begin{minipage}[ht]{0.45\textwidth}&#xA;</xsl:text>
<xsl:text>Nationalité </xsl:text><xsl:value-of select="xcv:identity/xcv:definitive/xcv:nationality"/>
<xsl:text>\\&#xA;+</xsl:text><xsl:value-of select="xcv:identity/xcv:evolving/xcv:phone/xcv:phonecode"/><xsl:text> </xsl:text><xsl:value-of select="xcv:identity/xcv:evolving/xcv:phone/xcv:phonenum"/>
<xsl:text>\\&#xA;</xsl:text><xsl:value-of select="xcv:identity/xcv:evolving/xcv:email"/>
<xsl:text>&#xA;\end{minipage}&#xA;\vspace{20pt}&#xA;&#xA;</xsl:text>

  <!-- CV OBJECTIVE -->
<xsl:text>\section*{Objectif}&#xA;</xsl:text>
<xsl:value-of select="./xcv:objective"/>

  <!-- EXPERIENCE -->
<xsl:text>&#xA;&#xA;\section*{Expérience Professionnelle}&#xA;</xsl:text>
<xsl:text>\begin{tabular}{L!{\VRule}R}&#xA;</xsl:text>
<xsl:for-each select="xcv:experience/xcv:position">
  <xsl:value-of select="./xcv:begin/xcv:year"/><xsl:text>--</xsl:text><xsl:value-of select="./xcv:end/xcv:year"/><xsl:text>&amp;</xsl:text>
  <xsl:value-of select="./xcv:title"/><xsl:text>, </xsl:text><xsl:value-of select="./xcv:company"/><xsl:text>, </xsl:text><xsl:value-of select="./xcv:location/xcv:city"/><xsl:text> - </xsl:text><xsl:value-of select="./xcv:location/xcv:country"/>
  <xsl:text>\\&#xA;</xsl:text>
</xsl:for-each>
<xsl:text>\end{tabular}&#xA;&#xA;</xsl:text>

  <!-- JOBS --><!-- Need for reuse of EXPERIENCE -->
<xsl:text>\section*{Expériences annexes}&#xA;</xsl:text>
<xsl:text>\begin{tabular}{L!{\VRule}R}&#xA;</xsl:text>
<xsl:for-each select="xcv:jobs/xcv:position">
  <xsl:value-of select="./xcv:begin/xcv:year"/><xsl:text>--</xsl:text><xsl:value-of select="./xcv:end/xcv:year"/><xsl:text>&amp;</xsl:text>
  <xsl:value-of select="./xcv:title"/><xsl:text>, </xsl:text><xsl:value-of select="./xcv:company"/><xsl:text>, </xsl:text><xsl:value-of select="./xcv:location/xcv:city"/><xsl:text> - </xsl:text><xsl:value-of select="./xcv:location/xcv:country"/>
  <xsl:text>\\&#xA;</xsl:text>
</xsl:for-each>
<xsl:text>\end{tabular}&#xA;&#xA;</xsl:text>

  <!-- WORKS (realizations) -->
<xsl:text>\section*{Travaux}&#xA;</xsl:text>
<xsl:text>\begin{tabular}{L!{\VRule}R}&#xA;</xsl:text>
<xsl:for-each select="xcv:works/xcv:realizations/xcv:realization">
  <xsl:value-of select="./xcv:begin/xcv:year"/><xsl:text>--</xsl:text><xsl:value-of select="./xcv:end/xcv:year"/><xsl:text>&amp;</xsl:text>
  <xsl:value-of select="./xcv:title"/><xsl:text>(</xsl:text><xsl:value-of select="./xcv:domain"/><xsl:text>), </xsl:text><xsl:value-of select="./xcv:institute"/><xsl:text>, </xsl:text><xsl:value-of select="./xcv:workstatus"/>
  <xsl:text>\\&#xA;</xsl:text>
</xsl:for-each>
<xsl:text>\end{tabular}&#xA;&#xA;</xsl:text>

  <!-- WORKS (projects) --> <!-- Need for reuse of WORKS (realizations) -->
<xsl:text>\section*{Projets}&#xA;</xsl:text>
<xsl:text>\begin{tabular}{L!{\VRule}R}&#xA;</xsl:text>
<xsl:for-each select="xcv:works/xcv:projects/xcv:project">
  <xsl:value-of select="./xcv:begin/xcv:year"/><xsl:text>--</xsl:text><xsl:value-of select="./xcv:end/xcv:year"/><xsl:text>&amp;</xsl:text>
  <xsl:value-of select="./xcv:title"/><xsl:text>(</xsl:text><xsl:value-of select="./xcv:domain"/><xsl:text>), </xsl:text><xsl:value-of select="./xcv:institute"/><xsl:text>, </xsl:text><xsl:value-of select="./xcv:workstatus"/>
  <xsl:text>\\&#xA;</xsl:text>
</xsl:for-each>
<xsl:text>\end{tabular}&#xA;&#xA;</xsl:text>

  <!-- SKILLS (expertise) -->
<xsl:text>\section*{Compétences principales}&#xA;</xsl:text>
<xsl:text>\begin{tabular}{L!{\VRule}l}&#xA;</xsl:text>
<xsl:for-each select="xcv:skills/xcv:expertise/xcv:domain">
  <xsl:value-of select="./@name"/><xsl:text>&amp;</xsl:text>
  <xsl:for-each select="./xcv:skill">
    <xsl:if test="position()>1">
      <xsl:text>&amp;</xsl:text>
    </xsl:if>
    <xsl:value-of select="./xcv:title"/><xsl:text>: </xsl:text>
    <xsl:value-of select="./xcv:level"/><xsl:text>, </xsl:text>
    <xsl:value-of select="./xcv:details"/>
    <xsl:text>\\&#xA;</xsl:text>
  </xsl:for-each>
    <xsl:text>&amp;\\&#xA;</xsl:text>
</xsl:for-each>
<xsl:text>\end{tabular}&#xA;&#xA;</xsl:text>

  <!-- SKILLS (other) --><!-- Need for reuse of SKILLS (expertise) -->
<xsl:text>\section*{Autres Compétences}&#xA;</xsl:text>
<xsl:text>\begin{tabular}{L!{\VRule}R}&#xA;</xsl:text>
<xsl:for-each select="xcv:skills/xcv:other/xcv:domain">
  <xsl:value-of select="./@name"/><xsl:text>&amp;</xsl:text>
  <xsl:for-each select="./xcv:skill">
    <xsl:value-of select="./xcv:title"/><xsl:text>, </xsl:text>
    <xsl:value-of select="./xcv:level"/><xsl:text>, </xsl:text>
    <xsl:value-of select="./xcv:details"/>
    <xsl:text>\\&#xA;</xsl:text>
  </xsl:for-each>
    <xsl:text>&amp;\\&#xA;</xsl:text>
</xsl:for-each>
<xsl:text>\end{tabular}&#xA;&#xA;</xsl:text>

  <!-- EDUCATION (university)-->
<xsl:text>\section*{Cursus universitaire}&#xA;</xsl:text>
<xsl:text>\begin{tabular}{L!{\VRule}R}&#xA;</xsl:text>
<xsl:for-each select="xcv:education/xcv:degrees/xcv:degree">
  <xsl:value-of select="./xcv:begin/xcv:year"/><xsl:text>--</xsl:text><xsl:value-of select="./xcv:end/xcv:year"/><xsl:text>&amp;</xsl:text>
  <xsl:value-of select="./xcv:title"/><xsl:text> (</xsl:text><xsl:value-of select="./xcv:status"/><xsl:text>), </xsl:text><xsl:value-of select="./xcv:institute"/><xsl:text>, </xsl:text><xsl:value-of select="./xcv:location/xcv:city"/><xsl:text> - </xsl:text><xsl:value-of select="./xcv:location/xcv:country"/>
  <xsl:text>\\&#xA;</xsl:text>
</xsl:for-each>
<xsl:text>\end{tabular}&#xA;&#xA;</xsl:text>

  <!-- EDUCATION (certificates)--><!-- Need for reuse of EDUCATION (university) -->
<xsl:text>\section*{Certificats}&#xA;</xsl:text>
<xsl:text>\begin{tabular}{L!{\VRule}R}</xsl:text>
<xsl:for-each select="xcv:education/xcv:certificates/xcv:certificate">
  <xsl:value-of select="./xcv:begin/xcv:year"/><xsl:text>--</xsl:text><xsl:value-of select="./xcv:end/xcv:year"/><xsl:text>&amp;</xsl:text>
  <xsl:value-of select="./xcv:title"/><xsl:text> (</xsl:text><xsl:value-of select="./xcv:status"/><xsl:text>), </xsl:text><xsl:value-of select="./xcv:institute"/><xsl:text>, </xsl:text><xsl:value-of select="./xcv:location/xcv:city"/><xsl:text> - </xsl:text><xsl:value-of select="./xcv:location/xcv:country"/>
  <xsl:text>\\&#xA;</xsl:text>
</xsl:for-each>
<xsl:text>\end{tabular}&#xA;&#xA;</xsl:text>

  <!-- LANGUAGES -->
<xsl:text>\section*{Langues}&#xA;</xsl:text>
<xsl:text>\begin{tabular}{L!{\VRule}R}&#xA;</xsl:text>
<xsl:for-each select="xcv:languages/xcv:lang">
  <xsl:value-of select="./xcv:title"/><xsl:text>&amp;</xsl:text>
  <xsl:value-of select="./xcv:level"/><xsl:text>, </xsl:text>
  <xsl:value-of select="./xcv:details"/>
  <xsl:text>\\&#xA;</xsl:text>
</xsl:for-each>
<xsl:text>\end{tabular}&#xA;&#xA;</xsl:text>

  <!-- HONORS -->
<xsl:text>\section*{Distinctions}&#xA;</xsl:text>
<xsl:text>\begin{tabular}{L!{\VRule}R}&#xA;</xsl:text>
<xsl:for-each select="xcv:honors/xcv:distinction">
  <xsl:value-of select="./xcv:year"/><xsl:text>&amp;</xsl:text>
  <xsl:value-of select="./xcv:title"/><xsl:text>, </xsl:text>
  <xsl:value-of select="./xcv:institute"/><xsl:text>, </xsl:text>
  <xsl:value-of select="./xcv:details"/>
  <xsl:text>\\&#xA;</xsl:text>
</xsl:for-each>
<xsl:text>\end{tabular}&#xA;&#xA;</xsl:text>

  <!-- INTEREST -->
<xsl:text>\section*{Centres d'intérêts}&#xA;</xsl:text>
<xsl:text>\begin{tabular}{L!{\VRule}R}&#xA;</xsl:text>
<xsl:for-each select="xcv:interest/xcv:item">
  <xsl:value-of select="./xcv:title"/><xsl:text>&amp;</xsl:text>
  <xsl:value-of select="./xcv:details"/>
  <xsl:text>\\&#xA;</xsl:text>
</xsl:for-each>
<xsl:text>\end{tabular}&#xA;&#xA;</xsl:text>

  <!-- PUBLICATIONS -->
<xsl:text>\section*{Publications}&#xA;</xsl:text>
<xsl:text>\begin{tabular}{L!{\VRule}R}&#xA;</xsl:text>
<xsl:for-each select="xcv:publications/xcv:publication">
  <xsl:value-of select="./xcv:year"/><xsl:text>&amp;</xsl:text>
  <xsl:text>"</xsl:text><xsl:value-of select="./xcv:title"/><xsl:text>", </xsl:text>
  <xsl:value-of select="./xcv:editor"/><xsl:text> - </xsl:text><xsl:value-of select="./xcv:year"/>
  <xsl:text>\\&#xA;</xsl:text>
</xsl:for-each>
<xsl:text>\end{tabular}&#xA;&#xA;</xsl:text>

  <!-- CONFERENCES -->
<xsl:text>\section*{Conférences}&#xA;</xsl:text>
<xsl:text>\begin{tabular}{L!{\VRule}R}&#xA;</xsl:text>
<xsl:for-each select="xcv:conferences/xcv:conference">
  <xsl:value-of select="./xcv:year"/><xsl:text>&amp;</xsl:text>
  <xsl:value-of select="./xcv:theme"/><xsl:text>, </xsl:text>
  <xsl:text>"</xsl:text><xsl:value-of select="./xcv:title"/><xsl:text>", </xsl:text>
  <xsl:value-of select="./xcv:institute"/><xsl:text>, </xsl:text>
  <xsl:value-of select="./xcv:location/city"/><xsl:text> - </xsl:text><xsl:value-of select="./xcv:location/country"/><xsl:text>, </xsl:text>
  <xsl:value-of select="./xcv:details"/>
  <xsl:text>\\&#xA;</xsl:text>
</xsl:for-each>
<xsl:text>&#xA;\end{tabular}&#xA;&#xA;</xsl:text>

<xsl:text>
{\vspace{20pt}%\newline\newline
\vspace{20pt}
\scriptsize\hfill Created by xcv, scripted by Josuah Aron.}

\end{document}
</xsl:text>
</xsl:template>

</xsl:stylesheet>