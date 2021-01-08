<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="body">
    <html>
    <head>
    </head>
    <body>
    <h1>Результат</h1>
    <table>
      <xsl:for-each select="row">
        <tr>
          <td><xsl:value-of select="binary" /><br/></td>
          <td><xsl:value-of select="decimal" /><br/></td>
        </tr>
      </xsl:for-each>
    </table>
     </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
