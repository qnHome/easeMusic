/**
 * Created by Tang on 2017/4/26.
 */
$(function () {
    /*前台模块*/
    /*注册*/
    $("#signbtn").click(function () {
        var sign=$("#sign");
        sign.attr("action", "sign");
        sign.attr("method","post")
        var u=$("#username").val();
        var p=$("#password").val();
        var m=$("#mail").val();
        var n=$("#number").val();
        if(u==""||p==""||m==""||n==""){
            alert("请全部填写");
        }else{
            sign.submit();
            alert("提交成功");
        }
    });

    /*登录*/
    $("#loginbtn").click(function () {
        var login=$("#login");
        login.attr("action", "login");
        login.attr("method","post")
        login.submit();
    });
    /*隐藏元素与展示元素*/
    $(".after").hide();$(".after1").hide();$(".after2").hide();
    var flag=true,flag1=true,flag2=true;
    $(".more").click(function () {
        if(flag) {
            $(".after").show();
            flag = false;
            $(".more").text("收起");
        }
        else {
            $(".after").hide();
            flag=true;
            $(".more").text("更多");
        }
    })
    $(".more1").click(function () {
        if(flag1) {
            $(".after1").show();
            flag1 = false;
            $(".more1").text("收起");
        }
        else {
            $(".after1").hide();
            flag1=true;
            $(".more1").text("更多");
        }
    })
    $(".more2").click(function () {
        // for(var i=0;i<30;i++) {
        //     $(".after").append("<div class='col-md-4'><li class='ulCreate'>2</li></div>");
        // }
        if(flag2) {
            $(".after2").show();
            flag2 = false;
            $(".more2").text("收起");
        }
        else {
            $(".after2").hide();
            flag2=true;
            $(".more2").text("更多");
        }
    })
    /*后台模块*/
    $("#frame").load(function () {
        var mainheight = $(this).contents().find("body").attr('scrollHeight') + 30;
        $(this).height(mainheight);
    })
});