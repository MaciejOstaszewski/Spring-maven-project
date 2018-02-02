<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Title</title>
</head>
<body class="active">

<jsp:include page="shared/header.jsp"></jsp:include>
<c:set var="boundMin" value="${20000}"/>
<c:set var="boundMax" value="${40000}"/>

<jsp:include page="shared/searchForm.jsp"></jsp:include>
<div id="main">
    <H1>LISTA POJAZDÓW</H1>
    <c:if test="${empty vehicleListPage.content}">
        ${searchCommand.isEmpty() ? 'Lista pojazdów jest pusta':'Brak wyników wyszukiwania'}
    </c:if>

    <c:if test="${not empty vehicleListPage.content}">

        <c:choose>
            <c:when test="${searchCommand.isEmpty()}">
                Lista zawiera ${vehicleListPage.totalElements} pojazdów
            </c:when>
            <c:otherwise>
                Wynik wyszukiwania: ${vehicleListPage.totalElements} pojazdów
            </c:otherwise>
        </c:choose>
        <table class="table">
            <thead>
            <tr>
                <th>Nazwa</th>
                <th>Model</th>
                <th>Data</th>
                <th>Typ Pojazdu</th>
                <th>Cena</th>
                <th>Opinia</th>
                <security:authorize access="hasRole('ADMIN')">
                    <th></th>
                    <th></th>
                </security:authorize>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${vehicleListPage.content}" var="veh">

                <tr>

                    <td>
                        <security:authorize access="isAuthenticated()">
                            <a id="details" href="?id=${veh.id}">${veh.name}</a>
                        </security:authorize>
                        <security:authorize access="isAnonymous()">
                            <c:out value="${vehicle.name}" escapeXml="true"/>
                        </security:authorize>
                    </td>
                    <td>${veh.model}</td>
                    <td><fmt:formatDate value="${veh.productionDate}" type="DATE"/></td>
                    <td>${veh.vehicleType.name}</td>
                    <td>
                        <fmt:formatNumber type="CURRENCY" value="${veh.price}" currencySymbol="PLN"/>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${veh.price lt boundMin}">
                                TANI
                            </c:when>
                            <c:when test="${veh.price gt boundMax}">
                                DROGI
                            </c:when>
                            <c:otherwise>
                                ŚREDNI
                            </c:otherwise>
                        </c:choose>
                    </td>

                    <sec:authorize access="hasRole('ADMIN')">
                        <c:url var="deleteUrl"
                               value="vehicleList.html?did=${veh.id}&page=${vehicleListPage.number}&size=${vehicleListPage.size}"/>
                        <c:url var="editUrl" value="vehicleForm.html?id=${veh.id}"/>
                        <td><a class="btn btn-danger" href="${deleteUrl}">
                            <span class="glyphicon glyphicon-remove"></span> Usuń
                        </a></td>
                        <td><a class="btn btn-success" href="${editUrl}">
                            <span class="glyphicon glyphicon-pencil"></span> Edytuj
                        </a></td>
                    </sec:authorize>

                </tr>

            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
<jsp:include page="shared/pageable.jsp"/>
<jsp:include page="shared/footer.jsp"/>
</body>
</html>
