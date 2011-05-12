<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="body">
        <fo:page-sequence master-reference="chapter" initial-page-number="1">
            <fo:static-content flow-name="xsl-region-before">
                <fo:block font="7pt Copperplate Gothic Bold" border-bottom-style="solid" text-align="center">
                    <fo:inline font-weight="bold" border-right-style="solid"><fo:page-number/></fo:inline>
                    <xsl:value-of select="../metainfo/title"/>
                </fo:block>
            </fo:static-content>
            <fo:static-content flow-name="xsl-region-after">
                <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="center">
                    <fo:inline font-weight="bold" border-right-style="solid"><fo:page-number/></fo:inline>
                    <xsl:value-of select="../metainfo/publisher"/>
                </fo:block>
            </fo:static-content>
            <fo:flow flow-name="xsl-region-body">
                <fo:block/>
            </fo:flow>
        </fo:page-sequence>
        <xsl:apply-templates select="chapter"/>
    </xsl:template>

    <!--
        Capítulos
    -->
    <xsl:template match="chapter">
        <fo:page-sequence master-reference="chapter">
            <!-- Definir os cabeçalhos e rodapés dos capítulos -->
            <fo:static-content flow-name="xsl-region-after">
                <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="center">
                    <fo:inline font-weight="bold" border-right-style="solid"><fo:page-number/></fo:inline>
                    <xsl:value-of select="../../metainfo/publisher"/>
                </fo:block>
            </fo:static-content>
            <!-- Imprimir o capítulo e a numeração -->
            <fo:flow flow-name="xsl-region-body"> 
                <xsl:apply-templates select="./title"/>
            </fo:flow>
        </fo:page-sequence>
        <!-- Secções -->
        <fo:page-sequence master-reference="body-sequence" force-page-count="odd">
            <!-- Definir os cabeçalhos e rodapés das secções -->
            <fo:static-content flow-name="body-before-even">
                <fo:block font="7pt Copperplate Gothic Bold" border-bottom-style="solid" text-align="outside">
                    <xsl:value-of select="../../metainfo/title"/>
                </fo:block>
            </fo:static-content>
            <fo:static-content flow-name="body-before-odd">
                <fo:block font="7pt Copperplate Gothic Bold" border-bottom-style="solid" text-align="inside">
                    <xsl:value-of select="../../metainfo/title"/>
                </fo:block>
            </fo:static-content>
            <fo:static-content flow-name="body-after-even">
                <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="inside">
                    <fo:inline font-weight="bold" border-right-style="solid"><fo:page-number/></fo:inline>
                    <xsl:value-of select="../../metainfo/publisher"/>
                </fo:block>
            </fo:static-content>
            <fo:static-content flow-name="body-after-odd">
                <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="outside">
                    <xsl:value-of select="../../metainfo/publisher"/>
                    <fo:inline font-weight="bold" border-left-style="solid"><fo:page-number/></fo:inline>
                </fo:block>
            </fo:static-content>
            <fo:flow flow-name="xsl-region-body">
                <fo:block/>
                <!--Bloco para criar uma quebra de página a seguir à página do capítulo-->
                <fo:block break-after="page"/>
                <xsl:apply-templates select="title/following-sibling::*"/>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>

    <xsl:template match="chapter/title">
        <fo:block id="{../@label}" font="Copperplate Gothic Bold" text-align="center" font-size="20pt" font-weight="600" padding-before="8cm" space-after="1cm" space-before="1cm">
            <xsl:value-of select="."/>
            <fo:inline color="black" font-size="20pt">
                <xsl:text> </xsl:text>
                <xsl:number count="chapter" level="single" format="I"/>
            </fo:inline>
        </fo:block>
    </xsl:template>

    <xsl:template match="section">
        <xsl:variable name="num" select="count(preceding-sibling::section)"/>
        <xsl:choose>
            <!-- Se é a primeira secção do capítulo -->
            <xsl:when test="$num &gt; 0">
                <fo:block id="{@label}" font="Copperplate Gothic Bold" text-align="right" font-size="28pt" font-weight="400" space-after="1cm" space-before="1cm">
                    <fo:inline color="black" font-size="28pt">
                        <xsl:number count="section|subsection" level="multiple"/>
                        <xsl:text>. </xsl:text>
                    </fo:inline>
                    <xsl:value-of select="title"/>
                </fo:block>
            </xsl:when>
            <xsl:otherwise>
                <fo:block id="{@label}" font="Copperplate Gothic Bold" text-align="right" font-size="28pt" font-weight="400" space-after="1cm" padding-before="3cm">
                    <fo:inline color="black" font-size="28pt">
                        <xsl:number count="section|subsection" level="multiple"/>
                        <xsl:text>. </xsl:text>
                    </fo:inline>
                    <xsl:value-of select="title"/>
                </fo:block>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates select="title/following-sibling::*"/>
    </xsl:template>

    <xsl:template match="section/subsection">
        <fo:block id="{@label}" font="Copperplate Gothic Bold" text-align="right" font-size="15pt" font-weight="400" space-after="1cm">
            <fo:inline color="black" font-size="15pt">
                <xsl:number count="section|subsection" level="multiple"/>
                <xsl:text>. </xsl:text>
            </fo:inline>
            <xsl:value-of select="title"/>
        </fo:block>
        <xsl:apply-templates select="title/following-sibling::*"/>
    </xsl:template>
    
    <xsl:template match="section/subsection/subsection">
        <fo:block id="{@label}" font="Copperplate Gothic Bold" text-align="right" font-size="13pt" font-weight="400" space-after="1cm">
            <fo:inline color="black" font-size="13pt">
                <xsl:number count="section|subsection" level="multiple"/>
                <xsl:text>. </xsl:text>
            </fo:inline>
            <xsl:value-of select="title"/>
        </fo:block>
        <xsl:apply-templates select="title/following-sibling::*"/>
    </xsl:template>
    
    <xsl:template match="section/subsection/subsection//subsection">
        <fo:block id="{@label}" font="Copperplate Gothic Bold" text-align="right" font-size="11pt" font-weight="400" space-after="1cm">
            <fo:inline color="black" font-size="11pt">
                <xsl:number count="section|subsection" level="multiple"/>
                <xsl:text>. </xsl:text>
            </fo:inline>
            <xsl:value-of select="title"/>
        </fo:block>
        <xsl:apply-templates select="title/following-sibling::*"/>
    </xsl:template>

    <!--
        Formato do sumário de um capítulo
    -->
    <xsl:template match="summary">
        <fo:block font="Copperplate Gothic Bold" text-align="right" font-size="15pt" font-weight="400" space-after="1cm" space-before="0.5cm">
            <xsl:value-of select="title"/>
        </fo:block>
        <xsl:apply-templates select="title/following-sibling::*"/>
    </xsl:template>

    <!--
        Formato dos exercícios dentro dos capítulos
    -->
    <xsl:template match="//chapter/exercises">
        <fo:block font="Copperplate Gothic Bold" text-align="right" font-size="15pt" font-weight="400" space-after="1cm" space-before="1cm">
            <xsl:value-of select="title"/>
        </fo:block>
        <fo:block font="Times" text-align="justify" font-size="11pt">
            <xsl:apply-templates select="title/following-sibling::*"/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="exercise">
        <xsl:choose>
            <xsl:when test="parent::exercise">
                <fo:block color="black" font-size="12pt" font-weight="bold" padding-start="1cm">
                    <xsl:number count="exercise" level="multiple"/>
                    <xsl:text>. </xsl:text>
                </fo:block>
            </xsl:when>
            <xsl:otherwise>
                <fo:block color="black" font-size="12pt" font-weight="bold">
                    <xsl:number count="exercise" level="multiple"/>
                    <xsl:text>. </xsl:text>
                </fo:block>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates/>
    </xsl:template>

</xsl:stylesheet>