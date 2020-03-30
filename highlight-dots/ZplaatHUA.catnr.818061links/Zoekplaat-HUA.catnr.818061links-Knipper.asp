<html>
<head>
<%
'*(uit regel db4 wordt objectnr en volgnr gehaald:)
objectnr = Request.QueryString("objectnr")
volgnummer = Request.QueryString("volgnummer")

'*(in db-Object zoekt hij object:)
strDBPath = Server.MapPath("/Object/DATABASES/db-Object.mdb")
Set cnnSearch = Server.CreateObject("ADODB.Connection")
cnnSearch.Mode = adModeRead
cnnSearch.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & ";"

StrSQL = "SELECT * FROM tabelobject"
StrSQL = StrSQL & " Where Objectnr = '" & objectnr  & "'"
StrSQL = StrSQL & " order by Objectnr"

Set rstSearch = Server.CreateObject("ADODB.Recordset")
rstSearch.Open strSQL, cnnSearch
iRecordCount = rstSearch.RecordCount

if not rstSearch.EOF then%>

<div id="resultatenlijst">
<%
Dim aResults
aResults = rstSearch.GetRows
trefwoord=aResults(1,0) 
end if
call afsluiten

'*(hiermee zoekt hij in ZoekplaatDb + tabel het objectnr en volgnr en positie knipperbolletje:)
strDBPath = Server.MapPath("/data/ZoekplaatDb/ZplaatHUA/ZplaatHUA.catnr.818061links/ZplaatHUA.catnr.818061links-Db.mdb")
Set cnnSearch = Server.CreateObject("ADODB.Connection")
cnnSearch.Mode = adModeRead
cnnSearch.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & ";"

StrSQL = "SELECT * FROM ZoekplaatTabel"
StrSQL = StrSQL & " Where Objnr = '" & objectnr  & "'"
StrSQL = StrSQL & " and volgnr like '%" & volgnummer & "%'"
StrSQL = StrSQL & " order by Objnr"

Set rstSearch = Server.CreateObject("ADODB.Recordset")
rstSearch.Open strSQL, cnnSearch
iRecordCount = rstSearch.RecordCount

if not rstSearch.EOF then%>

<div id="resultatenlijst">
<%
Dim bResults
bResults = rstSearch.GetRows
url=bResults(2,0) 
volgnummer=bResults(3,0) 
xc=bResults(4,0) 
yc=bResults(5,0) 
end if
call afsluiten
%>

<!---*schrijft kop van de kaart--->
<TITLE><%response.write trefwoord%> _kaart_6 [<%response.write volgnummer%>]</TITLE>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="/uds4/WP730.css">
</head>
<body  bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="3">

<!---*schrijft in afbeelding van de kaart het bolletje--->
<DIV style="Z-INDEX: 2; LEFT: <%response.write XC%>px; VISIBILITY: visible; POSITION: absolute; TOP: <%response.write YC%>;font-size:9px;FONT-FAMILY:ARIAL"><IMG height=10 alt="animated gif"
      src="/UDS4/images/Knipperbolletje.gif" width=10
      border=0> </DIV>
<!--boven -->
<TABLE border=0 cellPadding=0 cellSpacing=0 
style="BORDER-BOTTOM: #000000 3px double" width=1000>
  <TBODY>
  <TR>
    <TD align=left style="PADDING-BOTTOM: 2px" vAlign=bottom width=10></TD>
    <TD align=left bgColor=#ffffff borderColor=#000000 
    style="BORDER-BOTTOM: 0px groove; BORDER-LEFT: 0px groove; BORDER-RIGHT: 0px groove; BORDER-TOP: 0px groove; PADDING-BOTTOM: 2px" 
    vAlign=bottom width=227 color="#FFFFFF" size="1" face="Arial" >
</TD>
    <TD align=left rowSpan=2 style="PADDING-BOTTOM: 2px" width=400>
      <TABLE border=0 cellPadding=0 cellSpacing=0 width=400>
        <TBODY>
        <TR>
          <TD align=right width=152><a href="/" target="_top"><IMG border=0 height=35 src="/images/udslogo.jpg" 
          width=150></a></TD>

          <TD align=right width=15></TD>
          <TD width=227>
    <b><font face="Arial" size="3">Kaart 6<br>
      losse afbeeldingen</font></b>

</TD></TR></TBODY></TABLE></TD>
    <TD align=right bgColor=white 
    style="BORDER-BOTTOM: 0px groove; BORDER-LEFT: 0px groove; BORDER-RIGHT: 0px groove; BORDER-TOP: 0px groove; PADDING-BOTTOM: 2px" 
    vAlign=bottom width=180>&nbsp;</TD>
    <TD align=right style="PADDING-BOTTOM: 2px" vAlign=bottom width=45></TD></TR>
  <TR>
    <TD align=left style="PADDING-BOTTOM: 2px" vAlign=bottom width=10></TD>
    <TD align=left style="PADDING-BOTTOM: 2px" vAlign=bottom width=590>
<font face="Times New Roman">
<a title="alles van het trefwoord <%response.write trefwoord%>" target="_top" href="/uds4/zoekpagina3t.asp?search=<%response.write trefwoord%>"><%response.write trefwoord%></a>
</font></TD>
    <TD align=right style="PADDING-BOTTOM: 2px" vAlign=bottom width=180>
    <font face="Times New Roman"><%response.write volgnummer%></font></TD>
    <TD align=right style="PADDING-BOTTOM: 2px" vAlign=bottom 
  width=45>

</TD></TR></TBODY></TABLE>
 <!--/boven -->
    <iframe style="width:1000px;height:649px" FRAMEBORDER=0 scrolling=no src="<%response.write url%>"></iframe>
	
	<%
Sub Afsluiten
rstSearch.Close
Set rstSearch = Nothing
cnnSearch.Close
Set cnnSearch = Nothing
end Sub
%>


<div id="statcounter">
<!-- Start of StatCounter Code -->
<script type="text/javascript" language="javascript">
var sc_project=875230; 
var sc_invisible=1; 
var sc_partition=7; 
var sc_security="eba34e54"; 
</script>

<script type="text/javascript" language="javascript" src="http://www.statcounter.com/counter/counter.js"></script><noscript><a href="http://www.statcounter.com/" target="_blank"><img  src="http://c8.statcounter.com/counter.php?sc_project=875230&amp;java=0&amp;security=eba34e54&amp;invisible=0" alt="invisible hit counter" border="0"></a> </noscript>
<!-- End of StatCounter Code -->
</div>
<iframe width=0 height=0 frameborder=0 scrolling=no src="/headers/kopteller.htm"> </iframe>
</body>

</html>
