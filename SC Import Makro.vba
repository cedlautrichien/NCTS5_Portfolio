Sub Self_Certif()

Dim strFile As String
Dim varShow
Dim Row As Integer
Row = 148
    
On Error GoTo Fehlermeldung
Do While Row <= 151

strFile = ThisWorkbook.Path & Sheets("Tabelle1").Cells(Row, 10) & ".xml"
Open strFile For Output As #2
Print #2, "<?xml version=""1.0"" encoding=""UTF-8""?>"
Print #2, "<testcase xmlns=""http://jazz.net/xmlns/alm/qm/v0.1/"">"
Print #2, vbTab & "<!--Testfallname-->"
Print #2, vbTab & "<title xmlns=""http://purl.org/dc/elements/1.1/"">" & "CTP-" & Sheets("Tabelle1").Cells(Row, 10) & " " & Sheets("Tabelle1").Cells(Row, 15) & "</title>"
Print #2, vbTab & "<!--Testfallbeschreibung-->"
Print #2, vbTab & "<state xmlns=""http://jazz.net/xmlns/alm/v0.1/"">com.ibm.rqm.planning.common.new</state>"
Print #2, vbTab & "<!--Testfallersteller-->"
Print #2, vbTab & "<creator xmlns=""http://purl.org/dc/elements/1.1/"">Monnier C" & Chr(233) & "dric</creator>"
Print #2, vbTab & "<!--Zusammenfassungsabschnitt-->"
Print #2, vbTab & "<category term=""Bereich"" value=""UZK""/>"
Print #2, vbTab & "<category term=""Projekt"" value=""NCTS-P5""/>"
Print #2, vbTab & "<category term=""Ersteller"" value=""BMF""/>"
Print #2, vbTab & "<category term=""Testphase"" value=""Self-certification Test""/>"
Print #2, vbTab & "<!--Vorbedingungsabschnitt-->"
Print #2, vbTab & "<com.ibm.rqm.planning.editor.section.testCasePreCondition>" & "CD Protocol: " & Sheets("Tabelle1").Cells(Row, 2) & " | Simulated Period: " & Sheets("Tabelle1").Cells(Row, 3) & " </com.ibm.rqm.planning.editor.section.testCasePreCondition>"
Print #2, vbTab & "<!--Testfalldesignabschnitt-->"
Print #2, vbTab & "<com.ibm.rqm.planning.editor.section.testCaseDesign>" & "Nachrichtenverkehr: " & Sheets("Tabelle1").Cells(Row, 17) & "</com.ibm.rqm.planning.editor.section.testCaseDesign>"
Print #2, "</testcase>"
'** XML-Datei schließen
Close #2

Row = Row + 1
Loop
Exit Sub

'** Errorhandling
Fehlermeldung:
Close #2
 MsgBox "Fehler-Nr.: " & Err.Number & vbNewLine & vbNewLine _
 & "Beschreibung: " & Err.Description _
 , vbCritical, "Fehler"


End Sub