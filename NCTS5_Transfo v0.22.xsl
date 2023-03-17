<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:variable name="roles">
;9=(OoDep);10=(OoDesA);11=(OoDesD);12=(OoTraA);13=(OoTraD);14=(OoGua);15=(CAoEnqDep);16=(CAoEnqDes);17=(CAoRecDep);18=(CAoRecDes);20=(CAoRecOC);21=(SPEED);41=(OoTraD2);62=(CAoRecOC);66=(CAoEnqDep);68=(CAoEnqDes);70=(CAoRecDep);72=(CAoRecDes);76=(OoDep);80=(OoDesA);84=(OoDesD);88=(OoGua);92=(OoTraA);94=(OoTraD2);98=(OoTraD);101=(OoExTraD);102=(OoExTraA);121=(OoIncReg);141=(OoTraD3);142=(OoTraD4);143=(OoTraD5);144=(OoTraD6);145=(OoExTraD2);161=(OoTraD3);181=(Trader at Destination);182=(Holder of the Transit Procedure);183=(OoGua2)
</xsl:variable>
<xsl:output method="xml" indent="yes"/>

<xsl:template match="/">

	<testcase xmlns="http://jazz.net/xmlns/alm/qm/v0.1/">
		<xsl:variable name="CTPid" select="concat(testCase/@group,': ')">
		</xsl:variable>
		<xsl:variable name="MSrelevant" select="testCase/@categoryId">
		</xsl:variable>
		<xsl:choose>
		<xsl:when test="contains($MSrelevant,'MS')">	
		<xsl:comment>MS_Relevant</xsl:comment>
		</xsl:when>			
		<xsl:otherwise>
		<xsl:comment>Nicht_Importieren</xsl:comment>
		</xsl:otherwise>
		</xsl:choose>
		<title xmlns="http://purl.org/dc/elements/1.1/">
		<xsl:comment>Testfallname</xsl:comment>	
      		<xsl:value-of select="concat('CTP-',testCase/@name,' ',testCase/title)"/>
		</title>
		<xsl:comment>Testfallbeschreibung</xsl:comment>
		<description xmlns="http://purl.org/dc/elements/1.1/">
      		<xsl:value-of select="replace(testCase/description,'&lt;br>',' ')"/>
		</description>		
		<state xmlns="http://jazz.net/xmlns/alm/v0.1/">com.ibm.rqm.planning.common.new</state>
		<xsl:comment>Testfallersteller</xsl:comment>
		<creator xmlns="http://purl.org/dc/elements/1.1/">Monnier Cédric</creator>
		<xsl:comment>Zusammenfassungsabschnitt</xsl:comment>		
		<category term="Bereich" value="UZK"/>
		<category term="Projekt" value="NCTS-P5"/>
		<category term="Ersteller" value="BMF"/>
		<xsl:comment>Vorbedingungsabschnitt</xsl:comment>
		<com.ibm.rqm.planning.editor.section.testCasePreCondition>
		<xsl:value-of select="replace(substring-after(testCase/preconditions,$CTPid),'&lt;br>',' ')"/>
		</com.ibm.rqm.planning.editor.section.testCasePreCondition>
		<xsl:comment>Testfalldesignabschnitt</xsl:comment>		
		<com.ibm.rqm.planning.editor.section.testCaseDesign>
		<xsl:text>Nachrichtenverkehr: </xsl:text>
		<xsl:for-each select="testCase/steps/step">
		<xsl:value-of select="concat(message/@type,'-')"/>
		</xsl:for-each>
		<xsl:if test="testCase/steps/step[1]/receiver/@name='NA'">
		<xsl:value-of select="substring-before(substring-after($roles, concat(';',testCase/steps/step[1]/receiver/@roleId,'=')),';')"/>
		</xsl:if>
		<xsl:if test="testCase/steps/step[1]/sender/@name='NA'">
		<xsl:value-of select="substring-before(substring-after($roles, concat(';',testCase/steps/step[1]/sender/@roleId,'=')),';')"/>		
		</xsl:if>
		<br/>			
		<xsl:value-of select="replace(concat(' ','Country type for each customs office role per NA testing:',substring-after(testCase/note,'Country type for each customs office role per NA testing:')),'&lt;br>',' ')"/>
		<br/>
		<xsl:value-of select="concat('Declaration type: ',substring-before(substring-after(testCase/steps/step[1]/message/@name,'-'),'-'))"/>
		<br/>
		<xsl:if test="(((testCase/steps/step[1]/receiver/@name='NA') and (testCase/steps/step[1]/receiver/@roleId='76')) or ((testCase/steps/step[1]/sender/@name='NA') and (testCase/steps/step[1]/sender/@roleId='76')))">
		</xsl:if>		
		</com.ibm.rqm.planning.editor.section.testCaseDesign>
		
	</testcase>
	</xsl:template>
</xsl:stylesheet>


