<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
    xmlns:rng="http://relaxng.org/ns/structure/1.0" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:teix="http://www.tei-c.org/ns/Examples" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    exclude-result-prefixes="a rng tei teix xsl" version="2.0">
    <!-- Disable indentation and preserve white space within elements -->
    <xsl:output method="xml" indent="no" />

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

<!-- NOTE: These templates must be processed one at a time, 
        moving from the bottom up. --> 

<!-- Handle app as a descendant, not just a child, of rdg -->
   <!-- <xsl:template match="tei:rdg//tei:app">
        <xsl:apply-templates select="tei:lem/node()"/>
    </xsl:template>-->

    <!-- Do something about handling app in rdg -->
    <!--<xsl:template match="tei:rdg/tei:app">
        <xsl:apply-templates select="tei:lem/node()"/>
    </xsl:template>-->    
    
    <!-- Handle app with lem but no rdg -->
    <!--<xsl:template match="//tei:app[not(tei:rdg)]">
        <xsl:apply-templates select="tei:lem/node()"/>
    </xsl:template>-->
    <!-- Dealing with triple-nested apps in lem -->
    <!--<xsl:template match="//tei:app//tei:app//tei:app/tei:lem/tei:app">
        <xsl:apply-templates select="tei:lem/node()"/>
    </xsl:template>-->
    <!-- Dealing with quadruple-nested app elements -->
    <!--<xsl:template match="//tei:app//tei:app//tei:app/tei:rdg/tei:app">
        <xsl:apply-templates select="tei:lem/node()"/>
    </xsl:template>-->
    <!-- Exclude singletons -->
    <!--<xsl:template match="tei:app[count(tei:rdg) = 1 and count(tokenize(tei:rdg/@wit, '#')) = 2]">
        <xsl:apply-templates select="tei:lem/node()"/>
    </xsl:template>-->
    
    <!-- Exclude app elements that do not have a child lem -->
    <!--<xsl:template match="tei:app[not(tei:lem)]"/>-->
    <!-- Exclude rdg elements with @ana that contains "#orthographical" -->
    <!--<xsl:template match="tei:rdg[contains(@ana, '#orthographical')]"/>-->
    <!-- Exclude witDetail -->
    <!--<xsl:template match="tei:witDetail"/>-->
    
</xsl:stylesheet>