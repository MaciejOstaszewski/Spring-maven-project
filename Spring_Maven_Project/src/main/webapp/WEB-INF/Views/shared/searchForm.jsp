<%--
  Created by IntelliJ IDEA.
  User: Marek
  Date: 2017-10-17
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Tytuł strony</title>
</head>
<body>

<div id="main">
    <%--@elvariable id="searchCommand" type="Com.controllers.commands.VehicleFilter"--%>
    <form:form modelAttribute="searchCommand">
        <div class="row">
            <div class="form-group col-md-6">
                <label for="phrase">Szukana fraza:</label>
                <form:input path="phrase" cssClass="form-control" cssErrorClass="form-control is-invalid"/>
                <form:errors path="phrase" cssClass="error text-danger" element="div"/>
            </div>

            <div class="form-group col-md-3">
                <label for="phrase">Cena od:</label>
                <form:input path="minPrice" cssClass="form-control" cssErrorClass="form-control is-invalid"/>
                <form:errors path="minPrice" cssClass="error text-danger" element="div"/>
            </div>
            <div class="form-group col-md-3">
                <label for="phrase">Cena do:</label>
                <form:input path="maxPrice" cssClass="form-control" cssErrorClass="form-control is-invalid"/>
                <form:errors path="maxPrice" cssClass="error text-danger" element="div"/>
            </div>
        </div>
        <div class="row">

            <div class="form-group col-md-8"></div>

            <div class="form-group col-md-2">
                <c:if test="${searchCommand.isEmpty() eq false}">
                <a href="vehicleList.html?all" class="btn btn-success">
                    <span class="glyphicon glyphicon-refresh"></span> Pokaż wszystko
                </a>
                </c:if>
            </div>

            <div class="form-group col-md-2">
                <button type="submit" class="btn btn-info">
                    <span class="glyphicon glyphicon-search"></span> Wyszukaj
                </button>
            </div>
        </div>
    </form:form>
</div>
</body>
</html>
