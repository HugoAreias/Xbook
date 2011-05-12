<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="fo_metainfo.xsl"/>
    <xsl:import href="fo_body.xsl"/>
    <xsl:import href="fo_besidebody.xsl"/>
    <xsl:import href="fo_datatype.xsl"/>
    <xsl:import href="fo_toc.xsl"/>
    <xsl:output method="xml" indent="yes" xml:space="preserve"/>
    <xsl:template match="xbook">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="title-page" page-width="210mm" page-height="297mm" margin-top="3cm" margin-bottom="3cm" margin-left="2cm" margin-right="2cm">
                    <fo:region-body margin-top="0cm" margin-bottom="2cm" margin-left="1cm" margin-right="1cm"/>
                    <fo:region-before extent="0.5cm"/>
                    <fo:region-after extent="0.5cm" border-after-width="0.5cm"/>
                    <fo:region-start extent="2cm"/>
                    <fo:region-end extent="2cm"/>
                </fo:simple-page-master>

                <fo:simple-page-master master-name="besidebody-odd" margin-top="1.5cm" margin-bottom="1.5cm" margin-left="5cm" margin-right="2cm">
                    <fo:region-body margin="1.5cm" margin-left="0cm" margin-right="0cm"/>
                    <fo:region-before extent="0.5cm" region-name="pref-before-odd"/>
                    <fo:region-after extent="0.5cm" border-after-width="0.5cm" region-name="pref-after-odd"/>
                </fo:simple-page-master>
                
                <fo:simple-page-master master-name="besidebody-even" margin-top="1.5cm" margin-bottom="1.5cm" margin-left="2cm" margin-right="5cm">
                    <fo:region-body margin="1.5cm" margin-left="0cm" margin-right="0cm"/>
                    <fo:region-before extent="0.5cm" region-name="pref-before-even"/>
                    <fo:region-after extent="0.5cm" border-after-width="0.5cm" region-name="pref-after-even"/>
                </fo:simple-page-master>

                <fo:simple-page-master master-name="chapter" page-width="210mm" page-height="297mm"  margin-top="1.5cm" margin-bottom="1.5cm" margin-left="2cm" margin-right="2cm">
                    <fo:region-body margin="1.5cm"/>
                    <fo:region-before extent="0.5cm"/>
                    <fo:region-after extent="0.5cm" border-before-width="0.5cm"/>
                </fo:simple-page-master>

                <fo:simple-page-master master-name="frame-odd" page-width="210mm" page-height="297mm" margin-top="1.5cm" margin-bottom="1.5cm" margin-left="5cm" margin-right="2cm">
                    <fo:region-body margin-top="1.5cm" margin-bottom="1.5cm"/>
                    <fo:region-before extent="0.5cm" region-name="body-before-odd"/>
                    <fo:region-after extent="0.5cm" border-before-width="0.5cm" margin-top="1cm" region-name="body-after-odd"/>
                </fo:simple-page-master>
                
                <fo:simple-page-master master-name="frame-even" page-width="210mm" page-height="297mm" margin-top="1.5cm" margin-bottom="1.5cm" margin-left="2cm" margin-right="5cm">
                    <fo:region-body margin-top="1.5cm" margin-bottom="1.5cm"/>
                    <fo:region-before extent="0.5cm" region-name="body-before-even"/>
                    <fo:region-after extent="0.5cm" border-before-width="0.5cm" margin-top="1cm" region-name="body-after-even"/>
                </fo:simple-page-master>
<!--
                <fo:simple-page-master master-name="sec-first-page" page-width="210mm" page-height="297mm" margin-top="1.5cm" margin-bottom="1.5cm" margin-left="2cm" margin-right="2cm">
                    <fo:region-body margin="1.5cm"/>
                    <fo:region-after extent="0.5cm" background-color="silver" border-before-width="0.5cm"/>
                </fo:simple-page-master>

                <fo:simple-page-master master-name="sec-all-pages" page-width="210mm" page-height="297mm" margin-top="1.5cm" margin-bottom="1.5cm" margin-left="2cm" margin-right="2cm">
                    <fo:region-body margin="1.5cm"/>
                    <fo:region-after extent="0.5cm" background-color="silver" border-before-width="0.5cm"/>
                </fo:simple-page-master>
-->
                <!--
                    Controla o formato das páginas impares e pares dentro das secções
                -->
                <fo:page-sequence-master master-name="body-sequence">
                    <fo:repeatable-page-master-alternatives>
                        <fo:conditional-page-master-reference master-reference="frame-even" odd-or-even="odd"/>
                        <fo:conditional-page-master-reference master-reference="frame-odd" odd-or-even="even"/>
                    </fo:repeatable-page-master-alternatives>
                    <!--<fo:single-page-master-reference master-reference="sec-first-page"/>
                        <fo:repeatable-page-master-reference master-reference="sec-all-pages"/>-->
                </fo:page-sequence-master>
                
                <!--
                    Controla o formato das páginas impares e pares para tudo o que se encontra fora dos capítulos (ex. introdução, prefácio, conclusão, etc.)
                -->
                <fo:page-sequence-master master-name="preface">
                    <fo:repeatable-page-master-alternatives>
                        <fo:conditional-page-master-reference master-reference="besidebody-even" odd-or-even="odd"/>
                        <fo:conditional-page-master-reference master-reference="besidebody-odd" odd-or-even="even"/>
                    </fo:repeatable-page-master-alternatives>
                </fo:page-sequence-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="title-page" force-page-count="even">
                <xsl:if test="metainfo/frontcover">
<!--                    <fo:static-content flow-name="xsl-region-before" text-align="right">
                        <fo:block display-align="center">
                            <fo:external-graphic src="url('{metainfo/frontcover/img/@path}')" content-height="50%"/>
                        </fo:block>
                    </fo:static-content>-->
                </xsl:if>
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block font="7pt Copperplate Gothic Bold" text-align="center">
                        <xsl:value-of select="metainfo/publisher"/>
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block text-align="right" padding-bottom="2cm">
                        <fo:external-graphic src="url('{metainfo/frontcover/img/@path}')" content-height="50%"/>
                    </fo:block>
                    <xsl:apply-templates select="metainfo"/>
                </fo:flow>
            </fo:page-sequence>
            
            <fo:page-sequence master-reference="title-page" initial-page-number="1" format="I">
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block font="7pt Copperplate Gothic Bold" text-align="center" border-top-style="solid">
                        <fo:inline font-weight="bold" border-right-style="solid"><fo:page-number/></fo:inline>
                        <xsl:value-of select="metainfo/publisher"/>
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block/>
                </fo:flow>
            </fo:page-sequence>

            <!--
                Table of Contents
            -->
            <fo:page-sequence master-reference="preface" force-page-count="even" format="I">
                <!-- Definir os cabeçalhos e rodapés da table of contents -->
                <fo:static-content flow-name="pref-before-even">
                    <fo:block font="7pt Copperplate Gothic Bold" border-bottom-style="solid" text-align="outside">
                        <xsl:value-of select="metainfo/title"/>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="pref-before-odd">
                    <fo:block font="7pt Copperplate Gothic Bold" border-bottom-style="solid" text-align="inside">
                        <xsl:value-of select="metainfo/title"/>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="pref-after-even">
                    <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="inside">
                        <fo:inline font-weight="bold" border-right-style="solid"><fo:page-number/></fo:inline>
                        <xsl:value-of select="metainfo/publisher"/>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="pref-after-odd">
                    <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="outside">
                        <xsl:value-of select="metainfo/publisher"/>
                        <fo:inline font-weight="bold" border-left-style="solid"><fo:page-number/></fo:inline>
                    </fo:block>
                </fo:static-content>
                <!-- Definir o body da table of contents -->
                <fo:flow flow-name="xsl-region-body">
                    <xsl:call-template name="toc"/>
                </fo:flow>
            </fo:page-sequence>

            <!--
                Table of Figures - optional
            -->
            <xsl:if test="//xbook/@tof">
                <fo:page-sequence master-reference="preface" force-page-count="even" format="I">
                    <!-- Definir os cabeçalhos e rodapés da table of contents -->
                    <fo:static-content flow-name="pref-before-even">
                        <fo:block font="7pt Copperplate Gothic Bold" border-bottom-style="solid" text-align="outside">
                            <xsl:value-of select="metainfo/title"/>
                        </fo:block>
                    </fo:static-content>
                    <fo:static-content flow-name="pref-before-odd">
                        <fo:block font="7pt Copperplate Gothic Bold" border-bottom-style="solid" text-align="inside">
                            <xsl:value-of select="metainfo/title"/>
                        </fo:block>
                    </fo:static-content>
                    <fo:static-content flow-name="pref-after-even">
                        <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="inside">
                            <fo:inline font-weight="bold" border-right-style="solid"><fo:page-number/></fo:inline>
                            <xsl:value-of select="metainfo/publisher"/>
                        </fo:block>
                    </fo:static-content>
                    <fo:static-content flow-name="pref-after-odd">
                        <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="outside">
                            <xsl:value-of select="metainfo/publisher"/>
                            <fo:inline font-weight="bold" border-left-style="solid"><fo:page-number/></fo:inline>
                        </fo:block>
                    </fo:static-content>
                    <!-- Definir o body da table of contents -->
                    <fo:flow flow-name="xsl-region-body">
                        <xsl:call-template name="tof"/>
                    </fo:flow>
                </fo:page-sequence>
            </xsl:if>

            <!--
                Table of Tables - optional
            -->
            <xsl:if test="//xbook/@tot">
                <fo:page-sequence master-reference="preface" force-page-count="even" format="I">
                    <!-- Definir os cabeçalhos e rodapés da table of contents -->
                    <fo:static-content flow-name="pref-before-even">
                        <fo:block font="7pt Copperplate Gothic Bold" border-bottom-style="solid" text-align="outside">
                            <xsl:value-of select="metainfo/title"/>
                        </fo:block>
                    </fo:static-content>
                    <fo:static-content flow-name="pref-before-odd">
                        <fo:block font="7pt Copperplate Gothic Bold" border-bottom-style="solid" text-align="inside">
                            <xsl:value-of select="metainfo/title"/>
                        </fo:block>
                    </fo:static-content>
                    <fo:static-content flow-name="pref-after-even">
                        <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="inside">
                            <fo:inline font-weight="bold" border-right-style="solid"><fo:page-number/></fo:inline>
                            <xsl:value-of select="metainfo/publisher"/>
                        </fo:block>
                    </fo:static-content>
                    <fo:static-content flow-name="pref-after-odd">
                        <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="outside">
                            <xsl:value-of select="metainfo/publisher"/>
                            <fo:inline font-weight="bold" border-left-style="solid"><fo:page-number/></fo:inline>
                        </fo:block>
                    </fo:static-content>
                    <!-- Definir o body da table of contents -->
                    <fo:flow flow-name="xsl-region-body">
                        <xsl:call-template name="tot"/>
                    </fo:flow>
                </fo:page-sequence>
            </xsl:if>

            <!--
                Prefácio
            -->
            <fo:page-sequence master-reference="preface" force-page-count="even" format="I">
                <!-- Definir os cabeçalhos e rodapés do prefácio -->
                <fo:static-content flow-name="pref-before-even">
                    <fo:block font="7pt Copperplate Gothic Bold" border-bottom-style="solid" text-align="outside">
                        <xsl:value-of select="metainfo/title"/>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="pref-before-odd">
                    <fo:block font="7pt Copperplate Gothic Bold" border-bottom-style="solid" text-align="inside">
                        <xsl:value-of select="metainfo/title"/>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="pref-after-even">
                    <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="inside">
                        <fo:inline font-weight="bold" border-right-style="solid"><fo:page-number/></fo:inline>
                        <xsl:value-of select="metainfo/publisher"/>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="pref-after-odd">
                    <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="outside">
                        <xsl:value-of select="metainfo/publisher"/>
                        <fo:inline font-weight="bold" border-left-style="solid"><fo:page-number/></fo:inline>
                    </fo:block>
                </fo:static-content>
                <!-- Definir o body do prefácio -->
                <fo:flow flow-name="xsl-region-body">
                    <xsl:apply-templates select="preface"/>
                </fo:flow>
            </fo:page-sequence>

            <!--
                Introdução
            -->
            <fo:page-sequence master-reference="preface" force-page-count="odd" format="I">
                <!-- Definir os cabeçalhos e rodapés da introdução -->
                <fo:static-content flow-name="pref-before-even">
                    <fo:block font="7pt Copperplate Gothic Bold" border-bottom-style="solid" text-align="outside">
                        <xsl:value-of select="metainfo/title"/>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="pref-before-odd">
                    <fo:block font="7pt Copperplate Gothic Bold" border-bottom-style="solid" text-align="inside">
                        <xsl:value-of select="metainfo/title"/>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="pref-after-even">
                    <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="inside">
                        <fo:inline font-weight="bold" border-right-style="solid"><fo:page-number/></fo:inline>
                        <xsl:value-of select="metainfo/publisher"/>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="pref-after-odd">
                    <fo:block font="7pt Copperplate Gothic Bold" border-top-style="solid" text-align="outside">
                        <xsl:value-of select="metainfo/publisher"/>
                        <fo:inline font-weight="bold" border-left-style="solid"><fo:page-number/></fo:inline>
                    </fo:block>
                </fo:static-content>
                <!-- Definir o body da introdução -->
                <fo:flow flow-name="xsl-region-body">
                    <xsl:apply-templates select="intro"/>
                </fo:flow>
            </fo:page-sequence>
            <xsl:apply-templates select="body"/>
            <xsl:apply-templates select="conclusion"/>
            <xsl:if test="rec_read">
                <xsl:apply-templates select="rec_read"/>
            </xsl:if>
            <xsl:if test="exercises">
                <xsl:apply-templates select="exercises"/>
            </xsl:if>
            <xsl:if test="appendix">
                <xsl:apply-templates select="appendix"/>
            </xsl:if>
            <xsl:if test="glossary">
                <xsl:apply-templates select="glossary"/>
            </xsl:if>
            <xsl:if test="bibliography">
                <xsl:apply-templates select="bibliography"/>
            </xsl:if>
        </fo:root>
    </xsl:template>

    <!--
        Table of Contents
    -->
    <xsl:template name="toc">
        <fo:block font="Copperplate Gothic Bold" font-size="28pt" font-weight="400" text-align="outside" space-after="1cm" padding-before="1cm">
            <xsl:value-of select="//xbook/@ind"/>
        </fo:block>
        <fo:table>
            <fo:table-column column-width="90%"/>
            <fo:table-column column-width="1cm"/>
            <fo:table-body>
                <xsl:if test="//xbook/@tof">
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block font="18pt Copperplate Gothic Bold" text-align="justify" wrap-option="no-wrap">
                                <xsl:value-of select="//xbook/@tof"/>
                                <fo:leader leader-pattern="space" leader-length.maximum="75%" leader-length.optimum="60%" leader-length.minimum="40%"/>            
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block text-align="right"><fo:page-number-citation ref-id="tof"/></fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </xsl:if>
                <xsl:if test="//xbook/@tot">
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block font="18pt Copperplate Gothic Bold" text-align="justify" wrap-option="no-wrap">
                                <xsl:value-of select="//xbook/@tot"/>
                                <fo:leader leader-pattern="space" leader-length.maximum="75%" leader-length.optimum="60%" leader-length.minimum="40%"/>            
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block text-align="right"><fo:page-number-citation ref-id="tot"/></fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </xsl:if>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block font="18pt Copperplate Gothic Bold" text-align="justify" wrap-option="no-wrap">
                            <xsl:value-of select="//xbook/preface/title"/>
                            <fo:leader leader-pattern="space" leader-length.maximum="75%" leader-length.optimum="60%" leader-length.minimum="40%"/>            
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="right"><fo:page-number-citation ref-id="preface"/></fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block font="18pt Copperplate Gothic Bold" text-align="justify" wrap-option="no-wrap">
                            <xsl:value-of select="//xbook/intro/title"/>
                            <fo:leader leader-pattern="space" leader-length.maximum="75%" leader-length.optimum="60%" leader-length.minimum="40%"/>            
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="right"><fo:page-number-citation ref-id="intro"/></fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <xsl:apply-templates select="body" mode="toc"/>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block font="18pt Copperplate Gothic Bold" text-align="justify" wrap-option="no-wrap">
                            <xsl:value-of select="//xbook/conclusion/title"/>
                            <fo:leader leader-pattern="space" leader-length.maximum="75%" leader-length.optimum="60%" leader-length.minimum="40%"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="right"><fo:page-number-citation ref-id="conclusion"/></fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block font="18pt Copperplate Gothic Bold" text-align="justify" wrap-option="no-wrap">
                            <xsl:value-of select="//xbook/rec_read/title"/>
                            <fo:leader leader-pattern="space" leader-length.maximum="75%" leader-length.optimum="60%" leader-length.minimum="40%"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="right"><fo:page-number-citation ref-id="rec_read"/></fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <xsl:if test="//xbook/exercises">
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block font="18pt Copperplate Gothic Bold" text-align="justify" wrap-option="no-wrap">
                                <xsl:value-of select="//xbook/exercises/title"/>
                                <fo:leader leader-pattern="space" leader-length.maximum="75%" leader-length.optimum="60%" leader-length.minimum="40%"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block text-align="right"><fo:page-number-citation ref-id="exercises"/></fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </xsl:if>
                <xsl:if test="//xbook/appendix">
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block font="18pt Copperplate Gothic Bold" text-align="justify" wrap-option="no-wrap">
                                <xsl:value-of select="//xbook/appendix/title"/>
                                <fo:leader leader-pattern="space" leader-length.maximum="75%" leader-length.optimum="60%" leader-length.minimum="40%"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block text-align="right"><fo:page-number-citation ref-id="app"/></fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </xsl:if>
                <xsl:if test="//xbook/glossary">
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block font="18pt Copperplate Gothic Bold" text-align="justify" wrap-option="no-wrap">
                                <xsl:value-of select="//xbook/glossary/title"/>
                                <fo:leader leader-pattern="space" leader-length.maximum="75%" leader-length.optimum="60%" leader-length.minimum="40%"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block text-align="right"><fo:page-number-citation ref-id="gloss"/></fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </xsl:if>
                <xsl:if test="//xbook/bibliography">
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block font="18pt Copperplate Gothic Bold" text-align="justify" wrap-option="no-wrap">
                                <xsl:value-of select="//xbook/bibliography/@title"/>
                                <fo:leader leader-pattern="space" leader-length.maximum="75%" leader-length.optimum="60%" leader-length.minimum="40%"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block text-align="right"><fo:page-number-citation ref-id="bibl"/></fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </xsl:if>
            </fo:table-body>
        </fo:table>
    </xsl:template>

    <!--
        Imprimir a tabela de figuras
    -->
    <xsl:template name="tof">
        <fo:block font="Copperplate Gothic Bold" font-size="28pt" font-weight="400" text-align="outside" space-after="1cm" padding-before="1cm" id="tof">
            <xsl:value-of select="//xbook/@tof"/>
        </fo:block>    
        <fo:table>
            <fo:table-column column-width="90%"/>
            <fo:table-column column-width="1cm"/>
            <fo:table-body>
                <xsl:for-each select="//fig">
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block font="15pt Copperplate Gothic Bold" text-align="justify" wrap-option="no-wrap">
                                <xsl:value-of select="caption"/>
                                <fo:leader leader-pattern="space" leader-length.maximum="75%" leader-length.optimum="60%" leader-length.minimum="40%"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block text-align="right"><fo:page-number-citation ref-id="{generate-id(.)}"/></fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </xsl:for-each>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    <!--
        Imprimir a tabela de tabelas
    -->
    <xsl:template name="tot">
        <fo:block font="Copperplate Gothic Bold" font-size="28pt" font-weight="400" text-align="outside" space-after="1cm" padding-before="1cm" id="tot">
            <xsl:value-of select="//xbook/@tot"/>
        </fo:block>
        <fo:table>
            <fo:table-column column-width="90%"/>
            <fo:table-column column-width="1cm"/>
            <fo:table-body>
                <xsl:for-each select="//table">
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block font="15pt Copperplate Gothic Bold" text-align="justify" wrap-option="no-wrap">
                                <xsl:value-of select="caption"/>
                                <fo:leader leader-pattern="space" leader-length.maximum="75%" leader-length.optimum="60%" leader-length.minimum="40%"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block text-align="right"><fo:page-number-citation ref-id="{generate-id(.)}"/></fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </xsl:for-each>
            </fo:table-body>
        </fo:table>
    </xsl:template>

</xsl:stylesheet>