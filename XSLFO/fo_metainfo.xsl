<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!--
        Formatação da informação do livro
    -->
    <xsl:template match="metainfo">
        <fo:block font="Helvetica" text-align="center" font-size="35pt" font-weight="600" space-after="0.2cm" space-before="0.5cm">
            <xsl:value-of select="title"/>
        </fo:block>
        <xsl:if test="subtitle">
            <fo:block font-size="28pt" font="Times" text-align="center" space-after="0.5cm" space-before="0.2cm">
                <xsl:value-of select="subtitle"/>
            </fo:block>
        </xsl:if>
        <xsl:apply-templates select="authors"/>
        <xsl:if test="local">
            <fo:block font-size="20pt" font="Times" text-align="center" space-before="1.5cm">
                <xsl:value-of select="local"/>
            </fo:block>
        </xsl:if>
        <xsl:apply-templates select="date"/>
    </xsl:template>
    
    <!--
        Formatação da informação dos autores
    -->
    <xsl:template match="author">
        <fo:block font="Tahoma" text-align="center" font-size="20pt" font-weight="normal" space-before="0.1cm">
            <xsl:value-of select="name"/>
            <!-- Criar footnotes com a informação sobre os autores -->
            <fo:footnote >
                <fo:inline baseline-shift="super" font-size="8pt" font-weight="bold">
                    <xsl:number count="author" level="single"/>
                </fo:inline>
                <fo:footnote-body >
                    <fo:block font="10pt Verdana" text-align="left">
                        <xsl:choose>
                            <xsl:when test="degree and rank">
                                <xsl:text>(</xsl:text><xsl:number count="author" level="single"/><xsl:text>) </xsl:text>
                                <xsl:value-of select="degree"/>
                                <xsl:text>, </xsl:text>
                                <xsl:value-of select="rank"/>
                            </xsl:when>
                            <xsl:when test="degree">
                                <xsl:text>(</xsl:text><xsl:number count="author" level="single"/><xsl:text>) </xsl:text>
                                <xsl:value-of select="degree"/>
                            </xsl:when>
                            <xsl:when test="rank">
                                <xsl:text>(</xsl:text><xsl:number count="author" level="single"/><xsl:text>) </xsl:text>
                                <xsl:value-of select="rank"/>
                            </xsl:when>
                            <xsl:otherwise></xsl:otherwise>
                        </xsl:choose>
                    </fo:block>
                </fo:footnote-body>
            </fo:footnote>
            <!-- Adiciona o id, caso este exista, logo a seguir ao autor -->
            <xsl:if test="id">
                <fo:inline>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="id"/>
                </fo:inline>
            </xsl:if>
        </fo:block>
        <fo:block font="Helvetica" text-align="center" font-size="17pt" font-weight="normal" wrap-option="no-wrap">
            <xsl:if test="email">
                <xsl:value-of select="email"/>
                <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:if test="webpage">
                <xsl:value-of select="webpage"/>
            </xsl:if>
        </fo:block>
        <fo:block font="Helvetica" text-align="center" font-size="15pt" font-weight="normal" wrap-option="no-wrap">
            <xsl:if test="affiliation">
                <xsl:value-of select="affiliation"/>
            </xsl:if>
        </fo:block>
        <!-- Adicionar a foto do autor caso exista -->
        <xsl:if test="photo">
            <fo:block display-align="center" text-align="center" space-before="0.3cm" space-after="0.3cm">
                <fo:external-graphic src="url('{photo/img/@path}')" content-height="auto"/>
            </fo:block>
        </xsl:if>
    </xsl:template>
    
    <!--
        Formatação da data
    -->
    <xsl:template match="date">
        <fo:block font="Helvetica" text-align="center" font-size="24pt" font-weight="800" space-before="1.5cm">
            <xsl:value-of select="."/>
        </fo:block>
    </xsl:template>
</xsl:stylesheet>
