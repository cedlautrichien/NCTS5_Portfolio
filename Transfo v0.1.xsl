<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>
	
	
	<xsl:template match="/">
		<title>
      	<xsl:value-of select="concat(testCase/@name,' ',testCase/title)"/>
		</title>
		<description>
      	<xsl:value-of select="testCase/description"/>
		</description>
		<state xmlns="http://jazz.net/xmlns/alm/v0.1/">com.ibm.rqm.planning.common.new</state>
		<creator xmlns="http://purl.org/dc/elements/1.1/">Monnier Cédric</creator>
		<category term="Art des Testfalls" value="fachlich"/>
		<category term="Bereich" value="UZK"/>
		<category term="Projekt" value="NCTS-P5"/>
		<category term="Ersteller" value="BMF"/>
		<com.ibm.rqm.planning.editor.section.testCasePreCondition>
		<xsl:value-of select="testCase/preconditions"/>
		</com.ibm.rqm.planning.editor.section.testCasePreCondition>
		<com.ibm.rqm.planning.editor.section.testCaseDesign>
		<xsl:for-each select="testCase/steps/step">
		<xsl:value-of select="concat(message/@type,'-')"/>
		</xsl:for-each>
		<xsl:value-of select="concat(testCase/steps/step[1]/sender/@name,':',testCase/steps/step[1]/sender/@roleId,'/')"/>
		<xsl:value-of select="concat(testCase/steps/step[1]/receiver/@name,':',testCase/steps/step[1]/receiver/@roleId)"/>
		</com.ibm.rqm.planning.editor.section.testCaseDesign>
	</xsl:template>
	
	
</xsl:stylesheet>


