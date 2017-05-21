<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script src="../js/jquery-ui.min.js"></script>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        table {
            font-size: 1em;
        }
        .ui-progressbar {
            position: relative;
        }
        .progress-label {
            position: absolute;
            left: 50%;
            font-weight: bold;
            text-shadow: 1px 1px 0 #fff;
        }
        .btn-circle{
            width: 150px;
            height: 150px;
            padding-top: 17px;
            font-size: 18px;
            line-height: 1.33;
            border-radius: 75px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="row" style="margin-top: 150px">
        <div class="col-lg-4 col-md-4 col-sm-4">&nbsp;</div>
        <div class="col-lg-4 col-md-4 col-sm-4" style="text-align: center"><button class="btn btn-default btn-lg btn-circle" style="background: black;color: white" data-toggle="modal" data-target="#m">Start Crawling</button></div>
        <div class="col-lg-4 col-md-4 col-sm-4">&nbsp;</div>
    </div>
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="m" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body" style="height: 50px">
                    <div id="progressbar" ><div class="progress-label">加载...</div></div>
                           <!-- <div class="progress progress-striped">
                                <div class="progress-bar progress-bar-success" role="progressbar" id="bar"
                                     aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                                     style="width: 5%;">
                                </div>
                            </div>-->
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <script>
    $(function() {
        var progressbar = $( "#progressbar" ),
            progressLabel = $( ".progress-label" );
            progressbar.progressbar({
            value: false,
            change: function() {
                progressLabel.text( progressbar.progressbar( "value" ) + "%" );
            },
            complete: function() {
                progressLabel.text( "线程已启动" );
            }
        });

        function progress() {
            var val = progressbar.progressbar( "value" ) || 0;

            progressbar.progressbar( "value", val + 1 );
            if ( val < 99 ) {
                setTimeout( progress,35);
            }else {
            	setTimeout( text, 1000 );
            }
        }

        setTimeout( progress, 2000 );
        function text(){
        	$("#m").modal("hide");
            $( "#progressbar" ).progressbar({
                value: 0
            });
            $(window).attr('location','start');
        }
    });
</script>
    
</body>
</html>