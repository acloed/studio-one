<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> 
<body>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th style="text-align:left">Album</th>
      <th style="text-align:left">Artist</th>
      <th style="text-align:left">Country</th>
      <th style="text-align:left">Company</th>
      <th style="text-align:left">Song</th>
      <th style="text-align:left">Media</th>
      <th style="text-align:left">Price</th>
	  <th style="text-align:left">Year</th>
    </tr>
    <xsl:for-each select="CATALOG/MP3">
    <tr>
      <td><xsl:value-of select="ALBUM" /></td>
	  <xsl:choose>
        <xsl:when test="PRICE &gt; 10">
		  <td bgcolor="#ffa07a">
		  <xsl:value-of select="ARTIST" /></td>
		</xsl:when>
		<xsl:when test="PRICE &gt; 9">
		  <td bgcolor="9acd32">
          <xsl:value-of select="ARTIST"/></td>
		</xsl:when>
        <xsl:otherwise>
		  <td><xsl:value-of select="ARTIST" /></td>
		</xsl:otherwise>
       </xsl:choose>
	  <td><xsl:value-of select="COUNTRY" /></td>
    <td><xsl:value-of select="COMPANY" /></td>
    <td><xsl:value-of select="SONG" /></td>
    <td><xsl:value-of select="MEDIA" /></td>
    <td><xsl:value-of select="PRICE" /></td>
    <td><xsl:value-of select="YEAR" /></td>
    </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>