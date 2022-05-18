<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="//tei:add">
        <xsl:choose>
            <xsl:when test="@place='marginleft'">
                <span style="left:-5em; position: absolute; font-size: 0.6em;"><xsl:apply-templates/></span>
            </xsl:when>
            <xsl:otherwise>
                <s><xsl:apply-templates/></s>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
