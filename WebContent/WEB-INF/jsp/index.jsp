<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.easeMusic.model.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.easeMusic.model.Music" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/init.css">
    <link rel="icon" href="image/icon.png">
    <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/my.js" type="text/javascript"></script>
    <title>EaseMusic</title>
    <style type="text/css">
    .acolor{
    	color:#8C8C8C;
    }
    .tcolor{
    	color:#000;
    }
    </style>
</head>
<body>
<!--导航栏-->
<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="background: #1a1a1a;margin-bottom: 0">
    <div class="container-fluid ">
            <div class="row">
                <div class="col-lg-4 col-sm-4 col-xs-4">
                        <div class="navbar-header ">
                            <a class="navbar-brand visible-lg visible-md visible-sm" href="#" style="color: white">Ease Music</a>
                            <a class="navbar-brand visible-xs" href="#" style="color: white;font-size: inherit">Ease </a>
                        </div>
                </div>
                <div class="col-lg-8 col-sm-8 col-xs-8">
                            <ul class="nav navbar-nav navbar-right visible-lg visible-md visible-sm">
                                <%
                                User user = (User)request.getSession().getAttribute("User");
                                if(user!=null){
                                	String u = (String)user.getName();
                                System.out.println(u);
                                	if(!u.isEmpty()){
                                		out.print(" <li><a href=\"#\" style=\"color: white\"><span class=\"glyphicon glyphicon-log-in \"  ></span> "+u+"</a> </li>");
                                	}
                                }else{
                                	out.print("<li><a href=\"#\" style=\"color: white\"  data-toggle=\"modal\" data-target=\"#myModal01\"><span class=\"glyphicon glyphicon-user \" ></span> 注册</a></li>");
                                	out.print("<li><a href=\"#\" style=\"color: white\" data-toggle=\"modal\" data-target=\"#myModal02\"><span class=\"glyphicon glyphicon-log-in \"  ></span> 登录</a> </li>");
                                }
                                %>
                                   	
                            </ul>
                    <div class="navbar-header navbar-right visible-xs">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
                            <span class="sr-only">切换导航</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse hidden-lg hidden-md hidden-sm" id="example-navbar-collapse">
                        <ul class="nav navbar-nav hidden-lg hidden-md hidden-sm">
                            <li ><a href="#" style="color: white" data-toggle="modal" data-target="#myModal01"><span class="glyphicon glyphicon-user "></span> 注册</a></li>
                            <li><a href="#" style="color: white" data-toggle="modal" data-target="#myModal02"><span class="glyphicon glyphicon-log-in "  ></span> 登录</a></li>
                        </ul>
                    </div>
                </div>
            </div>
    </div>
</nav>
<!--轮播图片-->
<div id="myCarousel" class="carousel slide">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner ">
            <div class="item active col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
                <img src="image/test.jpg"  alt="First slide" class="img-responsive">
            </div>
            <div class="item col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
                <img src="image/test.jpg"  alt="Second slide" class="img-responsive">
            </div>
            <div class="item col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
                <img src="image/test.jpg"  alt="Third slide" class="img-responsive">
            </div>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
    <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
</div>

<!--主要内容-->
    <div id="content" style="margin-top: 2rem">
        <div class="row">
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                    <!--音乐栏目-->
                    <div class="music">
                        <span class="label label-default ">热门音乐</span>
                        <span class="label  pull-right"><button class="more" style="border:0px; color: #000;">更多</button></span>
                        <hr style="margin-top: 0">
                        <!--大屏幕可见-->
                        <div class="row visible-sm visible-md visible-lg ">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                                    <div class="row before" >
                                        <ul>
                                        <%
                                    	ArrayList<Music> music = (ArrayList<Music>)request.getSession().getAttribute("Music");
                                    	if(music != null){
                                    	for(int i = 0;i<3;i++){
                                    		
                                    		out.print("<div class=\"col-md-4\" align=\"center\" style=\" margin-top: 8px;width:33%;height:60px;font-size: 12px;\">");
                                        	out.print("<li class=\"ulCreate\">");
                                        	out.print("<a class=\"acolor\" href=\""+music.get(i).getUrl2()+"\" >");
                                    		out.print(" <span class=\"glyphicon glyphicon-download-alt\"></span>");
                                    		out.print("</a>&nbsp;&nbsp;");
                                        	out.print("<a class=\"tcolor\" href=\""+music.get(i).getUrl1()+"\" >");
                                        	out.print(music.get(i).getName());
                                        	out.print("</a>&nbsp;&nbsp");
                                        	out.print("<span class=\"glyphicon 	glyphicon glyphicon-play\" onclick=\"play("+music.get(i).getIdno()+")\"></span><br/>");
                                        	out.print("--"+music.get(i).getSongSinger()+"--");
                                        	out.print("</li>");
                                        	out.print("</div>");
                                        	}
                                    %>
                                        
                                        </ul>
                                        <hr style="margin-top: 0">
                                    </div>
                                <div class="row after">
                                    <ul class="after">
                                    <%
                                    	for(int i = 3;i<21;i++){
                                    		
                                			out.print("<div class=\"col-md-4\" style=\"border-top:1px dashed #8c8c8c; padding-top: 10px;width:33%;height:80px;font-size: 12px;\">");
                                    		out.print("<li class=\"ulCreate\">");
                                    		out.print("<a class=\"acolor\" href=\""+music.get(i).getUrl2()+"\" >");
                                    		out.print(" <span class=\"glyphicon glyphicon-download-alt\"></span>");
                                    		out.print("</a>&nbsp;&nbsp;");
                                    		out.print("<a class=\"tcolor\" href=\""+music.get(i).getUrl1()+"\" >");
                                    		out.print(music.get(i).getName());
                                    		out.print("</a>&nbsp;&nbsp");
                                        	out.print("<span class=\"glyphicon 	glyphicon glyphicon-play\" onclick=\"play("+music.get(i).getIdno()+")\"></span><br/>");
                                    		out.print("--"+music.get(i).getSongSinger()+"--");
                                    		out.print("</li>");
                                    		out.print("</div>");
                                    	}
                                    }
                                    %>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            </div>
                        </div>
                        <!--小屏幕可见-->
                        <div class="table-responsive visible-xs">
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                    <th>歌曲名</th>
                                                    <th>歌手</th>
                                                    <th>时间</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>匆匆那年</td>
                                                    <td>王菲</td>
                                                    <td>04:31</td>
                                                </tr>
                                                <tr>
                                                    <td>匆匆那年</td>
                                                    <td>王菲</td>
                                                    <td>04:31</td>
                                                </tr>
                                                <tr>
                                                    <td>匆匆那年</td>
                                                    <td>王菲</td>
                                                    <td>04:31</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                    </div>
                    </div>
                    <!--电台栏目-->
                    <div class="broadcast">
                        <span class="label label-default">热门歌单</span>
                        <span class="label  pull-right"><button class="more1" style="border:0px; color: #000;">更多</button></span>
                        <hr style="margin-top: 0">
                        <!--大屏幕可见-->
                        <div class="row visible-sm visible-md visible-lg ">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                                <div class="row before">
                                    <ul>
                                         <%
                                    	ArrayList<PlayList> pl = (ArrayList<PlayList>)request.getSession().getAttribute("pl");
                                    	if(pl != null){
                                    	for(int i = 0;i<3;i++){
                                    		
                                    		out.print("<div class=\"col-md-4\" align=\"center\" style=\" margin-top: 8px;width:33%;height:60px;\">");
                                        	out.print("<li class=\"ulCreate\">");
                                        	out.print("<a class=\"tcolor\" href=\""+pl.get(i).getUrl()+"\" >");
                                        	out.print(pl.get(i).getListname());
                                        	out.print("</a>");
                                        	out.print("</li>");
                                        	out.print("</div>");
                                        	}
                                    %>
                                    
                                    </ul>
                                </div>
                                <div class="row after1">
                                    <ul class="after1">
                                        <%
                                    	for(int i = 3;i<15;i++){
                                    		
                                			out.print("<div class=\"col-md-4\" style=\"border-top:1px dashed #8c8c8c; padding-top: 10px;width:33%;height:80px;\">");
                                    		out.print("<li class=\"ulCreate\">");
                                    		out.print("<a class=\"tcolor\" href=\""+pl.get(i).getUrl()+"\" >");
                                    		out.print(pl.get(i).getListname());
                                    		out.print("</a>");
                                    		out.print("</li>");
                                    		out.print("</div>");
                                    	}
                                    }
                                    %>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            </div>
                        </div>
                        <!--小屏幕可见-->
                        <div class="table-responsive visible-xs">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>歌曲名</th>
                                    <th>歌手</th>
                                    <th>时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>匆匆那年</td>
                                    <td>王菲</td>
                                    <td>04:31</td>
                                </tr>
                                <tr>
                                    <td>匆匆那年</td>
                                    <td>王菲</td>
                                    <td>04:31</td>
                                </tr>
                                <tr>
                                    <td>匆匆那年</td>
                                    <td>王菲</td>
                                    <td>04:31</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--热评栏目-->
                    <div class="comment">
                        <span class="label label-default">热门电台</span>
                        <span class="label  pull-right"><button class="more2" style="border:0px; color: #000;">更多</button></span>
                        <hr style="margin-top: 0">
                        <!--大屏幕可见-->
                        <div class="row visible-sm visible-md visible-lg ">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                                <div class="row before">
                                    <ul>
                                    	<%
                                    	ArrayList<Radio> rd = (ArrayList<Radio>)request.getSession().getAttribute("rd");
                                    	if(music != null){
                                    	for(int i = 0;i<3;i++){
                                    		
                                    		out.print("<div class=\"col-md-4\" align=\"center\" style=\" margin-top: 8px;width:33%;height:60px;\">");
                                        	out.print("<li class=\"ulCreate\">");
                                        	out.print("<a class=\"tcolor\" href=\""+rd.get(i).getUrl()+"\" >");
                                        	out.print(rd.get(i).getRadioName());
                                        	out.print("</a><br/>");
                                        	out.print("--"+rd.get(i).getRadioer()+"--");
                                        	out.print("</li>");
                                        	out.print("</div>");
                                        	}
                                    %>
                                    </ul>
                                </div>
                                <div class="row after2">
                                    <ul class="after2">
                                        <%
                                    	for(int i = 3;i<15;i++){
                                    		
                                			out.print("<div class=\"col-md-4\" style=\"border-top:1px dashed #8c8c8c; padding-top: 10px;width:33%;height:80px;\">");
                                    		out.print("<li class=\"ulCreate\">");
                                    		out.print("<a class=\"tcolor\" href=\""+rd.get(i).getUrl()+"\" >");
                                    		out.print(rd.get(i).getRadioName());
                                        	out.print("</a><br/>");
                                        	out.print("--"+rd.get(i).getRadioer()+"");
                                    		out.print("</li>");
                                    		out.print("</div>");
                                    	}
                                    }
                                    %>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            </div>
                        </div>
                        <!--小屏幕可见-->
                        <div class="table-responsive visible-xs">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>歌曲名</th>
                                    <th>歌手</th>
                                    <th>时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>匆匆那年</td>
                                    <td>王菲</td>
                                    <td>04:31</td>
                                </tr>
                                <tr>
                                    <td>匆匆那年</td>
                                    <td>王菲</td>
                                    <td>04:31</td>
                                </tr>
                                <tr>
                                    <td>匆匆那年</td>
                                    <td>王菲</td>
                                    <td>04:31</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
        </div>
    </div>

    <!--注册模态框-->
<div class="modal fade" id="myModal01" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel1">
                    用户注册
                </h4>
            </div>
            <div class="modal-body" style="padding: 50px;">
                <form class="bs-example bs-example-form" role="form" id="sign">
                    <div class="input-group">
                        <span class="input-group-addon "><i class="glyphicon glyphicon-user"></i></span>
                        <input type="text" class="form-control" placeholder="输入用户名" name="username" id="username">
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-paperclip"></i></span>
                        <input type="text" class="form-control" placeholder="输入密码" name="password" id="password">
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input type="text" class="form-control" placeholder="输入邮箱" name="mail" id="mail">
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span>
                        <input type="text" class="form-control" placeholder="输入电话" name="number" id="number">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消
                </button>
                <button type="button" class="btn btn-primary" id="signbtn">
                    注册
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
    <!--登陆模态框-->
<div class="modal fade" id="myModal02" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    用户登录
                </h4>
            </div>
            <div class="modal-body" style="padding: 50px;">
                <form name="login" class="bs-example bs-example-form" role="form" id="login">
                    <div class="input-group">
                        <span class="input-group-addon "><i class="glyphicon glyphicon-user"></i></span>
                        <input type="text" class="form-control" name="u" placeholder="输入用户名">
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-paperclip"></i></span>
                        <input type="text" class="form-control" name="p" placeholder="输入密码">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消
                </button>
                <button type="button" class="btn btn-primary" id="loginbtn">
                    登录
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div style="height:86px；margin-top:150px">
<br/><br/><br/><br/>
</div>
<iframe id="frame" frameborder="no" border="0" marginwidth="0" marginheight="0" width=100% height=86 src="" style="position: fixed;bottom: 0;"></iframe>
<script>
function play(id) {
    var id=document.getElementById("frame").src="//music.163.com/outchain/player?type=2&id="+id+"&auto=1&height=66";
 }
    $(function () {
        $("#myCarousel").carousel('next');
    })
</script>
</body>
</html>