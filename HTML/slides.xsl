<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:template name="slides">
        <xsl:param name="value"/>
        <xsl:choose>
            <xsl:when test="preceding-sibling::*[1][self::index]">
                <xsl:choose>
                    <xsl:when test="$value/preceding-sibling::*[2]/title">
                        <xsl:variable name="pre" select="$value/preceding-sibling::*[2]/title"/>
                        <td align="left" class="linkleft"><a href="{$pre}.html"><xsl:value-of select="$pre"/></a></td>
                    </xsl:when>
                    <xsl:when test="$value/preceding-sibling::*[2][@title]">
                        <xsl:variable name="pre" select="$value/preceding-sibling::*[2]/@title"/>
                        <td align="left" class="linkleft"><a href="{$pre}.html"><xsl:value-of select="$pre"/></a></td>
                    </xsl:when>
                    <xsl:when test="$value/preceding-sibling::*[2]/chapter">
                        <xsl:variable name="pre" select="$value/preceding-sibling::*[2]/chapter[last()]/title"/>
                        <td align="left" class="linkleft"><a href="{$pre}.html"><xsl:value-of select="$pre"/></a></td>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="$value/preceding-sibling::*[1]/title">
                        <xsl:variable name="pre" select="$value/preceding-sibling::*[1]/title"/>
                        <td align="left" class="linkleft"><a href="{$pre}.html"><xsl:value-of select="$pre"/></a></td>
                    </xsl:when>
                    <xsl:when test="$value/preceding-sibling::*[1][@title]">
                        <xsl:variable name="pre" select="$value/preceding-sibling::*[1]/@title"/>
                        <td align="left" class="linkleft"><a href="{$pre}.html"><xsl:value-of select="$pre"/></a></td>
                    </xsl:when>
                    <xsl:when test="$value/preceding-sibling::*[1]/chapter">
                        <xsl:variable name="pre" select="$value/preceding-sibling::*[1]/chapter[last()]/title"/>
                        <td align="left" class="linkleft"><a href="{$pre}.html"><xsl:value-of select="$pre"/></a></td>
                    </xsl:when>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
        
        <td align="center" class="linkcenter"><a href="{//metainfo/title}.html"><xsl:value-of select="//metainfo/title"/></a></td>
        
        <xsl:choose>
            <xsl:when test="following-sibling::*[1][self::index]">
                <xsl:choose>
                    <xsl:when test="$value/following-sibling::*[2]/title">
                        <xsl:variable name="fol" select="$value/following-sibling::*[2]/title"/>
                        <td align="right" class="linkright"><a href="{$fol}.html"><xsl:value-of select="$fol"/></a></td>
                    </xsl:when>
                    <xsl:when test="$value/following-sibling::*[2][@title]">
                        <xsl:variable name="fol" select="$value/following-sibling::*[2]/@title"/>
                        <td align="right" class="linkright"><a href="{$fol}.html"><xsl:value-of select="$fol"/></a></td>
                    </xsl:when>
                    <xsl:when test="$value/following-sibling::*[2]/chapter">
                        <xsl:variable name="fol" select="$value/following-sibling::*[2]/chapter[1]/title"/>
                        <td align="right" class="linkright"><a href="{$fol}.html"><xsl:value-of select="$fol"/></a></td>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="$value/following-sibling::*[1]/title">
                        <xsl:variable name="fol" select="$value/following-sibling::*[1]/title"/>
                        <td align="right" class="linkright"><a href="{$fol}.html"><xsl:value-of select="$fol"/></a></td>
                    </xsl:when>
                    <xsl:when test="$value/following-sibling::*[1][@title]">
                        <xsl:variable name="fol" select="$value/following-sibling::*[1]/@title"/>
                        <td align="right" class="linkright"><a href="{$fol}.html"><xsl:value-of select="$fol"/></a></td>
                    </xsl:when>
                    <xsl:when test="$value/following-sibling::*[1]/chapter">
                        <xsl:variable name="fol" select="$value/following-sibling::*[1]/chapter[1]/title"/>
                        <td align="right" class="linkright"><a href="{$fol}.html"><xsl:value-of select="$fol"/></a></td>
                    </xsl:when>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
