
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>超级管理</title>
<style type="text/css">
<!--
body {
margin-top: 0px;
margin-bottom: 0px;
background-image: url();
background-repeat: no-repeat;
}

-->
</style></head>
<body style="background-color:#C97840">
<table width="800" height="442" border="0" align="center" cellspacing="0" style="background-color:#C97840">
<tr>
<td height="442" align="center" valign="top" background="img/zybeijing.jpg" bgcolor="#FFFFFF"><table width="800" height="442" border="0" cellspacing="0" style="background-color:#C97840">
<tr>
<td width="229" height="69">　</td>
<td width="359">　</td>
<td width="206">　</td>
</tr>
<tr>
<td height="68">　</td>
<td align="left" valign="middle">&nbsp;</td>
<td>　</td>
</tr>
<tr>
<td height="238">　</td>

<td align="center" valign="middle" background="">
<!-- #include file = "conn.asp" -->
<%
set rs = server.CreateObject("adodb.recordset")
if request.QueryString("act") = "login" then
   sql = "select * from user where u_user='"&request.Form("f_user")&"' and u_code='"&request.Form("f_code")&"'"
   rs.open sql,conn,1,1
   if  rs.recordcount > 0 then
       session("user")=rs("u_id")
	   session("flag_login")=true
	   rs.close
	   rs.open "select * from info where i_id = " &session("user"),conn,1,1
	   session("name")=rs("i_name")
	   rs.close
	else
	%>
    <div align="center">
    <%="用户名和密码出错，请重新登录" %><a href="register.asp">注册</a>
     </div>
<%
    end if
elseif request.QueryString("act") = "loginout" then
    session("user")=""
	session("flag_login")=false
	session("name")=""
end if
%>

<%
if not session("flag_login") then'如果未登录
%>
<form id="form1" name="form1" method="post" action="chaoguan.asp?act=login">
用户名：
<input name="f_user" type="text" id="f_user" />
<br />
密&nbsp; 码：
<input name="f_code" type="password" id="f_code" />
<br />
<input type="submit" name="Submit" value="登录" />
</form>
<%
else
%>
<%=session("name")%>,欢迎你再次到来！
 <br />
 <a href="chaoguan.asp?act=loginout">退出登录</a>
<a href="shouye.asp">回到首页</a></td>
<%
end if
%>
<td>　</td>
</tr>
<tr>
<td height="28">　</td>
<td>　</td>
<td>　</td>
</tr>
<tr>
<td height="26" colspan="3" align="right" valign="bottom" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-style: dotted; border-bottom-width: 1px" bordercolor="#FFFFFF">　</td>
</tr>
</table></td>
</tr>
</table>
<table width="800" height="687" border="0" align="center" cellspacing="0" style="background-color:#C97840">
<tr>
<td height="687" align="center" valign="top" background="img/zcym1.jpg" bgcolor="#FFFFFF"><table width="800" height="687" border="0" cellspacing="0" style="background-color:#C97840">
<tr>
<td width="84" height="225">　</td>
<td width="670">　</td>
<td width="40">　</td>
</tr>
<tr>
<td height="358">　</td>
<td align="center" valign="middle">　
<%
    if session("flag_login")=false then
%>
您还没有登录，不能查看会员功能！<br />
<%
    else
	response.Write("欢迎您，" &session("name") &"!") 
%>

会员数据表如下：<br/>
<%
    set rs = server.CreateObject("adodb.recordset")
    on error resume next
    if request.QueryString("act") = "del" then
	    conn.begintrans
		'conn.execute "delete from user where u_id=" & request.QueryString("id")
		'conn.execute "delete from info where i_id=" & request.QueryString("id")
		rs.open "select * from user where u_id=" & request.QueryString("id"),conn,1,3
		rs.delete
		rs.close
		rs.open "select * from info where i_id=" & request.QueryString("id"),conn,1,3
		rs.delete
		rs.close
		if err.number <>0 then
		    response.write("删除失败")
			conn.rollbacktrans
		else
		    response.Write("删除成功")
			conn.committrans
		end if
	end if
	
%>
<table width="95%" border="1" cellspacing="0" cellpadding="2" style="background-color:#C97840">
<tr>
<td width="8%" align="center">ID</td>
<td width="18%" align="center">用户名</td>
<td width="16%" align="center">姓名</td>
<td width="7%" align="center">性别</td>
<td width="8%" align="center">年龄</td>
<td width="8%" align="center">会员</td>
<td width="35%" align="center">操作</td>
</tr>
<%
rs.open "select * from user,info where u_id = i_id order by u_id",conn,1,1
while not rs.eof
%>
    <tr>
    <td align="center"><%=rs("u_id")%></td>
    <td align="center"><%=rs("u_user")%></td>
    <td align="center"><%=rs("i_name")%></td>
    <td align="center"><%=rs("i_sex")%></td>
    <td align="center"><%=rs("i_age")%></td>
    <td align="center">
    <% 
     if rs("i_vip") then
         response.Write("是")
     else
         response.Write("否")
     end if
      %>
     </td>
     <td align="center"><a href="chaoguan.asp?act=del&id=<%=rs("u_id")%>">删除</a></td>
      </tr>
<%
    rs.movenext
wend
rs.close
%>
<%
    set rs = nothing
	conn.close
	set conn = nothing
%>
</table>
<%
end if
%> <br /></td>
    <td>　</td>
  </tr>
  <tr>
    <td height="66" colspan="3" align="center" valign="bottom">　</td>
  </tr>
</table></td>
</tr>
</table>
<%
   set rs = nothing
   conn.close
   set conn  =nothing
%>
</body>
</html>