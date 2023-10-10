<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
    xmlns:rng="http://relaxng.org/ns/structure/1.0" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:teix="http://www.tei-c.org/ns/Examples" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    exclude-result-prefixes="a rng tei teix xsl" version="2.0">
    <!-- Disable indentation and preserve white space within elements -->
    <xsl:output method="xml" indent="no" />
        <!-- Identity template copies all input nodes to output -->
        <xsl:template match="@*|node()">
            <xsl:copy>
                <xsl:apply-templates select="@*|node()" />
            </xsl:copy>
        </xsl:template>
        
    <!-- Exclude rdg elements with @ana that contains "#orthographical" -->
    <xsl:template match="tei:rdg[contains(@ana, '#orthographical')]"/>
    
    <!-- Exclude nested apps in rdg elements -->
    <xsl:template match="tei:app[ancestor::tei:rdg]">
        <xsl:value-of select="tei:lem"/>
    </xsl:template>
    
    <!-- Exclude variant readings from tables -->
    <xsl:template match="tei:app">
        <xsl:choose>
            <xsl:when test="ancestor::tei:table">
                <xsl:value-of select="child::tei:lem"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>