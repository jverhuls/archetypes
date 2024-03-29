<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="b" uri="http://www.backbase.com/taglib" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <title>Container Contents</title>
</head>
<body>
<div style="width:100%;border:1px solid #FF0000">
    Container name: <c:out value="${item.name}"/>
    <table>
        <c:forEach items="${item.children}" var="child">
            <tr>
                <td vertical-align="top">
                    <b:include src="${child}"/>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>

