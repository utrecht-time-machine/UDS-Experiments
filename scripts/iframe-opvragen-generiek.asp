<!--#include virtual="/scripts/TrefwoordByObjectNr.asp"-->
<%
volgnummer = Request.QueryString("volgnummer")
objectnr = Request.QueryString("objectnr")
trefwoord = Request.QueryString("Trefwoord") ' lees trefwoord indien meegegeven
if objectnr<>"" then trefwoord = TrefwoordByObjectNr(objectnr) ' if objectnr dan vraag trefwoord op
if trefwoord="" then response.end() ' nog steeds geen trefwoord? dan script afbreken

url = Request.ServerVariables("SCRIPT_NAME")
url = Replace(url, "-Knipper.asp", "-links.htm")
url = Replace(url, "-iframe-opvragen.asp", "-links.htm")
url = Replace(url, "Zoekplaat-", "Zplaat")
if objectnr<>"" then url = url & "?objectnr=" & objectnr


%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title><%response.write trefwoord%> _kaart_6 [<%response.write volgnummer%>]</title>
</head>

<body>

    <!-- boven -->
    <TABLE border=0 cellPadding=0 cellSpacing=0 style="border-bottom: #000000 3px double" width=1000>
        <TBODY>
            <TR>
                <TD align=left style="PADDING-BOTTOM: 2px" vAlign=bottom width=10></TD>
                <TD align=left bgColor=#ffffff borderColor=#000000
                    style="BORDER-BOTTOM: 0px groove; BORDER-LEFT: 0px groove; BORDER-RIGHT: 0px groove; BORDER-TOP: 0px groove; PADDING-BOTTOM: 2px"
                    vAlign=bottom width=227 color="#FFFFFF" size="1" face="Arial"></TD>
                <TD align=left rowSpan=2 style="PADDING-BOTTOM: 2px" width=400>
                    <TABLE border=0 cellPadding=0 cellSpacing=0 width=400>
                        <TBODY>
                            <TR>
                                <TD align=right width=152><a href="/" target="_top"><IMG border=0 height=35
                                            src="/images/udslogo.jpg" width=150></a></TD>
                                <TD align=right width=15></TD>
                                <TD width=227><b><font face="Arial" size="3">Kaart 6<br>losse afbeeldingen</font></b></TD>
                            </TR>
                        </TBODY>
                    </TABLE>
                </TD>
                <TD align=right bgColor=white
                    style="BORDER-BOTTOM: 0px groove; BORDER-LEFT: 0px groove; BORDER-RIGHT: 0px groove; BORDER-TOP: 0px groove; PADDING-BOTTOM: 2px"
                    vAlign=bottom width=180>&nbsp;</TD>
                <TD align=right style="PADDING-BOTTOM: 2px" vAlign=bottom width=45></TD>
            </TR>
            <TR>
                <TD align=left style="PADDING-BOTTOM: 2px" vAlign=bottom width=10></TD>
                <TD align=left style="PADDING-BOTTOM: 2px" vAlign=bottom width=590>
                    <font face="Times New Roman">
                     <a id="link" title="link title" target="_top" href="/uds4/zoekpagina3t.asp?search=<%response.write trefwoord%>"><% response.write trefwoord %></a>
                    </font>
                </TD>
                <TD align=right style="PADDING-BOTTOM: 2px" vAlign=bottom width=180>
                    <font face="Times New Roman">
                         <div id="vol"><% response.write volgnummer %></div>
                    </font>
                </TD>
                <TD align=right style="PADDING-BOTTOM: 2px" vAlign=bottom width=45></TD>
            </TR>
        </TBODY>
    </TABLE>
    <!-- /boven -->
  
     <iframe style="width:1000px;height:649px" FRAMEBORDER=0 scrolling=no src="<%response.write url%>"></iframe>

</body>
</html>