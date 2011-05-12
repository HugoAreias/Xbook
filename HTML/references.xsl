<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <xsl:template match="secref">
        <xsl:variable name="sec" select="."/>
        <xsl:for-each select="//section | //subsection">
                <xsl:if test="@label = $sec">
                    <a href="{ancestor::*[last()-2]/title}.html#{$sec}"><xsl:value-of select="$sec"/></a>
                </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="chpref">
        <xsl:variable name="chp" select="."/>
        <xsl:for-each select="//chapter">
                <xsl:if test="@label = $chp">
                    <a href="{title}.html"><xsl:value-of select="$chp"/></a>
                </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="exref">
        <xsl:variable name="ref" select="."/>
        <xsl:for-each select="//example">
            <xsl:choose>
                <xsl:when test="@ref = $ref">
                    <xsl:choose>
                        <xsl:when test="ancestor::*/chapter">
                            <a href="{ancestor::*[last()-2]/title}.html#{$ref}"><xsl:value-of select="$ref"/></a>
                        </xsl:when>
                        <xsl:otherwise>
                            <a href="{ancestor::*[last()-1]/title}.html#{$ref}"><xsl:value-of select="$ref"/></a>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="figref">
        <xsl:variable name="fig" select="."/>
        <xsl:for-each select="//fig">
            <xsl:choose>
                <xsl:when test="@label = $fig">
                    <xsl:choose>
                        <xsl:when test="ancestor::*/chapter">
                            <a href="{ancestor::*[last()-2]/title}.html#{$fig}"><xsl:value-of select="$fig"/></a>
                        </xsl:when>
                        <xsl:otherwise>
                            <a href="{ancestor::*[last()-1]/title}.html#{$fig}"><xsl:value-of select="$fig"/></a>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="tabref">
        <xsl:variable name="tab" select="."/>
        <xsl:for-each select="//table">
            <xsl:choose>
                <xsl:when test="@label = $tab">
                    <xsl:choose>
                        <xsl:when test="ancestor::*/chapter">
                            <a href="{ancestor::*[last()-2]/title}.html#{$tab}"><xsl:value-of select="$tab"/></a>
                        </xsl:when>
                        <xsl:otherwise>
                            <a href="{ancestor::*[last()-1]/title}.html#{$tab}"><xsl:value-of select="$tab"/></a>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>