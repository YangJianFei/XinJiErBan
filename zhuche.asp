<!-- #include file = "conn.asp" -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>注册结果</title>
<style type="text/css">
<!-
body {
margin-top: 0px;
margin-bottom: 0px;
background-image: url();
background-repeat: no-repeat;
}
-->
</style></head>
<body>
<% on error resume next %>
<%
set rs = server.CreateObject("adodb.recordset")
rs.open "select * from user where u_user='" & request.form("user") & "'",conn,1,1 
if rs.recordcount>0 then
%>
<div align="center">
<img src="failure.jpg" width="355" height="240" /><br>
<%
    response.Write("用户名" &request.Form("user") &"已经被占用，请后退返回上一页重新输入！")
%>

</div>
<%
	rs.close
	set rs = nothing
	conn.close
	set conn = nothing
	response.End()
else'增加记录的两种方法
    'set rs1 = conn.execute("insert into user (u_user,u_code) values ('" &request.form("f_user") & "','" & request.form("f_code") & "')") 
	rs.close
	conn.begintrans
	rs.open "user",conn,1,3
	
	rs.addnew '插入数据到user表
	rs("u_user")=request.Form("user")
	rs("u_code")=request.Form("pwd")
	rs.update
	rs.close
	'自动编号字段
	set rs1=conn.execute("select @@identity as uid")
	uid=rs1("uid")
	rs.open "info",conn,1,3
	rs.addnew'插入记录到info表
	rs("i_id")=uid
	rs("i_name")=request.Form("name")
	rs("i_sex")=request.Form("sex")
	rs("i_age")=request.Form("stid")
	rs("i_vip")=false
	rs.update
	rs.close
	if err.number<>0 then
	%>
    <div align="center">
    <%
	response.Write("出错信息:" & err.description &"<br>")
	err.clear
	conn.rollbacktrans
	%>
    <img src="failure.jpg" width="355" height="240" /><br>
    <a href="shouye.asp">注册</a>
    </div>
    <% 
	else
	    conn.committrans
	 %>
    <div align="center">
    <img src="success.jpg" width="355" heigt="240" />
    <a href="shouye.asp">登录</a>
    </div>
    <% 
	end if
end if
%>
<%
set rs=nothing
conn.close
set conn=nothing
%>
</body>
</html>
