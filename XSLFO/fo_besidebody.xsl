<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="preface">
        <fo:block font="Copperplate Gothic Bold" font-size="28pt" text-align="right" space-after="1cm" padding-before="2cm" id="preface">
            <xsl:value-of select="title"/>
        </fo:block>
        <fo:block text-indent="1cm" font="Times" font-size="11pt" font-weight="normal" text-align="justify" line-height="1.5">
            <xsl:apply-templates select="title/following-sibling::*"/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="intro">
        <fo:block font="Copperplate Gothic Bold" font-size="28pt" font-weight="400" text-align="right" space-after="1cm" padding-before="2cm" id="intro">
            <xsl:value-of select="title"/>
        </fo:block>
        <fo:block text-indent="1cm" font="Times" font-size="11pt" font-weight="normal" text-align="justify" line-height="1.5">
            <xsl:apply-templates select="title/following-sibling::*"/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="conclusion">
        <fo:page-sequence master-reference="preface" force-page-count="even">
            <!-- Definir os cabe�alhos e rodap�s da conclus�o -->
            <fo:static-content flow-name="pref-before-even">
                <fo:block font="7pt Copperplate Gothic Bold" border-bottom-style="solid" text-align="outside">
                    <xsl:value-of select="../metainfo/title"/>
                </fo:block>
            </fo:static-content>
            <fo:static-content flow-name="pref-before-odd">
                <fo:block font="7pt Copperplate Gothic Bold" border-bottom-style="solid" text-align="inside">
                    <xsl:value-of select="../metainfo/title"/>
                </fo:block>
            </fo:static-content>
            <fo:static-content flow-name="pref-after-even">
                <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="inside">
                    <fo:inline font-weight="bold" border-right-style="solid"><fo:page-number/></fo:inline>
                    <xsl:value-of select="../metainfo/publisher"/>
                </fo:block>
            </fo:static-content>
            <fo:static-content flow-name="pref-after-odd">
                <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="outside">
                    <xsl:value-of select="../metainfo/publisher"/>
                    <fo:inline font-weight="bold" border-left-style="solid"><fo:page-number/></fo:inline>
                </fo:block>
            </fo:static-content>
            <!-- Imprimir o conte�do da conclus�o -->
            <fo:flow flow-name="xsl-region-body">
                <fo:block font="Copperplate Gothic Bold" font-size="28pt" font-weight="400" text-align="right" space-after="1cm" padding-before="2cm" id="conclusion">
                    <xsl:value-of select="title"/>
                </fo:block>
                <fo:block text-indent="1cm" font="Times" font-size="11pt" font-weight="normal" text-align="justify" line-height="1.5">
                    <xsl:apply-templates select="title/following-sibling::*"/>
                </fo:block>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>
    
    <!--
        Formato dos exerc�cios fora dos cap�tulos
    -->
    <xsl:template match="//xbook/exercises">
        <fo:page-sequence master-reference="preface" force-page-count="even">
            <!-- Definir cabe�alho e rodap� dos exerc�cios -->
            <fo:static-content flow-name="pref-after-even">
                <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="inside">
                    <fo:inline font-weight="bold" border-right-style="solid"><fo:page-number/></fo:inline>
                    <xsl:value-of select="../metainfo/publisher"/>
                </fo:block>
            </fo:static-content>
            <fo:static-content flow-name="pref-after-odd">
                <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="outside">
                    <xsl:value-of select="../metainfo/publisher"/>
                    <fo:inline font-weight="bold" border-left-style="solid"><fo:page-number/></fo:inline>
                </fo:block>
            </fo:static-content>
            <!-- Impimir o conte�do dos exerc�cios -->
            <fo:flow flow-name="xsl-region-body">
                <fo:block font="Copperplate Gothic Bold" font-size="28pt" font-weight="400" text-align="right" space-after="1cm" id="exercises">
                    <xsl:value-of select="title"/>
                </fo:block>
                <fo:block font="Times" text-align="justify" font-size="11pt">
                    <xsl:apply-templates select="title/following-sibling::*"/>
                </fo:block>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>

    <!--
        Formato das leituras recomendadas
    -->
    <xsl:template match="rec_read">
        <fo:page-sequence master-reference="preface" force-page-count="even">
            <!-- Definir cabe�alho e rodap� das leituras recomendadas -->
            <fo:static-content flow-name="pref-after-even">
                <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="inside">
                    <fo:inline font-weight="bold" border-right-style="solid"><fo:page-number/></fo:inline>
                    <xsl:value-of select="../metainfo/publisher"/>
                </fo:block>
            </fo:static-content>
            <fo:static-content flow-name="pref-after-odd">
                <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="outside">
                    <xsl:value-of select="../metainfo/publisher"/>
                    <fo:inline font-weight="bold" border-left-style="solid"><fo:page-number/></fo:inline>
                </fo:block>
            </fo:static-content>
            <!-- Impimir o conte�do das leituras recomendadas -->
            <fo:flow flow-name="xsl-region-body">
                <fo:block font="Copperplate Gothic Bold" font-size="28pt" font-weight="400" text-align="right" space-after="1cm" id="rec_read">
                    <xsl:value-of select="title"/>
                </fo:block>
                <fo:block font="Times" text-align="justify" font-size="11pt">
                    <xsl:apply-templates select="title/following-sibling::*"/>
                </fo:block>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>

    <!--
        Formato do gloss�rio
    -->
    <xsl:template match="glossary">
        <fo:page-sequence master-reference="preface" force-page-count="even">
            <!-- Definir cabe�alho e rodap� do gloss�rio -->
            <fo:static-content flow-name="pref-after-even">
                <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="inside">
                    <fo:inline font-weight="bold" border-right-style="solid"><fo:page-number/></fo:inline>
                    <xsl:value-of select="../metainfo/publisher"/>
                </fo:block>
            </fo:static-content>
            <fo:static-content flow-name="pref-after-odd">
                <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="outside">
                    <xsl:value-of select="../metainfo/publisher"/>
                    <fo:inline font-weight="bold" border-left-style="solid"><fo:page-number/></fo:inline>
                </fo:block>
            </fo:static-content>
            <!-- Impimir o conte�do do gloss�rio -->
            <fo:flow flow-name="xsl-region-body">
                <fo:block font="Copperplate Gothic Bold" font-size="28pt" font-weight="400" text-align="right" space-after="1cm" id="gloss">
                    <xsl:value-of select="title"/>
                </fo:block>
                <fo:block font="Times" text-align="justify" font-size="11pt">
                    <xsl:apply-templates select="title/following-sibling::*"/>
                </fo:block>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>

    <!--
        Formato da bibliografia
    -->
    <xsl:template match="bibliography">
        <fo:page-sequence master-reference="preface" force-page-count="even">
            <!-- Definir cabe�alho e rodap� da bibliografia -->
            <fo:static-content flow-name="pref-after-even">
                <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="inside">
                    <fo:inline font-weight="bold" border-right-style="solid"><fo:page-number/></fo:inline>
                    <xsl:value-of select="../metainfo/publisher"/>
                </fo:block>
            </fo:static-content>
            <fo:static-content flow-name="pref-after-odd">
                <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="outside">
                    <xsl:value-of select="../metainfo/publisher"/>
                    <fo:inline font-weight="bold" border-left-style="solid"><fo:page-number/></fo:inline>
                </fo:block>
            </fo:static-content>
            <!-- Impimir o conte�do da bibliografia -->
            <fo:flow flow-name="xsl-region-body">
                <fo:block font="Copperplate Gothic Bold" font-size="28pt" font-weight="400" text-align="right" space-after="1cm" id="bibl">
                    <xsl:value-of select="@title"/>
                </fo:block>
                <xsl:apply-templates select="entry"/>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>
    
    <xsl:template match="entry">
        <fo:block font="Times" text-align="justify" font-size="11pt">
            <xsl:for-each select="name">
                <xsl:value-of select="."/>
                <xsl:text>, </xsl:text>
            </xsl:for-each>
            <xsl:value-of select="title"/>
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
        </fo:block>
    </xsl:template>
    
    <!--
        Formato dos Appendix
    -->
    <xsl:template match="appendix">
        <fo:page-sequence master-reference="preface" force-page-count="even">
            <!-- Definir cabe�alho e rodap� dos appendix -->
            <fo:static-content flow-name="pref-after-even">
                <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="inside">
                    <fo:inline font-weight="bold" border-right-style="solid"><fo:page-number/></fo:inline>
                    <xsl:value-of select="../metainfo/publisher"/>
                </fo:block>
            </fo:static-content>
            <fo:static-content flow-name="pref-after-odd">
                <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="outside">
                    <xsl:value-of select="../metainfo/publisher"/>
                    <fo:inline font-weight="bold" border-left-style="solid"><fo:page-number/></fo:inline>
                </fo:block>
            </fo:static-content>
            <!-- Impimir o conte�do dos appendix -->
            <fo:flow flow-name="xsl-region-body">
                <fo:block font="Copperplate Gothic Bold" font-size="28pt" font-weight="400" text-align="right" space-after="1cm" id="app">
                    <xsl:value-of select="title"/>
                </fo:block>
                <fo:block font="Times" text-align="justify" font-size="11pt">
                    <xsl:apply-templates select="title/following-sibling::*"/>
                </fo:block>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>

</xsl:stylesheet>