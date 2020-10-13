<%
'normal usage: include this file using 'include virtual'

' to test enable following 2 lines and call /scripts/TrefwoordByObjectNr.asp?objectnr=Ob6478n
' objectnr = Request.QueryString("objectnr")
' response.write(TrefwoordByObjectNr(objectnr))

function TrefwoordByObjectNr(objectnr)
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

  if not rstSearch.EOF then
    Dim aResults
    aResults = rstSearch.GetRows
    trefwoord=aResults(1,0) 
  end if

  TrefwoordByObjectNr = trefwoord

  rstSearch.Close
  Set rstSearch = Nothing
  cnnSearch.Close
  Set cnnSearch = Nothing

end function
%>

