<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Department list</title>
    <link rel="stylesheet" type="text/css" href="../css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="../css/common.css"/>
    <link rel="stylesheet" type="text/css" href="../css/thems.css">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(function(){
            window.onresize=function(){ location=location };

            var main_h = $(window).height();
            $('.hy_list').css('height',main_h-45+'px');

            var search_w = $(window).width()-40;
            $('.search').css('width',search_w+'px');
            //$('.list_hy').css('width',search_w+'px');
        });
    </script>
</head>

<body onLoad="Resize();">
<div id="right_ctn">
    <div class="right_m">
        <div class="hy_list">
            <div class="box_t">
                <span class="name">Department List</span>
            </div>
            <div class="space_hx">&nbsp;</div>

            <table cellpadding="0" cellspacing="0" class="list_hy">
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Address</th>
                    <th scope="col">Operation</th>
                </tr>
                <c:forEach items="${LIST}" var="dep">
                    <tr>
                        <td>${dep.name}</td>
                        <td>${dep.address}</td>
                        <td>
                            <a href="toEdit.do?id=${dep.id}" class="btn">Update</a>
                            <a href="remove.do?id=${dep.id}" class="btn">Remove</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <div class="r_foot">
                <div class="r_foot_m">
                    <a href="toAdd.do" class="btn">Add</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

