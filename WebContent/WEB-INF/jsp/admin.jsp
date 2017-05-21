<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="../css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="../css/init.css">
    <link rel="icon" href="../image/icon.png">
    <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../js/my.js" type="text/javascript"></script>
    <style>
        *{
            overflow-y: hidden;
        }
    </style>
    <title>EaseMusic控制台</title>
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
                    <li><a href="#" style="color: white"  data-toggle="modal" data-target="#myModal01"><span class="glyphicon glyphicon-remove-circle " ></span> 退出</a></li>
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
                        <li ><a href="#" style="color: white" data-toggle="modal" data-target="#myModal01"><span class="glyphicon glyphicon-remove-circle "></span> 退出</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>
<!--主要内容-->
<div class="content">
    <div class="row">
                <div class="col-md-2 col-md-2 col-lg-2" style="padding-right: 0;margin-top: 50px">
                    <ul class="list-group " style="border: 1px solid white;">
                        <span class=" list-group-item disable" target="frame" style="background: black;color: white">菜单</span>
                        <a href="user" class=" list-group-item" target="frame">歌单管理</a>
                        <a href="music" class=" list-group-item" target="frame">音乐管理</a>
                        <a href="radio" class=" list-group-item" target="frame">电台管理</a>
                        <a href="updata" class=" list-group-item" target="frame">更新数据</a>
                    </ul>
        </div>
        <div class="col-md-10 col-md-10 col-lg-10" style="padding-left: 0;margin-top: 50px">
            <iframe width="100%" height="750px" name="frame" id="frame" frameborder="0" src="user"scrolling="yes" style="border: none"></iframe>
        </div>
    </div>
</div>
</body>
</html>