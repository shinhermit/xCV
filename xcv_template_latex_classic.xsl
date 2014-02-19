<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
		xmlns:xcv="http://dje.josuah.aron/09/05/1983/xcv"
		xmlns:xtr="http://dje.josuah.aron/09/05/1983/xtranslate"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" omit-xml-declaration="yes" encoding="UTF-8"/>

  <!-- ******** Transforms are defined as functions, for reuse and "from-file-ordering" ******** -->
  <!-- EXPERIENCE AND JOBS (positions) -->
  <xsl:template name="jobsTemplate">
    <xsl:param name="sectionTitle"/>
    <xsl:param name="items"/>

    <xsl:if test="$items">
      <xsl:text>\section*{</xsl:text><xsl:value-of select="$sectionTitle"/><xsl:text>}&#xA;</xsl:text>
      <xsl:text>\begin{tabular}{L!{\VRule}R}&#xA;</xsl:text>
      <xsl:for-each select="$items">
	<xsl:variable name="begin" select="./xcv:begin/xcv:year"/>
	<xsl:value-of select="$begin"/>
	<xsl:if test="$begin/text()">
	  <xsl:text> -- </xsl:text>
	</xsl:if>
	<xsl:value-of select="./xcv:end/xcv:year"/><xsl:text>&amp;</xsl:text>
	<xsl:value-of select="./xcv:title"/>
	<xsl:variable name="company" select="./xcv:company"/>
	<xsl:if test="$company/text()">
	  <xsl:text>, </xsl:text>
	</xsl:if>
	<xsl:value-of select="$company"/>
	<xsl:variable name="city" select="./xcv:location/xcv:city"/>
	<xsl:if test="$city/text()">
	  <xsl:text>, </xsl:text>
	</xsl:if>
	<xsl:value-of select="$city"/>
	<xsl:variable name="country" select="./xcv:location/xcv:country"/>
	<xsl:if test="$country/text()">
	  <xsl:text> - </xsl:text>
	</xsl:if>
	<xsl:value-of select="$country"/>
	<xsl:text>\\&#xA;</xsl:text>
      </xsl:for-each>
      <xsl:text>\end{tabular}&#xA;&#xA;</xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- WORKS (realizations) AND WORKS (projects) -->
  <xsl:template name="worksTemplate">
    <xsl:param name="sectionTitle"/>
    <xsl:param name="items"/>

    <xsl:if test="$items">
      <xsl:text>\section*{</xsl:text><xsl:value-of select="$sectionTitle"/><xsl:text>}&#xA;</xsl:text>
      <xsl:text>\begin{tabular}{L!{\VRule}R}&#xA;</xsl:text>
      <xsl:for-each select="$items">
	<xsl:value-of select="./xcv:begin/xcv:month"/>
	<xsl:if test="./xcv:begin/xcv:month/text()">
	  <xsl:text>-</xsl:text>
	</xsl:if>
	<xsl:value-of select="./xcv:begin/xcv:year"/>
	<xsl:variable name="end" select="./xcv:end/xcv:year"/>
	<xsl:if test="$end/text()">
	  <xsl:text> -- </xsl:text>
	</xsl:if>
	<xsl:value-of select="./xcv:end/xcv:month"/>
	<xsl:if test="./xcv:end/xcv:month/text()">
	  <xsl:text>-</xsl:text>
	</xsl:if>
	<xsl:value-of select="$end"/><xsl:text>&amp;</xsl:text>
	<xsl:value-of select="./xcv:title"/>
	<xsl:variable name="metier" select="./xcv:metier"/>
	<xsl:if test="$metier/text()">
	  <xsl:text> (</xsl:text>
	  <xsl:value-of select="$metier"/>
	  <xsl:text>)</xsl:text>
	</xsl:if>
	<xsl:variable name="institute" select="./xcv:institute"/>
	<xsl:if test="$institute/text()">
	  <xsl:text>, </xsl:text>
	  <xsl:value-of select="$institute"/>
	</xsl:if>
	<xsl:variable name="workstatus" select="./xcv:workstatus"/>
	<xsl:if test="$workstatus/text()">
	  <xsl:text>, </xsl:text>
	  <xsl:value-of select="$workstatus"/>
	</xsl:if>
	<xsl:variable name="url" select="./xcv:online/xcv:site/xcv:url"/>
	<xsl:if test="$url/text()">
	  <xsl:text>, </xsl:text>
	  <xsl:value-of select="$url"/>
	</xsl:if>
	<xsl:text>\\&#xA;</xsl:text>
      </xsl:for-each>
      <xsl:text>\end{tabular}&#xA;&#xA;</xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- SKILLS (expertise) AND SKILLS (other) -->
  <xsl:template name="skillsTemplate">
    <xsl:param name="sectionTitle"/>
    <xsl:param name="items"/>

    <xsl:if test="$items">
      <xsl:text>\section*{</xsl:text><xsl:value-of select="$sectionTitle"/><xsl:text>}&#xA;</xsl:text>
      <xsl:text>\begin{tabular}{L!{\VRule}l}&#xA;</xsl:text>
      <xsl:for-each select="$items">
	<xsl:value-of select="./@name"/><xsl:text>&amp;</xsl:text>
	<xsl:for-each select="./xcv:skill">
	  <xsl:if test="position()>1">
	    <xsl:text>&amp;</xsl:text>
	  </xsl:if>
	  <xsl:variable name="title" select="./xcv:title"/>
	  <xsl:value-of select="$title"/>
	  <xsl:variable name="level" select="./xcv:level"/>
	  <xsl:variable name="details" select="./xcv:details"/>
	  <xsl:if test="$title/text() and ($level/@display = 'show' or $details/text())">
	    <xsl:text>: </xsl:text>
	  </xsl:if>
	  <xsl:if test="./xcv:level/@display = 'show' or not(./xcv:level/@display)">
	    <xsl:value-of select="$level"/>
	    <xsl:if test="$details/text()">
	      <xsl:text>, </xsl:text>
	    </xsl:if>
	  </xsl:if>
	  <xsl:value-of select="$details"/>
	  <xsl:text>\\&#xA;</xsl:text>
	</xsl:for-each>
	<xsl:text>&amp;\\&#xA;</xsl:text>
      </xsl:for-each>
      <xsl:text>\end{tabular}&#xA;&#xA;</xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- EDUCATION (university) AND EDUCATION (certificates) -->
  <xsl:template name="educationTemplate">
    <xsl:param name="sectionTitle"/>
    <xsl:param name="items"/>

    <xsl:if test="$items">
      <xsl:text>\section*{</xsl:text><xsl:value-of select="$sectionTitle"/><xsl:text>}&#xA;</xsl:text>
      <xsl:text>\begin{tabular}{L!{\VRule}R}&#xA;</xsl:text>
      <xsl:for-each select="$items">
	<xsl:value-of select="./xcv:begin/xcv:year"/>
	<xsl:variable name="end" select="./xcv:end/xcv:year"/>
	<xsl:if test="$end/text()">
	  <xsl:text> -- </xsl:text>
	</xsl:if>
	<xsl:value-of select="$end"/><xsl:text>&amp;</xsl:text>
	<xsl:value-of select="./xcv:title"/>
	<xsl:variable name="status" select="./xcv:status"/>
	<xsl:if test="$status/text()">
	  <xsl:text> (</xsl:text><xsl:value-of select="$status"/><xsl:text>)</xsl:text>
	</xsl:if>
	<xsl:variable name="institute" select="./xcv:institute"/>
	<xsl:if test="$institute/text()">
	  <xsl:text>, </xsl:text>
	  <xsl:value-of select="$institute"/>
	</xsl:if>
	<xsl:variable name="city" select="./xcv:location/xcv:city"/>
	<xsl:if test="$city/text()">
	  <xsl:text>, </xsl:text>
	  <xsl:value-of select="$city"/>
	</xsl:if>
	<xsl:variable name="country" select="./xcv:location/xcv:country"/>
	<xsl:if test="$country/text()">
	  <xsl:text> - </xsl:text>
	  <xsl:value-of select="$country"/>
	</xsl:if>
	<xsl:text>\\&#xA;</xsl:text>
      </xsl:for-each>
      <xsl:text>\end{tabular}&#xA;&#xA;</xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- LANGUAGES -->
  <xsl:template name="languagesTemplate">
    <xsl:param name="sectionTitle"/>
    <xsl:param name="items"/>

    <xsl:if test="$items">
      <xsl:text>\section*{</xsl:text><xsl:value-of select="$sectionTitle"/><xsl:text>}&#xA;</xsl:text>
      <xsl:text>\begin{tabular}{L!{\VRule}R}&#xA;</xsl:text>
      <xsl:for-each select="$items">
	<xsl:value-of select="./xcv:title"/><xsl:text>&amp;</xsl:text>
	<xsl:if test="./xcv:level/@display = 'show' or not(./xcv:level/@display)">
	  <xsl:value-of select="./xcv:level"/>
	  <xsl:if test="./xcv:details/text()">
	    <xsl:text>, </xsl:text>
	  </xsl:if>
	</xsl:if>
	<xsl:value-of select="./xcv:details"/>
	<xsl:text>\\&#xA;</xsl:text>
      </xsl:for-each>
      <xsl:text>\end{tabular}&#xA;&#xA;</xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- HONORS -->
  <xsl:template name="honorsTemplate">
    <xsl:param name="sectionTitle"/>
    <xsl:param name="items"/>

    <xsl:if test="$items">
      <xsl:text>\section*{</xsl:text><xsl:value-of select="$sectionTitle"/><xsl:text>}&#xA;</xsl:text>
      <xsl:text>\begin{tabular}{L!{\VRule}R}&#xA;</xsl:text>
      <xsl:for-each select="$items">
	<xsl:value-of select="./xcv:year"/><xsl:text>&amp;</xsl:text>
	<xsl:value-of select="./xcv:title"/>
	<xsl:if test="./xcv:institute/text()">
	  <xsl:text>, </xsl:text>
	  <xsl:value-of select="./xcv:institute"/>
	</xsl:if>
	<xsl:if test="./xcv:details/text()">
	  <xsl:text>, </xsl:text>
	  <xsl:value-of select="./xcv:details"/>
	</xsl:if>
	<xsl:text>\\&#xA;</xsl:text>
      </xsl:for-each>
      <xsl:text>\end{tabular}&#xA;&#xA;</xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- INTEREST -->
  <xsl:template name="interestTemplate">
    <xsl:param name="sectionTitle"/>
    <xsl:param name="items"/>

    <xsl:if test="$items">
      <xsl:text>\section*{</xsl:text><xsl:value-of select="$sectionTitle"/><xsl:text>}&#xA;</xsl:text>
      <xsl:text>\begin{tabular}{L!{\VRule}R}&#xA;</xsl:text>
      <xsl:for-each select="$items">
	<xsl:value-of select="./xcv:title"/><xsl:text>&amp;</xsl:text>
	<xsl:value-of select="./xcv:details"/>
	<xsl:text>\\&#xA;</xsl:text>
      </xsl:for-each>
      <xsl:text>\end{tabular}&#xA;&#xA;</xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- PUBLICATIONS -->
  <xsl:template name="publicationsTemplate">
    <xsl:param name="sectionTitle"/>
    <xsl:param name="items"/>

    <xsl:if test="$items">
      <xsl:text>\section*{</xsl:text><xsl:value-of select="$sectionTitle"/><xsl:text>}&#xA;</xsl:text>
      <xsl:text>\begin{tabular}{L!{\VRule}R}&#xA;</xsl:text>
      <xsl:for-each select="$items">
	<xsl:value-of select="./xcv:year"/><xsl:text>&amp;</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="./xcv:title"/><xsl:text>"</xsl:text>
	<xsl:if test="./xcv:title/text() and ./xcv:editor/text()">
	  <xsl:text>, </xsl:text>
	</xsl:if>
	<xsl:value-of select="./xcv:editor"/>
	<xsl:if test="./xcv:year/text()">
	  <xsl:text> - </xsl:text>
	  <xsl:value-of select="./xcv:year"/>
	</xsl:if>
	<xsl:text>\\&#xA;</xsl:text>
      </xsl:for-each>
      <xsl:text>\end{tabular}&#xA;&#xA;</xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- CONFERENCES -->
  <xsl:template name="conferencesTemplate">
    <xsl:param name="sectionTitle"/>
    <xsl:param name="items"/>

    <xsl:if test="$items">
      <xsl:text>\section*{</xsl:text><xsl:value-of select="$sectionTitle"/><xsl:text>}&#xA;</xsl:text>
      <xsl:text>\begin{tabular}{L!{\VRule}R}&#xA;</xsl:text>
      <xsl:for-each select="$items">
	<xsl:value-of select="./xcv:year"/><xsl:text>&amp;</xsl:text>
	<xsl:value-of select="./xcv:theme"/>
	<xsl:if test="./xcv:theme/text() and ./xcv:title/text()">
	  <xsl:text>, </xsl:text>
	</xsl:if>
	<xsl:text>"</xsl:text><xsl:value-of select="./xcv:title"/><xsl:text>"</xsl:text>
	<xsl:if test="./xcv:institute/text()">
	  <xsl:text>, </xsl:text>
	</xsl:if>
	<xsl:value-of select="./xcv:institute"/>
	<xsl:if test="./xcv:location/city/text()">
	  <xsl:text>, </xsl:text>
	</xsl:if>
	<xsl:value-of select="./xcv:location/city"/>
	<xsl:if test="./xcv:location/country/text()">
	  <xsl:text> - </xsl:text>
	</xsl:if>
	<xsl:value-of select="./xcv:location/country"/>
	<xsl:if test="./xcv:details/text()">
	  <xsl:text>, </xsl:text>
	</xsl:if>
	<xsl:value-of select="./xcv:details"/>
	<xsl:text>\\&#xA;</xsl:text>
      </xsl:for-each>
      <xsl:text>&#xA;\end{tabular}&#xA;&#xA;</xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- A function to put first letter uppercase (XSLT 1.0 lacks upper-case funciton) -->
  <xsl:template name="uc_first">
    <xsl:param name="str"/>

    <xsl:variable name="lower" select="'abcdefghijklmnopqrstuvwxyzàèìòùỳéâêîôûŷäëïöüÿ'"/>
    <xsl:variable name="upper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZÀÈÌÒÙỲÉÂÊÎÔÛŶÄËÏÖÜŸ'"/>

    <xsl:value-of select="concat(translate(substring($str, 1, 1), $lower, $upper), substring($str, 2))"/>
  </xsl:template>

  <!-- A function to fetch the translated titles of sections -->
  <xsl:template name="getTitle">
    <xsl:param name="translate"/>
    <xsl:param name="sectionName"/>
    <xsl:param name="defaultTitle"/>

    <xsl:variable name="fetchedTitle" select="$translate/xtr:translation[./xtr:sourceWord/text() = $sectionName]/xtr:translatedWord"/>
    <xsl:choose>
      <xsl:when test="$fetchedTitle">
	<!--xsl:value-of select="$fetchedTitle"/-->
	<xsl:call-template name="uc_first">
	  <xsl:with-param name="str" select="$fetchedTitle"/>
	</xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
	<!--xsl:value-of select="$defaultTitle"/-->
	<xsl:call-template name="uc_first">
	  <xsl:with-param name="str" select="$defaultTitle"/>
	</xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- ****************** Main template ****************** -->

  <xsl:template match="xcv:cv">

    <!-- Begin: Get the translate titles from file-->
    <xsl:variable name="translate" select="document(concat('xcv_translate_',./xcv:cvlang/text(),'.xml'), document(''))/*"/>

    <xsl:variable name="titleObjective">
      <xsl:call-template name="getTitle">
	<xsl:with-param name="translate" select="$translate"/>
	<xsl:with-param name="sectionName" select="'objective'"/>
	<xsl:with-param name="defaultTitle" select="'objective'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="titleEducation">
      <xsl:call-template name="getTitle">
	<xsl:with-param name="translate" select="$translate"/>
	<xsl:with-param name="sectionName" select="'education'"/>
	<xsl:with-param name="defaultTitle" select="'education'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="titleCertificates">
      <xsl:call-template name="getTitle">
	<xsl:with-param name="translate" select="$translate"/>
	<xsl:with-param name="sectionName" select="'certificates'"/>
	<xsl:with-param name="defaultTitle" select="'certificates'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="titleExperience">
      <xsl:call-template name="getTitle">
	<xsl:with-param name="translate" select="$translate"/>
	<xsl:with-param name="sectionName" select="'experience'"/>
	<xsl:with-param name="defaultTitle" select="'experience'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="titleJobs">
      <xsl:call-template name="getTitle">
	<xsl:with-param name="translate" select="$translate"/>
	<xsl:with-param name="sectionName" select="'jobs'"/>
	<xsl:with-param name="defaultTitle" select="'jobs'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="titleRealizations">
      <xsl:call-template name="getTitle">
	<xsl:with-param name="translate" select="$translate"/>
	<xsl:with-param name="sectionName" select="'realizations'"/>
	<xsl:with-param name="defaultTitle" select="'realizations'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="titleProjects">
      <xsl:call-template name="getTitle">
	<xsl:with-param name="translate" select="$translate"/>
	<xsl:with-param name="sectionName" select="'projects'"/>
	<xsl:with-param name="defaultTitle" select="'projects'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="titleSkills">
      <xsl:call-template name="getTitle">
	<xsl:with-param name="translate" select="$translate"/>
	<xsl:with-param name="sectionName" select="'skills'"/>
	<xsl:with-param name="defaultTitle" select="'expert skills'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="titleOtherSkills">
      <xsl:call-template name="getTitle">
	<xsl:with-param name="translate" select="$translate"/>
	<xsl:with-param name="sectionName" select="'other skills'"/>
	<xsl:with-param name="defaultTitle" select="'other skills'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="titleLanguages">
      <xsl:call-template name="getTitle">
	<xsl:with-param name="translate" select="$translate"/>
	<xsl:with-param name="sectionName" select="'languages'"/>
	<xsl:with-param name="defaultTitle" select="'languages'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="titleInterest">
      <xsl:call-template name="getTitle">
	<xsl:with-param name="translate" select="$translate"/>
	<xsl:with-param name="sectionName" select="'interest'"/>
	<xsl:with-param name="defaultTitle" select="'interest'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="titlePublications">
      <xsl:call-template name="getTitle">
	<xsl:with-param name="translate" select="$translate"/>
	<xsl:with-param name="sectionName" select="'publications'"/>
	<xsl:with-param name="defaultTitle" select="'publications'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="titleConferences">
      <xsl:call-template name="getTitle">
	<xsl:with-param name="translate" select="$translate"/>
	<xsl:with-param name="sectionName" select="'conferences'"/>
	<xsl:with-param name="defaultTitle" select="'conferences'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="titleHonors">
      <xsl:call-template name="getTitle">
	<xsl:with-param name="translate" select="$translate"/>
	<xsl:with-param name="sectionName" select="'honors'"/>
	<xsl:with-param name="defaultTitle" select="'honors'"/>
      </xsl:call-template>
    </xsl:variable>
    <!-- End: Get the translate titles from file-->

    <xsl:text>
\documentclass[10pt]{article}
\usepackage[utf8]{inputenc}
\usepackage[french]{babel}
%\usepackage[T1]{fontenc}
\usepackage{graphicx}

\usepackage{array, xcolor}
\usepackage[margin=3cm]{geometry}&#xA;&#xA;
    </xsl:text>

    <!-- OWNER'S NAME AND QUALIFICATION -->
    <!-- these will be added by the \maketitle command -->
    <xsl:variable name="firstname" select="xcv:identity/xcv:definitive/xcv:name/xcv:firstname"/>
    <xsl:if test="$firstname/text()">
      <xsl:text>\title{\bfseries\Huge </xsl:text>
      <xsl:value-of select="$firstname"/>

      <xsl:variable name="lastname" select="xcv:identity/xcv:definitive/xcv:name/xcv:lastname"/>
      <xsl:if test="$lastname/text()">
	<xsl:text> </xsl:text>
	<xsl:value-of select="$lastname"/>
      </xsl:if>
      <xsl:text>}</xsl:text>

      <xsl:variable name="qualification" select="xcv:identity/xcv:evolving/xcv:qualification"/>
      <xsl:if test="$qualification/text()">
	<xsl:text>\author{</xsl:text>
	<xsl:value-of select="$qualification"/>
	<xsl:text>}&#xA;&#xA;</xsl:text>
      </xsl:if>
    </xsl:if>

    <xsl:text>
\date{} %delete the date

\definecolor{lightgray}{gray}{0.8}
\newcolumntype{L}{>{\raggedleft}p{0.14\textwidth}}
\newcolumntype{R}{p{0.8\textwidth}}
\newcommand\VRule{\color{lightgray}\vrule width 0.5pt}

\begin{document}
\maketitle
\vspace{1em}
    </xsl:text>

    <!-- Begin of Latex adjacence constraint -->
    <!-- The following 3 sections need to be adjacent (Latex constraint) -->
    <xsl:variable name="miniPageWidth">
      <xsl:choose>
	<xsl:when test="./xcv:picture">
	  <xsl:value-of select="0.33"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select="0.49"/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <!-- OWNER'S ADDRESS -->
    <xsl:text>\begin{minipage}[ht]{</xsl:text><xsl:value-of select="$miniPageWidth"/><xsl:text>\textwidth}&#xA;</xsl:text>
    <xsl:variable name="appmisc" select="xcv:identity/xcv:evolving/xcv:address/xcv:appartment/xcv:appmisc"/>
    <xsl:value-of select="$appmisc/text()"/>
    <xsl:variable name="bat" select="xcv:identity/xcv:evolving/xcv:address/xcv:appartment/xcv:building"/>
    <xsl:if test="$bat/text()">
      <xsl:text>, bat. </xsl:text><xsl:value-of select="$bat"/>
    </xsl:if>
    <xsl:variable name="app" select="xcv:identity/xcv:evolving/xcv:address/xcv:appartment/xcv:appnum"/>
    <xsl:if test="$app/text()">
      <xsl:text>, app. </xsl:text><xsl:value-of select="$app"/>
    </xsl:if>
    <xsl:if test="$appmisc/text() or $bat/text() or $app/text()">
      <xsl:text>\\&#xA;</xsl:text>
    </xsl:if>
    <xsl:variable name="rdnum" select="xcv:identity/xcv:evolving/xcv:address/xcv:road/xcv:rdnum"/>
    <xsl:value-of select="$rdnum"/>
    <xsl:variable name="rdext" select="xcv:identity/xcv:evolving/xcv:address/xcv:road/xcv:rdext"/>
    <xsl:text> </xsl:text><xsl:value-of select="$rdext"/>
    <xsl:variable name="rdtype" select="xcv:identity/xcv:evolving/xcv:address/xcv:road/xcv:rdtype"/>
    <xsl:text> </xsl:text><xsl:value-of select="$rdtype"/>
    <xsl:variable name="rdname" select="xcv:identity/xcv:evolving/xcv:address/xcv:road/xcv:rdname"/>
    <xsl:text> </xsl:text><xsl:value-of select="$rdname"/>
    <xsl:if test="$rdnum/text() or $rdext/text() or $rdtype/text() or $rdname/text()">
      <xsl:text>\\&#xA;</xsl:text>
    </xsl:if>
    <xsl:variable name="zipcode" select="xcv:identity/xcv:evolving/xcv:address/xcv:zipcode"/>
    <xsl:value-of select="$zipcode"/>
    <xsl:variable name="city" select="xcv:identity/xcv:evolving/xcv:address/xcv:city"/>
    <xsl:text> </xsl:text><xsl:value-of select="$city"/>
    <xsl:variable name="country" select="xcv:identity/xcv:evolving/xcv:address/xcv:country"/>
    <xsl:if test="($zipcode/text() or $city/text()) and $country/text()">
      <xsl:text>, </xsl:text>
    </xsl:if>
    <xsl:value-of select="$country"/>
    <xsl:text>&#xA;\end{minipage}&#xA;</xsl:text>

    <!-- OWNER'S PICTURE -->
    <xsl:variable name="picture" select="./xcv:picture"/>
    <xsl:text>\begin{minipage}[ht]{</xsl:text><xsl:value-of select="$miniPageWidth"/><xsl:text>\textwidth}&#xA;</xsl:text>
    <xsl:if test="$picture/text()">
      <xsl:text>\begin{center}
      \includegraphics[width=</xsl:text><xsl:value-of select="$miniPageWidth"/><xsl:text>\textwidth,keepaspectratio]{</xsl:text>
      <xsl:value-of select="$picture"/>
      <xsl:text>}
      \end{center}</xsl:text>
    </xsl:if>
    <xsl:text>&#xA;\end{minipage}&#xA;</xsl:text>

    <!-- OWNER'S CONTACTS -->
    <xsl:text>\begin{minipage}[ht]{</xsl:text><xsl:value-of select="$miniPageWidth"/><xsl:text>\textwidth}&#xA;</xsl:text>
    <xsl:text>\begin{flushright}&#xA;</xsl:text>
    <xsl:variable name="nationality" select="xcv:identity/xcv:definitive/xcv:nationality"/>
    <xsl:if test="$nationality/text()">
      <xsl:text>Nationalité </xsl:text><xsl:value-of select="$nationality"/>
      <xsl:text>\\&#xA;</xsl:text>
    </xsl:if>
    <xsl:variable name="phonecode" select="xcv:identity/xcv:evolving/xcv:phone/xcv:phonecode"/>
    <xsl:if test="$phonecode/text()">
      <xsl:text>+</xsl:text><xsl:value-of select="$phonecode"/><xsl:text> </xsl:text>
    </xsl:if>
    <xsl:variable name="phonenum" select="xcv:identity/xcv:evolving/xcv:phone/xcv:phonenum"/>
    <xsl:value-of select="$phonenum"/>
    <xsl:if test="$phonenum/text()">
      <xsl:text>\\&#xA;</xsl:text>
    </xsl:if>
    <xsl:value-of select="xcv:identity/xcv:evolving/xcv:email"/>
    <xsl:text>\end{flushright}&#xA;</xsl:text>
    <xsl:text>&#xA;\end{minipage}&#xA;\vspace{20pt}&#xA;&#xA;</xsl:text>

    <!-- End of Latex adjacence constraint -->

    <!-- CV OBJECTIVE -->
    <xsl:variable name="objective" select="./xcv:objective"/>
    <xsl:if test="$objective/text()">
      <xsl:text>\section*{</xsl:text><xsl:value-of select="$titleObjective"/><xsl:text>}&#xA;</xsl:text>
      <xsl:value-of select="$objective"/><xsl:text>&#xA;&#xA;</xsl:text>
    </xsl:if>

    <!-- Ordering sections from a file -->
    <xsl:variable name="this" select="."/>
    <xsl:for-each select="document('xcv_ordering.xml')/xcv:ordering/xcv:position">
      <xsl:choose>

	<!-- EDUCATION (university)-->
	<xsl:when test="./@section = 'education'">
	  <xsl:call-template name="educationTemplate">
	    <xsl:with-param name="sectionTitle">
	      <xsl:value-of select="$titleEducation"/>
	    </xsl:with-param>
	    <xsl:with-param name="items" select="$this/xcv:education/xcv:degrees/xcv:degree"/>
	  </xsl:call-template>
	</xsl:when>

	<!-- EDUCATION (certificates)-->
	<xsl:when test="./@section = 'certificates'">
	  <xsl:call-template name="educationTemplate">
	    <xsl:with-param name="sectionTitle">
	      <xsl:value-of select="$titleCertificates"/>
	    </xsl:with-param>
	    <xsl:with-param name="items" select="$this/xcv:education/xcv:certificates/xcv:certificate"/>
	  </xsl:call-template>
	</xsl:when>

	<!-- EXPERIENCE -->
	<xsl:when test="./@section = 'experience'">
	  <xsl:call-template name="jobsTemplate">
	    <xsl:with-param name="sectionTitle">
	      <xsl:value-of select="$titleExperience"/>
	    </xsl:with-param>
	    <xsl:with-param name="items" select="$this/xcv:experience/xcv:position"/>
	  </xsl:call-template>
	</xsl:when>

	<!-- JOBS -->
	<xsl:when test="./@section = 'jobs'">
	  <xsl:call-template name="jobsTemplate">
	    <xsl:with-param name="sectionTitle">
	      <xsl:value-of select="$titleJobs"/>
	    </xsl:with-param>
	    <xsl:with-param name="items" select="$this/xcv:jobs/xcv:position"/>
	  </xsl:call-template>
	</xsl:when>

	<!-- WORKS (realizations) -->
	<xsl:when test="./@section = 'realizations'">
	  <xsl:call-template name="worksTemplate">
	    <xsl:with-param name="sectionTitle">
	      <xsl:value-of select="$titleRealizations"/>
	    </xsl:with-param>
	    <xsl:with-param name="items" select="$this/xcv:works/xcv:realizations/xcv:realization"/>
	  </xsl:call-template>
	</xsl:when>

	<!-- WORKS (projects) -->
	<xsl:when test="./@section = 'projects'">
	  <xsl:call-template name="worksTemplate">
	    <xsl:with-param name="sectionTitle">
	      <xsl:value-of select="$titleProjects"/>
	    </xsl:with-param>
	    <xsl:with-param name="items" select="$this/xcv:works/xcv:projects/xcv:project"/>
	  </xsl:call-template>
	</xsl:when>

	<!-- SKILLS (expertise) -->
	<xsl:when test="./@section = 'expert skills'">
	  <xsl:call-template name="skillsTemplate">
	    <xsl:with-param name="sectionTitle">
	      <xsl:value-of select="$titleSkills"/>
	    </xsl:with-param>
	    <xsl:with-param name="items" select="$this/xcv:skills/xcv:expertise/xcv:domain"/>
	  </xsl:call-template>
	</xsl:when>

	<!-- SKILLS (other) -->
	<xsl:when test="./@section = 'other skills'">
	  <xsl:call-template name="skillsTemplate">
	    <xsl:with-param name="sectionTitle">
	      <xsl:value-of select="$titleOtherSkills"/>
	    </xsl:with-param>
	    <xsl:with-param name="items" select="$this/xcv:skills/xcv:other/xcv:domain"/>
	  </xsl:call-template>
	</xsl:when>

	<!-- LANGUAGES -->
	<xsl:when test="./@section = 'languages'">
	  <xsl:call-template name="languagesTemplate">
	    <xsl:with-param name="sectionTitle">
	      <xsl:value-of select="$titleLanguages"/>
	    </xsl:with-param>
	    <xsl:with-param name="items" select="$this/xcv:languages/xcv:lang"/>
	  </xsl:call-template>
	</xsl:when>

	<!-- INTEREST -->
	<xsl:when test="./@section = 'interests'">
	  <xsl:call-template name="interestTemplate">
	    <xsl:with-param name="sectionTitle">
	      <xsl:value-of select="$titleInterest"/>
	    </xsl:with-param>
	    <xsl:with-param name="items" select="$this/xcv:interest/xcv:item"/>
	  </xsl:call-template>
	</xsl:when>

	<!-- PUBLICATIONS -->
	<xsl:when test="./@section = 'publications'">
	  <xsl:call-template name="publicationsTemplate">
	    <xsl:with-param name="sectionTitle">
	      <xsl:value-of select="$titlePublications"/>
	    </xsl:with-param>
	    <xsl:with-param name="items" select="$this/xcv:publications/xcv:publication"/>
	  </xsl:call-template>
	</xsl:when>

	<!-- CONFERENCES -->
	<xsl:when test="./@section = 'conferences'">
	  <xsl:call-template name="conferencesTemplate">
	    <xsl:with-param name="sectionTitle">
	      <xsl:value-of select="$titleConferences"/>
	    </xsl:with-param>
	    <xsl:with-param name="items" select="$this/xcv:conferences/xcv:conference"/>
	  </xsl:call-template>
	</xsl:when>

	<!-- HONORS -->
	<xsl:when test="./@section = 'honors'">
	  <xsl:call-template name="honorsTemplate">
	    <xsl:with-param name="sectionTitle">
	      <xsl:value-of select="$titleHonors"/>
	    </xsl:with-param>
	    <xsl:with-param name="items" select="$this/xcv:honors/xcv:distinction"/>
	  </xsl:call-template>
	</xsl:when>

      </xsl:choose>
    </xsl:for-each>

    <xsl:text>
{\vspace{20pt}%\newline\newline
\vspace{20pt}
\scriptsize\hfill Created by xcv, scripted by Josuah Aron.}

\end{document}
    </xsl:text>
  </xsl:template>

</xsl:stylesheet>