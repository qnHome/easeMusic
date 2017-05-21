<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
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
    <style>
        #login{
            position: fixed;
            width: 40%;
            height: 50%;
            background: white;
            top:25%;
            left: 30%;
            border-radius: 5px;
        }
    </style>
</head>
<body style="background: rgba(0,0,0,0.81)">
    <div id="login">
                    <div style="padding: 80px 100px 10px;">
                        <form class="bs-example bs-example-form" role="form">
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input type="text" class="form-control" placeholder="admin" id="name">
                            </div><br>
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <input type="password" class="form-control" placeholder="password" id="password">
                            </div><br>
                            <button type="button" class="btn btn-primary btn-lg btn-block" id="btn">Login In</button>
                        </form>
                    </div>

    </div>
    <script>
        $(function () {
            $("#btn").click(function () {
                var user=$("#name").val();
                var pass=$("#password").val();
                if(user==""||pass==""){
                    alert("您是不是忘记了一项")
                    return;
                }
                if(user=="admin"&&pass=="admin"){
                    $(window).attr('location','../Home/');
                }
                else{
                    alert("\n\n请重新输入\n\n【用户："+user+"和密码："+pass+"】\n\n错误\n\n")
                }
            })
        })
    </script>
</body>
</html>