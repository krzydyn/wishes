<style type="text/css">
.name {max-width:80px;}
.updatetm {width:250px;}
.action {width:auto;text-align:left;}
.xvalue {font-size:13pt;}
</style>

<div class="settings">[
<%if (val("theme")=="dark"){%>
<a href="?theme=bright">bright</a>
<%}else{%>
<a href="?theme=dark">dark</a>
<%}%>
]</div>

<h1>Lista życzeń</h1>
<table class="db" style="table-layout: fixed;">
<tr class="head">
	<th>Imię</th>
	<th>Wpis</th>
</tr>

<t:list property="items" value="row">
<tr class="row<%$rowcnt&1%>">
	<th class="name"><%$row["name"]%></th>
	<td>
	<table style="width:100%">
		<tr>
		<td class="updatetm">
			<% $v=$row["updatetm"];$v=$v?date("Y.n.j",$v):""; %>
			<%if($v){%>
			(zmiana <%$v%>)
			<%}%>
		</td>
		<td class="action">
			<%if(empty($row["name"])){%>
				<a href="?act=edit">dodaj</a>
			<%}else{%>
				<%if(empty($row["value"])){%>
				<a href="?act=del&id=<%$row["name"]%>">usuń</a>
				<%}%>
				<input type="button" value="zmień" onclick="window.location.href='?act=edit&id=<%$row["name"]%>'">
			<%}%>
		</td>
		</tr>
		<tr><td class="xvalue" colspan=2><%$row["value"]%></td> </tr>
	</table>
	</td>
</tr>
</t:list>
</table>
<% $v=val("lastupdate")%>
<table>
<tr><td>Czas ostatniej modyfikacji: <%$v?date("Y/n/j H:i",$v):""%></td></tr>
<tr><td><b>Uwaga:</b> edytując wpis innej osoby można dopytać o szczegóły</td></tr>
</table>

<?
----------
od 1.05.2013 na 24mies:
- plan na kazdy dzien, abo 49brt
- na kom 30 w PL
- na kom 49 w EU
- no limit na stacjonarne w EU, Kanada,USA
- no limit na kom Kan,USA
?>
