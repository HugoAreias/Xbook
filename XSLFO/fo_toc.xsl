<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:template match="body" mode="toc">
        <xsl:apply-templates select="chapter" mode="toc"/>
    </xsl:template>
    
    <!--
        Gerar IDs para todas as secções e capítulos para poderem aparecer na table of contents
    -->
    <xsl:template match="chapter" mode="toc">
        <fo:table-row>
            <fo:table-cell>
                <fo:block font="18pt Copperplate Gothic Bold" text-align="justify" wrap-option="no-wrap" font-weight="bold">
                    <xsl:value-of select="title"/>
                    <xsl:text> </xsl:text>
                    <xsl:number count="chapter" level="single" format="I"/>
                    <fo:leader font-size="18pt" leader-pattern="space" leader-length.maximum="75%" leader-length.optimum="60%" leader-length.minimum="40%"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell>
                <fo:block text-align="right"><fo:page-number-citation ref-id="{@label}"/></fo:block>
            </fo:table-cell>
        </fo:table-row>
        <xsl:apply-templates select="section" mode="toc"/>
    </xsl:template>
    
    <xsl:template match="section" mode="toc">
        <fo:table-row>
            <fo:table-cell>
                <fo:block font="15pt Copperplate Gothic Bold" text-align="justify" wrap-option="no-wrap" text-indent="1cm">
                    <xsl:value-of select="title"/>
                    <xsl:text> </xsl:text>
                    <xsl:number count="section|subsection" level="multiple"/>
                    <xsl:text>.</xsl:text>
                    <fo:leader font-size="18pt" leader-pattern="space" leader-length.maximum="75%" leader-length.optimum="60%" leader-length.minimum="40%"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell>
                <fo:block text-align="right"><fo:page-number-citation ref-id="{@label}"/></fo:block>
            </fo:table-cell>
        </fo:table-row>
        <xsl:apply-templates select="subsection" mode="toc"/>
    </xsl:template>
    
    <xsl:template match="section/subsection" mode="toc">
        <fo:table-row>
            <fo:table-cell>
                <fo:block font="13pt Copperplate Gothic Bold" text-align="justify" wrap-option="no-wrap" text-indent="1.7cm">
                    <xsl:value-of select="title"/>
                    <xsl:text> </xsl:text>
                    <xsl:number count="section|subsection" level="multiple"/>
                    <xsl:text>.</xsl:text>
                    <fo:leader font-size="18pt" leader-pattern="space" leader-length.maximum="75%" leader-length.optimum="60%" leader-length.minimum="40%"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell>
                <fo:block text-align="right"><fo:page-number-citation ref-id="{@label}"/></fo:block>
            </fo:table-cell>
        </fo:table-row>
        <xsl:apply-templates select="subsection" mode="toc"/>
    </xsl:template>
    
    <xsl:template match="section/subsection/subsection" mode="toc">
        <fo:table-row>
            <fo:table-cell>
                <fo:block font="11pt Copperplate Gothic Bold" text-align="justify" wrap-option="no-wrap" text-indent="2.4cm">
                    <xsl:value-of select="title"/>
                    <xsl:text> </xsl:text>
                    <xsl:number count="section|subsection" level="multiple"/>
                    <xsl:text>.</xsl:text>
                    <fo:leader font-size="18pt" leader-pattern="space" leader-length.maximum="75%" leader-length.optimum="60%" leader-length.minimum="40%"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell>
                <fo:block text-align="right"><fo:page-number-citation ref-id="{@label}"/></fo:block>
            </fo:table-cell>
        </fo:table-row>
        
        <xsl:apply-templates select="subsection" mode="toc"/>
    </xsl:template>
    
    <xsl:template match="section/subsection/subsection//subsection" mode="toc">
        <fo:table-row>
            <fo:table-cell>
                <fo:block font="10pt Copperplate Gothic Bold" text-align="justify" wrap-option="no-wrap" text-indent="3.1cm">
                    <xsl:value-of select="title"/>
                    <xsl:text> </xsl:text>
                    <xsl:number count="section|subsection" level="multiple"/>
                    <xsl:text>.</xsl:text>
                    <fo:leader font-size="18pt" leader-pattern="space" leader-length.maximum="75%" leader-length.optimum="60%" leader-length.minimum="40%"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell>
                <fo:block text-align="right"><fo:page-number-citation ref-id="{@label}"/></fo:block>
            </fo:table-cell>
        </fo:table-row>
        
        <xsl:apply-templates select="subsection" mode="toc"/>
    </xsl:template>

</xsl:stylesheet>