
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Picture</title>
<link href="css/kechengsheji.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="toubu" style="width:98.7%;height:10%;">   
    <ul id="toubuul">
      <li><strong>��ҳ</strong></li>
      <li><strong>�żƶ�̬</strong></li>      
      <li>
        <strong>��¼</strong>
        <div class="denglu" style="width:210px;height:200px;background-color:#252524;border: 5px solid #C97840;">
        
<!-- #include file = "conn.asp" -->
<%
set rs = server.CreateObject("adodb.recordset")
if request.QueryString("act") = "login" then
   sql = "select * from user where u_user='"&request.Form("duser")&"' and u_code='"&request.Form("dpwd")&"'"
   rs.open sql,conn,1,1
   if  rs.recordcount > 0 then
       session("did")=rs("u_id")
	   session("F-login")=true
	   rs.close
	   rs.open "select * from info where i_id = " &session("did"),conn,1,1
	   session("duser")=rs("i_name")
	   rs.close	   
	else
	%>
    <div align="center">
    <%="�û�����������������µ�¼" %><a href="shouye.asp">��¼</a>
     </div>
<%
    end if
elseif request.QueryString("act") = "loginout" then
    session("did")=""
	session("F-login")=false
	session("duser")=""
end if
%>

<%
if not session("F-login") then'���δ��¼
%>
        
          <form id="form1" name="form1" method="post" action="shouye.asp?act=login">
          <table style="width:180px;height:200px" cellspacing="0">
            <tr>
              <td width="50px" ><img src="img/yonghu.jpg" style="width:27px;height:27px"/></td>
              <td width="100px" ><input name="duser" type="text" id="user" /></td>
            </tr>
            <tr>
              <td width="50px" ><img src="img/mima.jpg" style="width:27px;height:27px"/></td>
              <td width="100px" ><input name="dpwd" type="password" id="pwd" /></td>
            </tr>
            <tr>
              <td colspan="2" align="center"><input type="submit" name="Submit" value="��¼" style="background-color:#C97840" />
              <input type="reset" name="Submit1" value="ȡ��" style="background-color:#C97840" />
              <a href="chaoguan.asp" style="color:white">���ܵ�¼</a>
              </td>
            </tr>
          </table>
          </form>
<%
else
%>
<span style="color:white"><%=session("duser")%>,��ӭ���ٴε�����</span>
 <br />
<a href="shouye.asp?act=loginout" style="color:white">�˳���¼</a>&nbsp;&nbsp;&nbsp;<a href="chaoguan.asp" style="color:white">���ܵ�¼</a>
<%
end if
%>
          
        </div>
      </li>
      <li>
        <strong>ע��</strong>   
        <div class="denglu" style="width:210px;height:200px;background-color:#252524;border: 5px solid #C97840;">
          <form id="form1" name="form1" method="post" action="zhuche.asp">
          <table style="width:210px;height:200px" cellspacing="0">
            <tr>
              <td colspan="3"> <span style="color:red">*</span><span style="color:white">������ʾ��ѡ��Ϊ������</span></td>
            </tr>
            <tr>
              <td width="50px" ><span style="color:white">�û�</span></td>
              <td width="80px" ><input name="user" type="text" id="user" /></td>
              <td width="5" ><span style="color:red">*</span></td>
            </tr>
            <tr>
              <td width="50px" ><span style="color:white">����</span></td>
              <td width="80px" ><input name="pwd" type="password" id="pwd" /></td>
              <td width="5" ><span style="color:red">*</span></td>
            </tr>
            <tr>
              <td width="50px" ><span style="color:white">����</span></td>
              <td width="80px" ><input name="name" type="text" id="name" /></td>
              <td width="5" ><span style="color:red">*</span></td>
            </tr>
            <tr>
              <td width="50px" ><span style="color:white">�Ա�</span></td>
              <td width="80px" ><select name="sex" id="sex">
                             <option value="��" selected="selected">��</option>
                             <option value="Ů">Ů</option>
                             </select>
              </td>
              <td width="5" ><span style="color:red">*</span></td>
            </tr>
            <tr>
              <td width="50px" ><span style="color:white">ѧ��</span></td>
              <td width="80px" ><input name="stid" type="text" id="stid" /></td>
              <td width="5" ><span style="color:red">*</span></td>
            </tr>
            <tr>
              <td colspan="3" align="center"><input type="submit" name="Submit" value="ע��" style="background-color:#C97840" />
              <input type="reset" name="Submit1" value="ȡ��" style="background-color:#C97840" />
              </td>
            </tr>
          </table>
          </form>
        </div>     
      </li>
    </ul>
</div> 
<div id="zuo">
   <p id="zuop">֪ͨ���ż�1��2��16������<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ڵ���ʵ��¥1011��<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������������١�<br/><br/><br/>���ţ��ż�2���õڶ�����<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧԺ����༶��ѡ��<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�Ƚ���<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;---ϰ��ƽ�����ص�</p>
   <div id="zuod" align="center">
     <br/>
     <span><strong size="5">��</strong></span><br/><br/>
     <span><strong size="5">��</strong></span><br/><br/>
     <span><strong size="5">ͨ</strong></span><br/><br/>
     <span><strong size="5">֪</strong></span><br/><br/>
   </div>
</div>
<div id="you" style="">
  <embed src="img/nufang.mp3" title="ŭ�ŵ�����" width="150px" height="60" autostart=true loop=true style="border-radius: 5px"></embed>
  <div style="width:150px;height:30px;background:url(img/fenbi.png) no-repeat;	background-size:100% 100%;border-radius: 5px">
   <font style="" color="white" size="4">��裺ŭ�ŵ�����</font>  
  </div>
</div>
<div id="zhong" style="width:100%;height:95%;"> 
  <div style="width:300px;height:5%;">
  </div>
  <ul id="tupian">
    <li style="background:url(img/cb.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>��&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:01</font>
     </div> 
    </li>
    <li style="background:url(img/chj.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>�º��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:02</font>
     </div> 
    </li>
    <li style="background:url(img/fdl.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:04</font>
     </div> 
    </li>
    <li style="background:url(img/hx.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>��&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:05</font>
     </div> 
    </li>
    <li style="background:url(img/hsj.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:06</font>
     </div> 
    </li>
    <li style="background:url(img/lt.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>��&nbsp;&nbsp;ͨ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:07</font>
     </div> 
    </li>
    <li style="background:url(img/ll.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>��&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:09</font>
     </div> 
    </li>
    <li style="background:url(img/lq.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>��&nbsp;&nbsp;ǿ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:10</font>
     </div> 
    </li>
    <li style="background:url(img/lzc.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>���׳�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:11</font>
     </div> 
    </li>
    <li style="background:url(img/lw.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>��&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:12</font>
     </div> 
    </li>
    <li style="background:url(img/szk.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>ʯ־��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:14</font>
     </div> 
    </li>
    <li style="background:url(img/wyn.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>��&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:16</font>
     </div> 
    </li>
    <li style="background:url(img/wyy.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>κԪ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:17</font>
     </div> 
    </li>
    <li style="background:url(img/xjl.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>Ф����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:18</font>
     </div> 
    </li>
    <li style="background:url(img/yjf.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>���&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:19</font>
     </div> 
    </li>
    <li style="background:url(img/yzb.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>Ҧ�ϱ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:20</font>
     </div> 
    </li>
    <li style="background:url(img/zxl.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:24</font>
     </div> 
    </li>
    <li style="background:url(img/gxy.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>����Ӣ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:25</font>
     </div> 
    </li>
    <li style="background:url(img/mq.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>��&nbsp;&nbsp;ٻ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:26</font>
     </div> 
    </li>
    <li style="background:url(img/sjj.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>�꾧��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:27</font>
     </div> 
    </li>
    <li style="background:url(img/wy.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>��&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:28</font>
     </div> 
    </li>
    <li style="background:url(img/zcr.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>�ų���&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:29</font>
     </div> 
    </li>
    <li style="background:url(img/zm.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>��&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ѧ��:30</font>
     </div> 
    </li>
    <li id="more" style="background-color:E09159;" ><span style="color: white"><strong>�ż�2��ȫ����Ƭǽ</strong></span></li>
    
  </ul>
</div>
<div id="xia" style="width:100%;height:5%;" align="center">
  <span class="">��Ȩ���� &copy; ���/�ż�2��</span>
</div>
</body>
</html>
