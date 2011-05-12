<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <!-- Chapter & Summary-->
    
    <xsl:template match="chapter">
        <xsl:result-document href="{title}.html">
            <html>
                <head>
                    <link xmlns="http://www.w3.org/1999/xhtml" type="text/css" href="styles.css"/>
                    <title><xsl:value-of select="title"/></title>
                </head>
                <body class="margin">
                    <hr/>
                    <table border="0" width="100%">
                        <tr>
                            <xsl:choose>
                                <xsl:when test="preceding-sibling::chapter">
                                    <xsl:variable name="pre" select="preceding-sibling::chapter/title"/>
                                    <td align="left" class="linkleft"><a href="{$pre}.html"><xsl:value-of select="$pre"/></a></td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:variable name="pre" select="ancestor::*/body/preceding-sibling::*[1]/title"/>
                                    <td align="left" class="linkleft"><a href="{$pre}.html"><xsl:value-of select="$pre"/></a></td>
                                </xsl:otherwise>
                            </xsl:choose>
                            
                            <td align="center" class="linkcenter"><a href="{//metainfo/title}.html"><xsl:value-of select="//metainfo/title"/></a></td>
                            
                            <xsl:choose>
                                <xsl:when test="following-sibling::chapter">
                                    <xsl:variable name="fol" select="following-sibling::chapter/title"/>
                                    <td align="right" class="linkright"><a href="{$fol}.html"><xsl:value-of select="$fol"/></a></td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:variable name="fol" select="ancestor::*/body/following-sibling::*[1]/title"/>
                                    <td align="right" class="linkright"><a href="{$fol}.html"><xsl:value-of select="$fol"/></a></td>
                                </xsl:otherwise>
                            </xsl:choose>
                        </tr>
                    </table>
                    <hr/>
                    <a name="{@label}"/> <!-- Never used -->
                    <p class="chp">
                        <xsl:number count="chapter" level="single" format="I"/>
                        <xsl:text>. </xsl:text>
                        <xsl:value-of select="title"/>
                    </p>
                    <xsl:apply-templates select="title/following-sibling::*"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="summary">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Section & Subsection -->
    
    <xsl:template match="section">
        <a name="{@label}"/>
        <p class="sec">
            <xsl:number count="section|subsection" level="multiple"/>
            <xsl:text>. </xsl:text>
            <xsl:value-of select="title"/>
        </p>
        <xsl:apply-templates select="title/following-sibling::*"></xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="subsection">
        <a name="{@label}"/>
        <p class="sub">
            <xsl:number count="section|subsection" level="multiple"/>
            <xsl:text>. </xsl:text>
            <xsl:value-of select="title"/>
        </p>
        <xsl:apply-templates select="title/following-sibling::*"/>
    </xsl:template>

</xsl:stylesheet>
