<div class="abs"><div class="sysmsg" id="sysmsg">
<%if(val("error")||val("warn")||val("info")){%>
<fieldset><legend>System message</legend><table>
<%if(val("error")){%>
<tr><td><t:list class="error" property="error" value="li" enclose="ul"><li><pre><%$li%></pre></li></t:list></td></tr>
<%}%>
<%if(val("warn")){%>
<tr><td><t:list class="warn" property="warn" value="li" enclose="ul"><li><%$li%></li></t:list></td></tr>
<%}%>
<%if(val("info")){%>
<tr><td><t:list class="info" property="info" value="li" enclose="ul"><li><%$li%></li></t:list></td></tr>
<%}%>
<tr><td align="right"><input type="submit" value="Ok" onClick="$('sysmsg').toggle()"/></td></tr>
</table>
</fieldset><%}%>
</div></div>
