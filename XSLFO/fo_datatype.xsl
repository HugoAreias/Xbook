<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!-- 
       Conte�do das sec��es 
    -->
    <xsl:template match="textblock">
        <xsl:apply-templates/>
    </xsl:template>

    <!--
        Templates para os par�grafos...podemos ter paragr�fos provenientes de diferentes tags
    -->
    <xsl:template match="paragraph">
        <fo:block text-indent="1cm" font="Times" text-align="justify" font-size="11pt" font-weight="normal" space-after="0.5cm" line-height="1.5">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="//define/paragraph">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="//item/paragraph">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="//enum/paragraph">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="//note/paragraph">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="//cell/paragraph">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- 
        Caracter�sticas dos locais
    -->
    <xsl:template match="local">
        <fo:inline font-style="italic">
            <xsl:value-of select="."/>
        </fo:inline>
    </xsl:template>

    <!-- 
        Caracter�sticas dos nomes
    -->
    <xsl:template match="name">
        <fo:inline font-size="120%">
            <xsl:value-of select="."/>
        </fo:inline>
    </xsl:template>

    <!-- 
        Caracter�sticas dos emails
    -->
    <xsl:template match="email">
        <xsl:value-of select="."/>
    </xsl:template>

    <!-- 
        Caracter�sticas das defini��es
    -->
    <xsl:template match="define">
        <fo:block font="Times" font-size="11pt" font-weight="bold" text-align="justify" line-height="1.5" text-indent="1cm" space-after="0.5cm">
            <xsl:value-of select="term"/>
            <xsl:text> -> </xsl:text>
            <fo:inline font-weight="normal">
                <xsl:apply-templates select="paragraph"/>
            </fo:inline>
        </fo:block>
    </xsl:template>

    <xsl:template match="//glossary/define">
        <fo:block font="Copperplate Gothic Bold" font-size="9pt" text-align="justify" line-height="1.5">
            <xsl:value-of select="term"/>
            <xsl:text> -> </xsl:text>
            <fo:inline font="Times" font-size="10pt" text-align="justify">
                <xsl:apply-templates select="paragraph"/>
            </fo:inline>
        </fo:block>
    </xsl:template>

    <xsl:template match="//exercise/textblock/define">
        <fo:inline font-weight="bold" line-height="1.5">
            <xsl:value-of select="term"/>
            <xsl:text> -> </xsl:text>
        </fo:inline>
        <fo:inline font-weight="normal">
            <xsl:apply-templates select="paragraph"/>
        </fo:inline>
    </xsl:template>

    <!-- 
        Caracter�sticas dos termos
    -->
    <xsl:template match="term">
        <fo:inline font-weight="bold">
            <xsl:value-of select="."/>
        </fo:inline>
    </xsl:template>

    <!-- 
        Caracter�sticas das marcas
    -->
    <xsl:template match="itemize">
        <fo:list-block provisional-distance-between-starts="18pt" provisional-label-separation="1.5pt" space-after="1cm" text-indent="1cm">
            <xsl:apply-templates select="item"/>
        </fo:list-block>
    </xsl:template>

    <!--
        Template que crias os items de um itemize! Se o seu primeiro filho � um itemize ou um enumeration n�o imprimimos a item-label para n�o ficar repetida
    -->
    <xsl:template match="item">
        <xsl:choose>
            <xsl:when test="child::*[position()=1]=itemize or child::*[position()=1]=enumeration">
                <fo:list-item space-after="0.2cm">
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block></fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <xsl:apply-templates/>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
            </xsl:when>
            <xsl:otherwise>
                <fo:list-item space-after="0.2cm">
                    <fo:list-item-label end-indent="label-end()">
                        <xsl:choose> 
                            <xsl:when test="../parent::item">
                                <fo:block font-weight="bold" font-size="17">-</fo:block>
                            </xsl:when>
                            <xsl:otherwise>
                                <fo:block font-weight="bold" font-size="17"><fo:character character="&#x2022;"/></fo:block>
                            </xsl:otherwise>
                        </xsl:choose>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <xsl:apply-templates/>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!--
        Caracter�sticas das numera��es
    -->
    <xsl:template match="enumeration">
        <fo:list-block provisional-distance-between-starts="18pt" provisional-label-separation="1.5pt" space-after="1cm" text-indent="1cm">
            <xsl:apply-templates select="enum"/>
        </fo:list-block>
    </xsl:template>

    <!--
        Template que crias os enums de um enumeration! Se o seu primeiro filho � um itemize ou um enumeration n�o contamos
    -->
    <xsl:template match="enum">
        <xsl:choose>
            <xsl:when test="child::*[position()=1]=itemize or child::*[position()=1]=enumeration">
                <fo:list-item space-after="0.3cm">
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block></fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <xsl:apply-templates/>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
            </xsl:when>
            <xsl:otherwise>
                <fo:list-item space-after="0.3cm">
                    <fo:list-item-label end-indent="label-end()">
                        <xsl:choose> 
                            <xsl:when test="../parent::enum">
                                <fo:block font-weight="bold" font-size="13"><xsl:number count="enum" level="single"/></fo:block>
                            </xsl:when>
                            <xsl:otherwise>
                                <fo:block font-weight="bold" font-size="13"><xsl:number count="enum" level="single"/></fo:block>
                            </xsl:otherwise>
                        </xsl:choose>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <xsl:apply-templates/>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- 
        Caracter�sticas do bold
    -->
    <xsl:template match="bold">
        <fo:inline font-weight="bold">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <!-- 
        Caracter�sticas do it�lico
    -->
    <xsl:template match="italic">
        <fo:inline font-style="italic">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <!-- 
        Caracter�sticas do superscript
    -->
    <xsl:template match="super">
        <fo:inline baseline-shift="sub" font-size="smaller">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <!-- 
        Caracter�sticas do subscript
    -->
    <xsl:template match="sub">
        <fo:inline baseline-shift="super" font-size="smaller">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <!-- 
        Caracter�sticas dos anos
    -->
    <xsl:template match="year">
        <fo:inline>
            <xsl:text>(</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>)</xsl:text>
        </fo:inline>
    </xsl:template>

    <!-- 
        Caracter�sticas das express�es
    -->
    <xsl:template match="exp">
        <fo:inline font-style="italic" font-size="110%">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <!-- 
        Caracter�sticas das observa��es
    -->
    <xsl:template match="obs">
        <fo:block text-indent="1.5cm" font="Times" text-align="justify" font-size="11pt" font-weight="normal" space-after="0.5cm" space-before="0.5cm" line-height="1.5">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <!-- 
        Caracter�sticas das refer�ncias
    -->
    <xsl:template match="exref | figref | tabref | secref | chpref">
        <fo:inline>
            <xsl:text>(</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>)</xsl:text>
        </fo:inline>
    </xsl:template>

    <!-- 
        Caracter�sticas do sublinhado
    -->
    <xsl:template match="under">
        <fo:inline text-decoration="underline">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <!-- 
        Caracter�sticas dos url
    -->
    <xsl:template match="url">
        <fo:inline font-style="italic" font-size="110%">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <!-- 
        Caracter�sticas das cita��es
    -->
    <xsl:template match="citation">
        <fo:inline>
            <xsl:text>"</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>"</xsl:text>
        </fo:inline>
    </xsl:template>

    <!-- 
        Caracter�sticas do rasurado
    -->
    <xsl:template match="strike">
        <fo:inline text-decoration="line-through">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <!-- 
        Caracter�sticas das equa��es
    -->
    <xsl:template match="equation">
        <fo:block font="Tahoma" text-align="center" font-size="9pt" font-weight="normal" space-after="0.5cm" space-before="0.5cm">
            <xsl:value-of select="."/>
        </fo:block>
    </xsl:template>

    <!-- 
        Caracter�sticas do c�digo
    -->
    <xsl:template match="code">
        <fo:block font="Courier New" text-align="esquerda" font-size="9pt" white-space="pre" text-indent="0cm">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <!-- 
        Caracter�sticas dos coment�rios
    -->
    <xsl:template match="comment">
        <fo:inline font="Times">
            <xsl:text>        # </xsl:text>
            <xsl:value-of select="."/>
        </fo:inline>
    </xsl:template>

    <!--
        Caracter�sticas dos caracteres
    -->
    <xsl:template match="char">
        <fo:inline text-transform="uppercase">
            <xsl:value-of select="."/>
        </fo:inline>
    </xsl:template>

    <!--
        Caracter�sticas das notas
    -->
    <xsl:template match="note">
        <fo:block font="10pt Times" text-align="justify" space-after="0.5cm" padding-top="0.2cm" text-indent="0cm">
            <fo:inline font-weight="bold">
                <xsl:value-of select="@label"/>
                <xsl:text>: </xsl:text>
            </fo:inline>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <!--
        Caracter�sticas dos exemplos
    -->
    <xsl:template match="example">
        <xsl:variable name="num" select="count(preceding::example)"/>
        <fo:block font="Copperplate Gothic Bold" text-align="right" font-size="15pt" font-weight="400" space-after="1cm" space-before="1cm">
            <xsl:value-of select="@label"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="$num+1"/>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="title"/>
        </fo:block>
        <xsl:apply-templates select="ex"/>
    </xsl:template>

    <xsl:template match="ex">
        <xsl:apply-templates/>
    </xsl:template>

    <!--
        Caracter�sticas das imagens
    -->
    <xsl:template match="fig">
        <xsl:variable name="num" select="count(preceding::fig)"/>
        <fo:block id="{generate-id(.)}" display-align="center" text-align="center" space-before="0.5cm" space-after="o.5cm">
            <fo:external-graphic src="url('{img/@path}')" content-height="20%"/>
        </fo:block>
        <fo:block text-align="center" font="8pt Tahoma" font-weight="bold" space-after="1cm">
            <xsl:text>fig. </xsl:text>
            <xsl:value-of select="$num+1"/>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="caption"/>
        </fo:block>
    </xsl:template>

    <!--
        Formato das tabelas
    -->
    <xsl:template match="table">
        <xsl:variable name="num" select="count(preceding::table)"/>
        <fo:table border-style="solid" space-after="0.1cm">
<!--            <xsl:for-each select="header[1]/cell | hline[1]/cell">
                <fo:table-column column-widht="50%"/>
            </xsl:for-each>-->
            <fo:table-header background-color="silver">
                <xsl:apply-templates select="header"/>
            </fo:table-header>
            <fo:table-body>
                <xsl:apply-templates select="hline"/>
            </fo:table-body>
        </fo:table>
        <fo:block id="{generate-id(.)}" text-align="center" font="8pt Tahoma" font-weight="bold" space-after="1cm">
            <xsl:text>tab. </xsl:text>
            <xsl:value-of select="$num+1"/>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="caption"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="header">
            <fo:table-row>
                <xsl:apply-templates/>
            </fo:table-row>
    </xsl:template>
    
    <xsl:template match="hline">
        <fo:table-row>
            <xsl:apply-templates/>
        </fo:table-row>
    </xsl:template>

    <xsl:template match="//header/cell">
        <fo:table-cell border-style="solid">
            <fo:block font="7pt Copperplate Gothic Bold" text-align="justify">
                <xsl:apply-templates select="paragraph"/>
            </fo:block>
        </fo:table-cell>
    </xsl:template>

    <xsl:template match="//hline/cell">
        <fo:table-cell border-style="solid">
            <fo:block font="8pt Tahoma" text-align="justify">
                <xsl:apply-templates select="paragraph"/>
            </fo:block>
        </fo:table-cell>
    </xsl:template>

</xsl:stylesheet>