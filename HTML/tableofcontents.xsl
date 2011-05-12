<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <!-- Table of Contents -->
    
    <xsl:template name="toc">
        <p class="chp"><xsl:value-of select="//xbook/@ind"/></p>
        <ul><xsl:apply-templates select="//metainfo/following-sibling::*" mode="indice"/></ul>
    </xsl:template>
    
    <xsl:template match="preface|intro|conclusion|rec_read|exercises|appendix|glossary" mode="indice">
        <li class="title"><a href="{title}.html"><xsl:value-of select="title"/></a></li>
    </xsl:template>
    
    <xsl:template match="body" mode="indice">
        <xsl:apply-templates mode="indice"/>
    </xsl:template>
    
    <xsl:template match="chapter" mode="indice">
        <li class="title">
            <a href="{title}.html">
                <xsl:number count="chapter" format="I"/>
                <xsl:text>. </xsl:text>
                <xsl:value-of select="title"/>
            </a>
        </li>
        <ul class="in">
            <xsl:apply-templates select="section" mode="indice"/>
        </ul>
    </xsl:template>
    
    <xsl:template match="section|subsection" mode="indice">
        <li class="title">
            <a href="{ancestor::*[last()-2]/title}.html#{@label}">
                <xsl:number count="section|subsection" level="multiple"/>
                <xsl:text>. </xsl:text>
                <xsl:value-of select="title"/>
            </a>
        </li>
        <ul class="in">
            <xsl:apply-templates select="subsection" mode="indice"/>
        </ul>
    </xsl:template>
    
    <xsl:template match="index" mode="indice">
        <!-- Just Ignore -->
    </xsl:template>
    
    <xsl:template match="bibliography" mode="indice">
        <li class="title"><a href="{@title}.html"><xsl:value-of select="@title"/></a></li>
    </xsl:template>
    
    <!-- Table of Figures -->
    
    <xsl:template name="tof">
        <p class="chp"><xsl:value-of select="//xbook/@tof"/></p>
        <ul>
            <xsl:for-each select="//fig">
                <xsl:variable name="fig" select="count(preceding::fig)"/>
                <li>
                    <xsl:choose>
                        <xsl:when test="ancestor::*/chapter">
                            <a href="{ancestor::*[last()-2]/title}.html#{generate-id(.)}">
                                <xsl:text>Fig. </xsl:text>
                                <xsl:value-of select="$fig+1"/>
                                <xsl:text>: </xsl:text>
                                <xsl:value-of select="caption"/>
                            </a>
                        </xsl:when>
                        <xsl:otherwise>
                            <a href="{ancestor::*[last()-1]/title}.html#{generate-id(.)}">
                                <xsl:text>Fig. </xsl:text>
                                <xsl:value-of select="$fig+1"/>
                                <xsl:text>: </xsl:text>
                                <xsl:value-of select="caption"/>
                            </a>
                        </xsl:otherwise>
                    </xsl:choose>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    <!-- Table of Tables -->
    
    <xsl:template name="tot">
        <p class="chp"><xsl:value-of select="//xbook/@tot"/></p>
        <ul>
            <xsl:for-each select="//table">
                <xsl:variable name="tab" select="count(preceding::table)"/>
                <li>
                    <xsl:choose>
                        <xsl:when test="ancestor::*/chapter">
                            <a href="{ancestor::*[last()-2]/title}.html#{generate-id(.)}">
                                <xsl:text>Tab. </xsl:text>
                                <xsl:value-of select="$tab+1"/>
                                <xsl:text>: </xsl:text>
                                <xsl:value-of select="caption"/>
                            </a>
                        </xsl:when>
                        <xsl:otherwise>
                            <a href="{ancestor::*[last()-1]/title}.html#{generate-id(.)}">
                                <xsl:text>Tab. </xsl:text>
                                <xsl:value-of select="$tab+1"/>
                                <xsl:text>: </xsl:text>
                                <xsl:value-of select="caption"/>
                            </a>
                        </xsl:otherwise>
                    </xsl:choose>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
</xsl:stylesheet>
