<%if (!val("robot")){%>
<form name="ankieta" method="post" action="<%val("rooturl")%>">
<input type="hidden" name="act" value="save"/>
<input type="hidden" name="id" value="<%val("item.name")%>"/>
<input class="none" type="text" name="test"/>

<fieldset><legend>Wpisz swoje Imię i życzenia</legend>
<table style="display:inline-block">
<t:list property="item" id="f" value="v">
<tr><td style="width:10%"><%val("txt.db.ankieta.".$f,$f)%></td><td>
<%if($f=="value"){%>
<textarea name="item[<%$f%>]" rows="10"><%$v%></textarea>
<%}else{%>
<input name="item[<%$f%>]" value="<%$v%>">
<%}%>
</td></tr>
</t:list>
<tr><td colspan="2" align="right">
<input type="submit" value="<%val("txt.save","Save")%>"/>
<input type="button" value="<%val("txt.cancel","Cancel")%>" onclick="window.location.href='<%val("rooturl")%>';"/>
</td></tr></table>
</fieldset>
</form>
<table class="db"><caption>specjalne kody:</caption>
 <tr><td>[url=adres]opis[/url]</td><td>umieszcza klikalny link do podanej strony www</td></tr>
 <tr><td>[img]adres[/img]</td><td>umieszcza obrazek o podanym adresie</td></tr>
</table>
<%}%>
