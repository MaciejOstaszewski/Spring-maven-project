<%--
  Created by IntelliJ IDEA.
  User: start
  Date: 2017-12-23
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../shared/header.jsp"></jsp:include>
<html>
<title>
    Brak pojazdu
</title>
<body>
<div id="main" class="container">

    <div>
        <h1>404 - Nie znaleziono pojazdu</h1>
        <div>
            URL żądania: ${url}</br>
            Wyjątek: ${exception.message}
        </div>
    </div>

</div>
</body>
</html>
<jsp:include page="../shared/footer.jsp"></jsp:include>