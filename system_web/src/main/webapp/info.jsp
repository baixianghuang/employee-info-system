<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" >
    <title>Personal info</title>
    <link rel="stylesheet" type="text/css" href="../css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="../css/common.css"/>
    <link rel="stylesheet" type="text/css" href="../css/thems.css">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(function(){
            window.onresize=function(){ location=location };
            var main_h = $(window).height();
            $('.hy_list').css('height',main_h-45+'px');
            var main_w = $(window).width();
            $('.xjhy').css('width',main_w-40+'px');
        });
    </script>
</head>

<body onLoad="Resize();">
<div id="right_ctn">
    <div class="right_m">
        <div class="hy_list">
            <div class="box_t">
                <span class="name">Employee detail</span>
            </div>
            <div class="space_hx">&nbsp;</div>
                <div class="xjhy">
                    <ul class="hypz gjpz clearfix">
                        <li class="clearfix">
                            <span class="title">Account: </span>
                            <div class="li_r">${USER.account}</div>
                        </li>
                        <li class="clearfix">
                            <span class="title">Status: </span>
                            <div class="li_r">${USER.status}</div>
                        </li>
                        <li class="clearfix">
                            <span class="title">Department: </span>
                            <div class="li_r">${USER.department.name}</div>
                        </li>
                        <li class="clearfix">
                            <span class="title">Name: </span>
                            <div class="li_r">${USER.name}</div>
                        </li>
                        <li class="clearfix">
                            <span class="title">Gender: </span>
                            <div class="li_r">${USER.sex}</div>
                        </li>
                        <li class="clearfix">
                            <span class="title">ID number: </span>
                            <div class="li_r">${USER.idNumber}</div>
                        </li>
                        <li class="clearfix">
                            <span class="title">Born date</span>
                            <div class="li_r">
                                <fmt:formatDate value="${USER.bornDate}" pattern="yyyy-MM-dd"/>
                            </div>
                        </li>
                        <li class="clearfix">
                            <span class="title">Work time: </span>
                            <div class="li_r">
                                <fmt:formatDate value="${USER.workTime}" pattern="yyyy-MM-dd hh:mm"/>
                            </div>
                        </li>
                        <li class="clearfix">
                            <span class="title">Leave time: </span>
                            <div class="li_r">
                                <fmt:formatDate value="${USER.leaveTime}" pattern="yyyy-MM-dd hh:mm"/>
                            </div>
                        </li>
                        <li class="clearfix">
                            <span class="title">Info:</span>
                            <div class="li_r">${USER.info}</div>
                        </li>
                    </ul>
                </div>
        </div>
    </div>
</div>
</body>
</html>
