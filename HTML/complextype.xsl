<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <!-- Complex Types -->
    
    <!-- TextBlock -->
    
    <xsl:template match="textblock">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Paragraph -->
    
    <xsl:template match="paragraph">
        <xsl:choose>
            <xsl:when test="ancestor::section/textblock or ancestor::subsection/textblock or ancestor::preface/textblock
                or ancestor::intro/textblock or ancestor::rec_read/textblock or ancestor::appendix/textblock or
                ancestor::conclusion/textblock or ancestor::summary/textblock">
                <span class="just"><xsl:apply-templates/></span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Examples -->
    
    <xsl:template match="example">
        <xsl:if test="@ref">
            <a name="{@ref}"/>
        </xsl:if>
        <xsl:variable name="ex" select="count(preceding::example)"></xsl:variable>
        <br/><br/>
        <p class="title">
            <xsl:value-of select="@label"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="$ex+1"/>
            <xsl:text>: </xsl:text>
            <xsl:apply-templates select="title"/>
        </p>
        <hr/>
            <xsl:apply-templates select="title/following-sibling::*"/>
        <hr/>
    </xsl:template>
    
    <xsl:template match="ex">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="example/title">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Itemize -->
    
    <xsl:template match="itemize">
        <xsl:choose>
            <xsl:when test="parent::item">
                <ul class="disp">
                    <xsl:apply-templates/>
                </ul>
            </xsl:when>
            <xsl:otherwise>
                <ul class="out">
                    <xsl:apply-templates/>
                </ul>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="item">
        <xsl:choose>
            <xsl:when test="itemize or enumeration">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <li><xsl:apply-templates/></li>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Enumeration -->
    
    <xsl:template match="enumeration">
        <ol><xsl:apply-templates/></ol>
    </xsl:template>
    
    <xsl:template match="enum">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    
    <!-- Table -->
    
    <xsl:template match="table">
        <xsl:if test="@label">
            <a name="{@label}"/>
        </xsl:if>
        <a name="{generate-id(.)}"/>
        <br/>
        <p><table cellpadding="5" cellspacing="1" class="table" align="center">
            <thead class="head">
                <tr><xsl:apply-templates select="header"/></tr>
            </thead>
            <tbody class="cell">
                <xsl:apply-templates select="caption/preceding-sibling::hline"/>
            </tbody>
        </table></p>
        <xsl:variable name="tb" select="count(preceding::table)"/>
        <center><p><small>
                <xsl:text>Tab. </xsl:text>
                <xsl:value-of select="$tb+1"/>
                <xsl:text>: </xsl:text>
                <xsl:apply-templates select="caption"/>
        </small></p></center>
    </xsl:template>
    
    <xsl:template match="hline">
        <tr><xsl:apply-templates/></tr>
    </xsl:template>
    
    <xsl:template match="cell">
        <td><xsl:apply-templates/></td>
    </xsl:template>
    
    <!-- Definitions -->
    
    <xsl:template match="define">
        <xsl:if test="parent::textblock and not(ancestor::exercise/textblock)">
            <br/><br/>
        </xsl:if>
        <b><xsl:apply-templates select="term"/></b>
        <xsl:text> - </xsl:text>
        <xsl:apply-templates select="term/following-sibling::*"/>
    </xsl:template>
    
    <!-- Title & Subtitle -->
    
    <xsl:template match="title">
        <p class="format"><xsl:value-of select="."/></p><br/>
    </xsl:template>
    
    <xsl:template match="subtitle">
        <p class="subj"><xsl:apply-templates/></p>
    </xsl:template>
    
    <!-- Notes -->
    
    <xsl:template match="note">
        <br/>
        <p><span class="upper">
            <xsl:value-of select="@label"/>
            <xsl:text>: </xsl:text></span>
            <xsl:apply-templates select="*"/>
        </p>
    </xsl:template>
    
    <!-- Figures -->
    
    <xsl:template match="fig">
        <xsl:if test="@label">
            <a name="{@label}"/>
        </xsl:if>
        <a name="{generate-id(.)}"/>
        <xsl:variable name="fg" select="count(preceding::fig)"/>
        <br/><center><p>
            <xsl:apply-templates select="img"/>
            <small><p>
                <xsl:text>Fig. </xsl:text>
                <xsl:value-of select="$fg+1"/>
                <xsl:text>: </xsl:text>
                <xsl:apply-templates select="caption"/>
            </p></small>
        </p></center>
    </xsl:template>
    
    <!-- Authors -->
    
    <xsl:template match="authors">
        <br/><xsl:apply-templates/><br/>
    </xsl:template>

</xsl:stylesheet>
