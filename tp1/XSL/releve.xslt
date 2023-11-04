<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>XSLT</title>
            </head>
            <body>
                <h3> RIB : <xsl:value-of select="/releve/@RIB" />
                </h3>
                <h3> Date de releve : <xsl:value-of select="/releve/dateReleve" /></h3>
                <h3> Solde : <xsl:value-of select="/releve/solde" /></h3>

                <table cellspacing="2">
                    <tr>
                        <th>Type</th>
                        <th>Date</th>
                        <th>Montant</th>
                        <th>Description</th>
                    </tr>
                    <xsl:for-each select="releve/operations/operation">
                        <tr>
                            <td>
                                <xsl:value-of select="@type" />
                            </td>
                            <td>
                                <xsl:value-of select="@date" />
                            </td>
                            <td>
                                <xsl:value-of select="@montant" />
                            </td>
                            <td>
                                <xsl:value-of select="@description" />
                            </td>

                        </tr>
                    </xsl:for-each>

                </table>
                <h3> Total des opérations de débit :<xsl:value-of
                        select="sum(/releve/operations/operation[@type='DEBIT']/@montant)" /></h3>
                <h3> Total des opérations de credit :<xsl:value-of
                        select="sum(/releve/operations/operation[@type='CREDIT']/@montant)" /></h3>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>