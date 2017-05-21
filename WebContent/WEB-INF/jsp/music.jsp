<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.easeMusic.model.*" %>
<%@ page import="java.util.ArrayList" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="../css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link rel="icon" href="../image/icon.png">
    <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
<div style="padding-top: 20px;padding-left: 10px;">
    <form action="fd_mm" method="post" class="bs-example bs-example-form" role="form">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="input-group">
                            <input name ="no" type="text" class="form-control">
                            <span class="input-group-btn">
                                 <input class="btn btn-default" type="submit" value="查找" />
                            </span>
                    </div><!-- /input-group -->
            </div><!-- /.col-lg-6 -->
        </div><!-- /.row -->
    </form>
</div>
<div class=""  style="padding-top: 20px;padding-left: 10px;">
    <table class="table table-hover">
        <caption>音乐信息</caption>
        <thead>
        <tr>
            <th>IDNO</th>
            <th>Name</th>
            <th>PlayUrl</th>
            <th>DownloadUrl</th>
            <th>Singer</th>
            <th>Option</th>
        </tr>
        </thead>
        <tbody>
        <%
        	ArrayList<Music> music = (ArrayList<Music>)request.getAttribute("Music");
        if(music != null){
        	for(int i = 0;i<music.size();i++){
        		out.print("<tr>");
        		out.print("<td>"+music.get(i).getIdno()+"</td>");
        		out.print("<td style=\"width:350px;padding-right:30px;\">"+music.get(i).getName()+"</td>");
        		out.print("<td><a href=\""+music.get(i).getUrl1()+"\">在线播放地址</a></td>");
        		out.print("<td><a href=\""+music.get(i).getUrl2()+"\">下载地址</a></td>");
        		out.print("<td>"+music.get(i).getSongSinger()+"</td>");
        		out.print("<td><a href=\"de_mm?no="+music.get(i).getIdno()+"\" class=\"btn-danger btn\">删除</a></td>");
        		out.print("</tr>");
        	}
        }else{
        	Music pll = (Music)request.getAttribute("plt");
    		if(pll!=null){
    			out.print("<tr>");
        		out.print("<td>"+pll.getIdno()+"</td>");
        		out.print("<td style=\"width:350px;padding-right:30px;\">"+pll.getName()+"</td>");
        		out.print("<td><a href=\""+pll.getUrl1()+"\">在线播放地址</a></td>");
        		out.print("<td><a href=\""+pll.getUrl2()+"\">下载地址</a></td>");
        		out.print("<td>"+pll.getSongSinger()+"</td>");
        		out.print("<td><a href=\"de_mm?no="+pll.getIdno()+"\" class=\"btn-danger btn\">删除</a></td>");
        		out.print("</tr>");
    		}
    }
        %>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>