<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<%val("req.lang")%>" lang="<%val("req.lang")%>">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
<%if (val("refresh")>0){%>
  <meta http-equiv="refresh" content="<%val("refresh")%>;url=<%val("cfg.rooturl")%>" />
<%}%>
  <meta http-equiv="Content-type" content="text/html;charset=<%val("charset")%>" />
  <title><%val("sitetitle")%></title>
  <link rel="stylesheet" href="style.css" type="text/css" />
  <script type="text/javascript" src="wwwlib/js/prototype.js"></script>
</head>
<body><center>
<%include("sysmsg.tpl")%>
<%include(val("view").".tpl")%>
</center>
</body></html>
