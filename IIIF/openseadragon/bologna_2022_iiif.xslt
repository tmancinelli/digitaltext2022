<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html"/>
    <xsl:template match="tei:TEI">
        <html>
            <head>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
                <meta charset="UTF-8"/>
            </head>
            <body>

                <div class="container">
                    <div class="row">
                        <div class="col-sm">
                          <div id="openseadragon" style="width: 80x; height: 300px;"></div>
                        <script src="https://cdn.jsdelivr.net/npm/openseadragon@2.4/build/openseadragon/openseadragon.min.js"></script>
                        <script type="text/javascript">
                        var viewer = OpenSeadragon({
                        id: "openseadragon",
                        prefixUrl: "https://cdn.jsdelivr.net/npm/openseadragon@2.4/build/openseadragon/images/",
                        tileSources:   [{
                         "@context": "http://iiif.io/api/image/2/context.json",
                         "@id": "<xsl:value-of select="//tei:facsimile/tei:graphic/@url"/>",
                         "height": 8176,
                         "width": 6128,
                         "profile": [ "http://iiif.io/api/image/2/level2.json" ],
                         "protocol": "http://iiif.io/api/image",
                         "tiles": [{
                           "scaleFactors": [ 1, 2, 4, 8, 16, 32 ],
                           "width": 1024
                         }]
                        }]
                        });
                        </script>
                                              </div>
                        <div class="col-sm" style="margin-left: 5em">
                            <xsl:apply-templates select="//tei:head"/>
                            <xsl:apply-templates select="//tei:div/tei:p"/>
                            Corrections: <xsl:copy-of select="$hands"/>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//tei:teiHeader"/>
    <xsl:template match="//tei:head">
        <h1>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    <xsl:template match="//tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="//tei:lb">
        <xsl:apply-templates/><br/>
    </xsl:template>

    <xsl:template match="//tei:del">
        <s>
            <xsl:apply-templates/>
        </s>
    </xsl:template>
    <xsl:template match="//tei:hi">
    <xsl:choose>
        <xsl:when test="@rend='u'">
            <u>
                <xsl:apply-templates/>
            </u>
        </xsl:when>
        <xsl:otherwise>
            <sup>
                <xsl:apply-templates/>
            </sup>
        </xsl:otherwise>
    </xsl:choose>
    </xsl:template>

    <xsl:variable name="hands" select="count(//*[@hand])"/>

    <xsl:include href="include_example.xsl"/>
</xsl:stylesheet>





