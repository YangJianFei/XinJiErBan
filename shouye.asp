
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Picture</title>
<link href="css/kechengsheji.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="toubu" style="width:98.7%;height:10%;">   
    <ul id="toubuul">
      <li><strong>首页</strong></li>
      <li><strong>信计动态</strong></li>      
      <li>
        <strong>登录</strong>
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
    <%="用户名和密码出错，请重新登录" %><a href="shouye.asp">登录</a>
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
if not session("F-login") then'如果未登录
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
              <td colspan="2" align="center"><input type="submit" name="Submit" value="登录" style="background-color:#C97840" />
              <input type="reset" name="Submit1" value="取消" style="background-color:#C97840" />
              <a href="chaoguan.asp" style="color:white">超管登录</a>
              </td>
            </tr>
          </table>
          </form>
<%
else
%>
<span style="color:white"><%=session("duser")%>,欢迎你再次到来！</span>
 <br />
<a href="shouye.asp?act=loginout" style="color:white">退出登录</a>&nbsp;&nbsp;&nbsp;<a href="chaoguan.asp" style="color:white">超管登录</a>
<%
end if
%>
          
        </div>
      </li>
      <li>
        <strong>注册</strong>   
        <div class="denglu" style="width:210px;height:200px;background-color:#252524;border: 5px solid #C97840;">
          <form id="form1" name="form1" method="post" action="zhuche.asp">
          <table style="width:210px;height:200px" cellspacing="0">
            <tr>
              <td colspan="3"> <span style="color:red">*</span><span style="color:white">号所标示的选项为必填项</span></td>
            </tr>
            <tr>
              <td width="50px" ><span style="color:white">用户</span></td>
              <td width="80px" ><input name="user" type="text" id="user" /></td>
              <td width="5" ><span style="color:red">*</span></td>
            </tr>
            <tr>
              <td width="50px" ><span style="color:white">密码</span></td>
              <td width="80px" ><input name="pwd" type="password" id="pwd" /></td>
              <td width="5" ><span style="color:red">*</span></td>
            </tr>
            <tr>
              <td width="50px" ><span style="color:white">姓名</span></td>
              <td width="80px" ><input name="name" type="text" id="name" /></td>
              <td width="5" ><span style="color:red">*</span></td>
            </tr>
            <tr>
              <td width="50px" ><span style="color:white">性别</span></td>
              <td width="80px" ><select name="sex" id="sex">
                             <option value="男" selected="selected">男</option>
                             <option value="女">女</option>
                             </select>
              </td>
              <td width="5" ><span style="color:red">*</span></td>
            </tr>
            <tr>
              <td width="50px" ><span style="color:white">学号</span></td>
              <td width="80px" ><input name="stid" type="text" id="stid" /></td>
              <td width="5" ><span style="color:red">*</span></td>
            </tr>
            <tr>
              <td colspan="3" align="center"><input type="submit" name="Submit" value="注册" style="background-color:#C97840" />
              <input type="reset" name="Submit1" value="取消" style="background-color:#C97840" />
              </td>
            </tr>
          </table>
          </form>
        </div>     
      </li>
    </ul>
</div> 
<div id="zuo">
   <p id="zuop">通知：信计1、2班16周周六<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在第三实验楼1011上<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机。有事请请假。<br/><br/><br/>新闻：信计2班获得第二届理<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学院优秀班级评选三<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;等奖。<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;---习近平发来贺电</p>
   <div id="zuod" align="center">
     <br/>
     <span><strong size="5">新</strong></span><br/><br/>
     <span><strong size="5">闻</strong></span><br/><br/>
     <span><strong size="5">通</strong></span><br/><br/>
     <span><strong size="5">知</strong></span><br/><br/>
   </div>
</div>
<div id="you" style="">
  <embed src="img/nufang.mp3" title="怒放的生命" width="150px" height="60" autostart=true loop=true style="border-radius: 5px"></embed>
  <div style="width:150px;height:30px;background:url(img/fenbi.png) no-repeat;	background-size:100% 100%;border-radius: 5px">
   <font style="" color="white" size="4">班歌：怒放的生命</font>  
  </div>
</div>
<div id="zhong" style="width:100%;height:95%;"> 
  <div style="width:300px;height:5%;">
  </div>
  <ul id="tupian">
    <li style="background:url(img/cb.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>陈&nbsp;&nbsp;斌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:01</font>
     </div> 
    </li>
    <li style="background:url(img/chj.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>陈虹君&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:02</font>
     </div> 
    </li>
    <li style="background:url(img/fdl.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>傅登林&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:04</font>
     </div> 
    </li>
    <li style="background:url(img/hx.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>何&nbsp;&nbsp;鑫&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:05</font>
     </div> 
    </li>
    <li style="background:url(img/hsj.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>黄世杰&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:06</font>
     </div> 
    </li>
    <li style="background:url(img/lt.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>雷&nbsp;&nbsp;通&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:07</font>
     </div> 
    </li>
    <li style="background:url(img/ll.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>李&nbsp;&nbsp;黎&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:09</font>
     </div> 
    </li>
    <li style="background:url(img/lq.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>李&nbsp;&nbsp;强&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:10</font>
     </div> 
    </li>
    <li style="background:url(img/lzc.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>李兆成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:11</font>
     </div> 
    </li>
    <li style="background:url(img/lw.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>刘&nbsp;&nbsp;威&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:12</font>
     </div> 
    </li>
    <li style="background:url(img/szk.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>石志康&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:14</font>
     </div> 
    </li>
    <li style="background:url(img/wyn.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>王&nbsp;&nbsp;瑶&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:16</font>
     </div> 
    </li>
    <li style="background:url(img/wyy.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>魏元勇&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:17</font>
     </div> 
    </li>
    <li style="background:url(img/xjl.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>肖金龙&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:18</font>
     </div> 
    </li>
    <li style="background:url(img/yjf.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>杨剑飞&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:19</font>
     </div> 
    </li>
    <li style="background:url(img/yzb.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>姚紫斌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:20</font>
     </div> 
    </li>
    <li style="background:url(img/zxl.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>曾宣霖&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:24</font>
     </div> 
    </li>
    <li style="background:url(img/gxy.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>谷秀英&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:25</font>
     </div> 
    </li>
    <li style="background:url(img/mq.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>马&nbsp;&nbsp;倩&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:26</font>
     </div> 
    </li>
    <li style="background:url(img/sjj.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>申晶晶&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:27</font>
     </div> 
    </li>
    <li style="background:url(img/wy.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>文&nbsp;&nbsp;瑶&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:28</font>
     </div> 
    </li>
    <li style="background:url(img/zcr.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>张崇荣&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:29</font>
     </div> 
    </li>
    <li style="background:url(img/zm.png) no-repeat;	background-size:100% 100%;"> 
     <div id="wanshou" class="name">
      <font>周&nbsp;&nbsp;敏&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:30</font>
     </div> 
    </li>
    <li id="more" style="background-color:E09159;" ><span style="color: white"><strong>信计2班全体照片墙</strong></span></li>
    
  </ul>
</div>
<div id="xia" style="width:100%;height:5%;" align="center">
  <span class="">版权所有 &copy; 杨剑飞/信计2班</span>
</div>
</body>
</html>
