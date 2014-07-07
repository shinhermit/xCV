<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd"
    version="2.0"
    xmlns:xcv="urn:dje:josuah:aron:09:05:1983:xcv"
    xmlns:xtr="urn:dje:josuah:aron:09:05:1983:xtranslate"
    >
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jun 26, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> josuah</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    
    <xsl:output method="text" omit-xml-declaration="yes" encoding="UTF-8"/>
    
    <xsl:import-schema namespace="urn:dje:josuah:aron:09:05:1983:xcv" schema-location="./xcv_ordering.xsd"/>
    <xsl:import-schema namespace="urn:dje:josuah:aron:09:05:1983:xcv" schema-location="./xcv.xsd"/>
    
    <xsl:template match="/xcv:cv">
        <xsl:value-of select="."/>
    </xsl:template>
</xsl:stylesheet>