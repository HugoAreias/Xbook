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
            <!-- Definir os cabeçalhos e rodapés da conclusão -->
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
            <!-- Imprimir o conteúdo da conclusão -->
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
        Formato dos exercícios fora dos capítulos
    -->
    <xsl:template match="//xbook/exercises">
        <fo:page-sequence master-reference="preface" force-page-count="even">
            <!-- Definir cabeçalho e rodapé dos exercícios -->
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
            <!-- Impimir o conteúdo dos exercícios -->
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
            <!-- Definir cabeçalho e rodapé das leituras recomendadas -->
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
            <!-- Impimir o conteúdo das leituras recomendadas -->
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
        Formato do glossário
    -->
    <xsl:template match="glossary">
        <fo:page-sequence master-reference="preface" force-page-count="even">
            <!-- Definir cabeçalho e rodapé do glossário -->
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
            <!-- Impimir o conteúdo do glossário -->
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
            <!-- Definir cabeçalho e rodapé da bibliografia -->
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
            <!-- Impimir o conteúdo da bibliografia -->
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
            <!-- Definir cabeçalho e rodapé dos appendix -->
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
            <!-- Impimir o conteúdo dos appendix -->
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