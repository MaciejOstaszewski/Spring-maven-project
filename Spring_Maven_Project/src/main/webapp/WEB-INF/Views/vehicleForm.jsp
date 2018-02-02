<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<html>
<head>
    <title>Tytuł strony</title>
</head>
<body>

<jsp:include page="shared/header.jsp" />
<div id="vehicleForm" class="container">
    <div id="vehicleFormInputs">
        <%--@elvariable id="vehicle" type="Com.models.Vehicle"--%>
        <form:form method="POST" modelAttribute="vehicle">

            <div class="form-group">
                <label for="name">Nazwa:</label>
                <form:input path="name" cssClass="form-control" cssErrorClass="form-control is-invalid"/>
                <form:errors path="name" id = "error" cssClass="error text-danger" element="div"/>
            </div>
            <div class="form-group">
                <label for="model">Model:</label>
                <form:input path="model" cssClass="form-control" cssErrorClass="form-control is-invalid"/>
                <form:errors path="model" id = "error" cssClass="error text-danger" element="div"/>
            </div>
            <div class="form-group">
                <label for="price">Cena:</label>
                <form:input path="price" cssClass="form-control" cssErrorClass="form-control is-invalid"/>
                <form:errors path="price" id = "error" cssClass="error text-danger" element="div"/>
            </div>
            <div class="form-group">
                <label for="productionDate">Data Produkcji:</label>
                <form:input path="productionDate"  cssClass="form-control" type="date"
                            cssErrorClass="form-control is-invalid"/>
                <form:errors path="productionDate" id = "error" cssClass="error text-danger" element="div"/>
            </div>

            <div class="form-group">
                <label for="vehicleType.id">Typ Pojazdu:</label>
                <form:select path="vehicleType.id" cssClass="form-control" cssErrorClass="form-control is-invalid">
                    <form:option value="-1">--wybierz typ pojazdu--</form:option>
                    <form:options items="${vehicleTypes}" itemLabel="name" itemValue="id"/>
                </form:select>
                <form:errors path="vehicleType.id" id = "error" cssClass="error text-danger" element="div"/>
            </div>
            <div class="form-group">
                <label>Wyposażenie pojazdu:</label>

                <form:checkboxes path="accessories"
                                 element="div class='checkbox' style='left:25px;'" items="${accessoryList}"
                                 itemLabel="name" itemValue="id"/>
                <form:errors path="accessories" id = "error" cssClass="error text-danger" element="div" />

            </div>

            <button type="submit" class="btn btn-success">Wyślij</button>
        </form:form>
    </div>
</div>


<jsp:include page="shared/footer.jsp"/>
</body>
</html>
