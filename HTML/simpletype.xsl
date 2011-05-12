<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <!-- Simple Types -->
    
    <xsl:template match="bold">
        <b><xsl:apply-templates/></b>
    </xsl:template>
    
    <xsl:template match="italic">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    
    <xsl:template match="strike">
        <strike><xsl:apply-templates/></strike>
    </xsl:template>
    
    <xsl:template match="super">
        <sup class="wrap"><xsl:apply-templates/></sup>
    </xsl:template>
    
    <xsl:template match="sub">
        <sub class="wrap"><xsl:apply-templates/></sub>
    </xsl:template>
    
    <xsl:template match="under">
        <u><xsl:apply-templates/></u>
    </xsl:template>
    
    <xsl:template match="term">
        <strong><xsl:value-of select="." xml:space="preserve"/></strong>
    </xsl:template>
    
    <xsl:template match="url">
        <span class="wrap"><a href="{.}"><xsl:value-of select="."/></a></span>
    </xsl:template>
    
    <xsl:template match="img">
        <img src="{@path}" alt="@path"/>
    </xsl:template>
    
    <xsl:template match="year">
        <xsl:text>(</xsl:text><xsl:value-of select="."/><xsl:text>)</xsl:text>
    </xsl:template>
    
    <xsl:template match="char">
        <span class="upper">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    
    <xsl:template match="caption">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="webpage">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="comment">
        <small><i><font face="Comic Sans"><xsl:text> # </xsl:text><xsl:value-of select="."/></font></i></small>
    </xsl:template>
    
    <xsl:template match="obs">
        <br/><center><p><small><font face="Helvetica"><xsl:apply-templates/></font></small></p></center>
    </xsl:template>
    
    <xsl:template match="code">
        <p><code class="space"><xsl:apply-templates/></code></p>
    </xsl:template>
    
    <xsl:template match="exp">
        <em><q><small><font face="Helvetica"><xsl:value-of select="."/></font></small></q></em>
    </xsl:template>
    
    <xsl:template match="citation">
        <cite><xsl:value-of select="."/></cite>
    </xsl:template>
    
    <xsl:template match="equation">
        <br/><center><p><small><font face="Gill Sans"><xsl:value-of select="."/></font></small></p></center>
    </xsl:template>
    
    <xsl:template match="local">
        <em><font size="4pt"><xsl:value-of select="."/></font></em>
    </xsl:template>

</xsl:stylesheet>
