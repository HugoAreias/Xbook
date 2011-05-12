<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:import href="simpletype.xsl"/>
    <xsl:import href="complextype.xsl"/>
    <xsl:import href="metainfo.xsl"/>
    <xsl:import href="references.xsl"/>
    <xsl:import href="chapter.xsl"/>
    <xsl:import href="slides.xsl"/>

    <xsl:output encoding="ISO-8859-1" indent="yes" xml:space="preserve"/>
    
    <xsl:template match="xbook">
        <xsl:apply-templates select="metainfo"/>
        <html>
            <head><link xmlns="http://www.w3.org/1999/xhtml" type="text/css" href="styles.css"/></head>
            <body><xsl:apply-templates select="metainfo/following-sibling::*"/></body>
        </html>
    </xsl:template>
    
    <!-- Preface -->
    
    <xsl:template match="preface">
        <xsl:result-document href="{title}.html">
            <html>
                <head>
                    <link xmlns="http://www.w3.org/1999/xhtml" type="text/css" href="styles.css"/>
                    <title><xsl:value-of select="title"/></title>
                </head>
                <body class="margin">
                    <hr/>
                    <table border="0" width="100%">
                        <tr class="group">
                            <xsl:call-template name="slides">
                                <xsl:with-param name="value" select="."/>
                            </xsl:call-template>
                        </tr>
                    </table>
                    <hr/>
                    <xsl:apply-templates/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Introduction -->
    
    <xsl:template match="intro">
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
                            <xsl:call-template name="slides">
                                <xsl:with-param name="value" select="."/>
                            </xsl:call-template>
                        </tr>
                    </table>
                    <hr/>
                    <xsl:apply-templates/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Body -->
    
    <xsl:template match="body">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Conclusion -->
    
    <xsl:template match="conclusion">
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
                            <xsl:call-template name="slides">
                                <xsl:with-param name="value" select="."/>
                            </xsl:call-template>
                        </tr>
                    </table>
                    <hr/>
                    <xsl:apply-templates/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Recommended Reading -->
    
    <xsl:template match="rec_read">
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
                            <xsl:call-template name="slides">
                                <xsl:with-param name="value" select="."/>
                            </xsl:call-template>
                        </tr>
                    </table>
                    <hr/>
                    <xsl:apply-templates/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Exercises -->
    
    <xsl:template match="exercises">
        <xsl:choose>
            <xsl:when test="parent::xbook">
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
                                    <xsl:call-template name="slides">
                                        <xsl:with-param name="value" select="."/>
                                    </xsl:call-template>
                                </tr>
                            </table>
                            <hr/>
                            <p class="format">
                                <xsl:value-of select="title"/>
                            </p>
                            <xsl:apply-templates select="title/following-sibling::*"/>
                        </body>
                    </html>
                </xsl:result-document>
            </xsl:when>
            <xsl:when test="parent::chapter">
                <p class="format">
                    <xsl:value-of select="title"/>
                </p>
                <xsl:apply-templates select="title/following-sibling::*"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="exercise">
        <p>
            <span class="title">
                <xsl:number count="exercise" level="multiple"/>
            </span>
            <xsl:text>) </xsl:text>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- Appendix -->
    
    <xsl:template match="appendix">
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
                            <xsl:call-template name="slides">
                                <xsl:with-param name="value" select="."/>
                            </xsl:call-template>
                        </tr>
                    </table>
                    <hr/>
                    <xsl:apply-templates/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Glossary -->
    
    <xsl:template match="glossary">
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
                            <xsl:call-template name="slides">
                                <xsl:with-param name="value" select="."/>
                            </xsl:call-template>
                        </tr>
                    </table>
                    <hr/>
                    <dl>
                        <xsl:apply-templates select="title"/>
                        <xsl:for-each select="define">
                            <dd><xsl:apply-templates select="."/></dd><br/>
                        </xsl:for-each>
                    </dl>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Index -->
    
    <xsl:template match="index">
        <!-- Just Ignore it -->
    </xsl:template>
    
    <!-- Bibliography -->
    
    <xsl:template match="bibliography">
        <xsl:result-document href="{@title}.html">
            <html>
                <head>
                    <link xmlns="http://www.w3.org/1999/xhtml" type="text/css" href="styles.css"/>
                    <title><xsl:value-of select="@title"/></title>
                </head>
                <body class="margin">
                    <hr/>
                    <table border="0" width="100%">
                        <tr>
                            <xsl:call-template name="slides">
                                <xsl:with-param name="value" select="."/>
                            </xsl:call-template>
                        </tr>
                    </table>
                    <hr/>
                    <p class="format"><xsl:value-of select="@title"/></p>
                    <xsl:apply-templates select="entry"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="entry">
        <p>
            <xsl:for-each select="name">
                <xsl:value-of select="."/>
                <xsl:text>, </xsl:text>
            </xsl:for-each>
            <em><xsl:value-of select="title"/></em>
            <xsl:text>, </xsl:text>
            <xsl:if test="local">
                <xsl:value-of select="local"/>
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:if test="publisher">
                <xsl:value-of select="publisher"/>
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:value-of select="year"/>
        </p>
    </xsl:template>

</xsl:stylesheet>
