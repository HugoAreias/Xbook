<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <xsl:import href="tableofcontents.xsl"/>
    
    <!-- Metainfo -->
    
    <xsl:template match="metainfo">
        <xsl:result-document href="{title}.html">
            <html>
                <head>
                    <link xmlns="http://www.w3.org/1999/xhtml" type="text/css" href="styles.css"/>
                    <title><xsl:value-of select="title"/></title>
                </head>
                <body class="margin">
                    <hr/>
                    <center>
                        <xsl:apply-templates select="authors/preceding-sibling::*"/>
                        <table><tbody><xsl:apply-templates select="authors"/></tbody></table>
                    </center>
                    <br/>
                    <div class="group">
                        <xsl:apply-templates select="authors/following-sibling::*"/>
                    </div>
                    <br/>
                    <hr/>
                    <table align="center" cellpadding="5em" cellspacing="10em">
                        <tbody>
                            <tr>
                                <td align="left" valign="top"><xsl:call-template name="toc"/></td>
                                <xsl:if test="//xbook/@tof">
                                    <td align="left" valign="top"><xsl:call-template name="tof"/></td>
                                </xsl:if>
                                <xsl:if test="//xbook/@tot">
                                    <td align="left" valign="top"><xsl:call-template name="tot"/></td>
                                </xsl:if>
                            </tr>
                        </tbody>
                    </table>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="metainfo/title">
        <br/><font face="Helvetica" size="16pt"><xsl:apply-templates/></font><br/>
    </xsl:template>
    
    <xsl:template match="metainfo/subtitle">
        <br/><font face="Helvetica" size="14pt"><xsl:apply-templates/></font><br/>
    </xsl:template>
    
    <xsl:template match="metainfo/frontcover">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="metainfo/local">
        <div class="left"><xsl:value-of select="."/></div>
    </xsl:template>
    
    <xsl:template match="metainfo/publisher">
        <div class="right"><xsl:text>©</xsl:text><xsl:value-of select="."/></div>
    </xsl:template>
    
    <xsl:template match="metainfo/date">
        <div class="right"><xsl:value-of select="."/></div>
    </xsl:template>
    
    <xsl:template match="metainfo//author">
        <br/><td class="padding" valign="top">
            <xsl:choose>
                <xsl:when test="photo">
                    <p><img src="{photo/img/@path}" alt="{name}" height="100" width="75"/></p>
                </xsl:when>
                <xsl:otherwise>
                    <p><img src="noimagemsmall.jpg" alt="noimage" height="100" width="75"/></p>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="name"/>
            <xsl:if test="id">
                <xsl:text>, </xsl:text>
                <xsl:value-of select="id"/>
            </xsl:if>
            <xsl:if test="email">
                <br/><a href="mailto:{email}"><xsl:value-of select="email"/></a>
            </xsl:if>
            <xsl:if test="webpage">
                <br/><xsl:apply-templates select="webpage"/>
            </xsl:if>
            <xsl:if test="degree">
                <br/><xsl:value-of select="degree"/>
            </xsl:if>
            <xsl:if test="rank">
                <br/><xsl:value-of select="rank"/>
            </xsl:if>
            <xsl:if test="affiliation">
                <br/><xsl:value-of select="affiliation"/><br/>
            </xsl:if>
        </td>
    </xsl:template>
    
</xsl:stylesheet>
