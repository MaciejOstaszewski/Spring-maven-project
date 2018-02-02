<%--
  Created by IntelliJ IDEA.
  User: Marek
  Date: 2017-11-28
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>

    <nav>
        <c:url var="prevPageUrl" value="vehicleList.html?page=${vehicles.number - 1}&size=${vehicles.size}"/>
        <c:url var="nextPageUrl" value="vehicleList.html?page=${vehicles.number + 1}&size=${vehicles.size}"/>
        <c:url var="firstPageUrl" value="vehicleList.html?page=${vehicles.first}&size=${vehicles.size}"/>
        <c:url var="lastPageUrl" value="vehicleList.html?page=${vehicles.totalPages-1}&size=${vehicles.size}"/>
        <ul class="pagination">

            <li ${vehicles.first?'class="disabled"':''}>
                <a href="${vehicles.first?'#':firstPageUrl}">
                    <span>&laquo;&laquo;</span>
                </a>
            </li>
            <li ${vehicles.first?'class="disabled"':''}>
                <a href="${vehicles.first?'#':prevPageUrl}">
                    <span>&laquo;</span>
                </a>
            </li>

            <c:if test="${vehicles.totalPages > 0}">
                <c:forEach var="pageIdx" begin="${0}" end="${vehicles.totalPages-1}">
                    <c:url var="pageUrl" value="vehicleList.html?page=${pageIdx}&size=${vehicles.size}"/>
                    <li ${pageIdx == vehicles.number?'class="active"':''}>
                        <a href="${pageUrl}">${pageIdx+1}</a>
                    </li>
                </c:forEach>
            </c:if>
            <li ${vehicles.last?'class="disabled"':''}>
                <a href="${vehicles.last?'#':nextPageUrl}">
                    <span>&raquo;</span>
                </a>
            </li>
            <li ${vehicles.last?'class="disabled"':''}>
                <a href="${vehicles.last?'#':lastPageUrl}">
                    <span>&raquo;&raquo;</span>
                </a>
            </li>
        </ul>

        <ul class="pagination" style="float: right">
            <c:set var="pageSizes" value="${[2, 10, 20, 30, 50]}"/>
            <c:forEach var="size" items="${pageSizes}">
                <c:url var="pageUrl" value="vehicleList.html?page=${vehicles.number}&size=${size}"/>
                <li ${vehicles.size eq size?'class="active"':''}><a href="${pageUrl}"><span>${size}</span></a></li>
            </c:forEach>
        </ul>
    </nav>

</body>
</html>
