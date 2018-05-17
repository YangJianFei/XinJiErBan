<%
set conn = server.CreateObject("adodb.connection")
conn.open "DRIVER=Microsoft Access Driver (*.mdb, *.accdb);UID=admin;PWD=;DBQ="&server.MapPath("temp.accdb")
%>