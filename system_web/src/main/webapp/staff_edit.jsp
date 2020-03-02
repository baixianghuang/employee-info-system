<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" >
    <title>Update staff</title>
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
                <span class="name">Update staff</span>
            </div>
            <div class="space_hx">&nbsp;</div>
            <form action="edit.do" method="post" name="addForm">
                <input type="hidden" name="id" value="${OBJ.id}">
                <div class="xjhy">
                    <ul class="hypz gjpz clearfix">
                        <li class="clearfix">
                            <span class="title">Account: </span>
                            <div class="li_r">
                                <input class="chang" name="account" type="text" value="${OBJ.name}">
                                <i>*</i>
                            </div>
                        </li>
                        <li class="clearfix">
                            <span class="title">Department: </span>
                            <div class="li_r">
                                <select name="did">
                                    <c:forEach items="${DLIST}" var="dep">
<%--                                    By default, the original department of the staff is choosen--%>
                                        <c:if test="${OBJ.did==dep.id}">
                                            <option value="${dep.id}" selected="selected">${dep.name}</option>
                                        </c:if>
                                        <c:if test="${OBJ.did!=dep.id}">
                                            <option value="${dep.id}">${dep.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                                <i>*</i>
                            </div>
                        </li>
                        <li class="clearfix">
                            <span class="title">Name: </span>
                            <div class="li_r">
                                <input class="chang" name="name" type="text" value="${OBJ.name}"/>
                            </div>
                        </li>
                        <li class="clearfix">
                            <span class="title">Gender: </span>
                            <div class="li_r">
                                <span class="radio">
                                <input name="sex" type="radio" value="male" checked="checked"/>
                                <em>male</em>
                                </span>
                                <c:if test="${OBJ.sex=='female'}">
                                <span class="radio">
                                <input name="sex" type="radio" value="female" checked="checked"/>
                                <em>female</em>
                                </span>
                                </c:if>
                                <c:if test="${OBJ.sex!='female'}">
                                <span class="radio">
                                <input name="sex" type="radio" value="female"/>
                                <em>female</em>
                                </span>
                                </c:if>
                            </div>
                        </li>
                        <li class="clearfix">
                            <span class="title">Id number</span>
                            <div class="li_r">
                                <input class="chang" name="idNumber" type="text" value="${OBJ.idNumber}"/>
                            </div>
                        </li>
                        <li class="clearfix">
                            <span class="title">Born Date</span>
                            <div class="li_r">
                                <input class="chang" name="bornDate" type="text" value="<fmt:formatDate value="${OBJ.bornDate}" pattern="yyyy-MM-dd"/>"/>
                            </div>
                        </li>
                        <li class="clearfix">
                            <span class="title">Info: </span>
                            <div class="li_r">
                                <input class="chang" name="info" type="text" value="${OBJ.info}"/>
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


