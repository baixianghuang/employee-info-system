<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" >
    <title>Add staff</title>
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
                <span class="name">Add staff</span>
            </div>
            <div class="space_hx">&nbsp;</div>
            <form action="add.do" method="post" name="addForm">
                <div class="xjhy">
                    <ul class="hypz gjpz clearfix">
                        <li class="clearfix">
                            <span class="title">account: </span>
                            <div class="li_r">
                                <input class="chang" name="account" type="text">
                                <i>*</i>
                            </div>
                        </li>

                        <li class="clearfix">
                            <span class="title">Department: </span>
                            <div class="li_r">
                                <select name="did">
                                    <c:forEach items="${DLIST}" var="dep">
                                        <option value="${dep.id}">${dep.name}</option>
                                    </c:forEach>
                                </select>
                                <i>*</i>
                            </div>
                        </li>
                        <li class="clearfix">
                            <span class="title">Gender: </span>
                            <div class="li_r">
                                <span class="radio">
                                    <input name="sex" type="radio" value="<Male>" checked="checked"/>
                                    <em>male</em>
                                </span>
                                <span class="radio">
                                    <input name="sex" type="radio" value="Female"/>
                                    <em>female</em>
                                </span>
                                <i>*</i>
                            </div>
                        </li>
                        <li class="clearfix">
                            <span class="title">Id number: </span>
                            <div class="li_r">
                                <input class="chang" name="idNumber" type="text">
                            </div>
                        </li>
                        <li class="clearfix">
                            <span class="title">Born date: </span>
                            <div class="li_r">
                                <input class="chang" name="bornDate" type="text">
                            </div>
                        </li>
                        <li class="clearfix">
                            <span class="title">Info: </span>
                            <div class="li_r">
                                <input class="chang" name="info" type="text">
                            </div>
                        </li>

                        <li class="tj_btn">
                            <a href="javascript:history.go(-1);" class="back">Return</a>
                            <a href="javascript:addForm.submit();">Save</a>
                        </li>
                    </ul>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>


