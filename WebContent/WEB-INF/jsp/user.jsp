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
    <form action="fd_m" method="post" class="bs-example bs-example-form" role="form">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="input-group">
                            <input name="no" type="text" class="form-control">
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
        <caption>用户信息</caption>
        <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Url</th>
            <th>Option</th>
        </tr>
        </thead>
        <tbody>
            <%
            ArrayList<PlayList> pl = (ArrayList<PlayList>)request.getAttribute("pl");
        	if(pl != null){
        	for(int i = 0;i<pl.size();i++){
        		out.print("<tr>");
        		out.print("<td>"+pl.get(i).getId()+"</td>");
        		out.print("<td style=\"width:350px;padding-right:30px;\">"+pl.get(i).getListname()+"</td>");
        		out.print("<td>"+pl.get(i).getUrl()+"</td>");
        		out.print("<td><a href=\"de_m?no="+pl.get(i).getId()+"\" class=\"btn-danger btn\">删除</a></td>");
        		out.print("</tr>");
        	}
        	}else{
        		PlayList pll = (PlayList)request.getAttribute("plt");
        		if(pll!=null){
        		out.print("<tr>");
        		out.print("<td>"+pll.getId()+"</td>");
        		out.print("<td style=\"width:350px;padding-right:30px;\">"+pll.getListname()+"</td>");
        		out.print("<td>"+pll.getUrl()+"</td>");
        		out.print("<td><a href=\"de_m?no="+pll.getId()+"\" class=\"btn-danger btn\">删除</a></td>");
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