<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Liste des employés</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" />
</head>
<body class="container mt-5">
<%@ include file="/WEB-INF/pages/common/header.jsp" %>

<div class="d-flex justify-content-between align-items-center mb-4">
    <h2>Employés</h2>
    <a class="btn btn-success" href="${pageContext.request.contextPath}/mvcEmployees/create">Ajouter un employé</a>
</div>

<c:forEach var="employee" items="${liste}">
    <div class="card mb-3">
        <div class="card-header d-flex justify-content-between align-items-center">
            <strong>${employee.firstname} ${employee.lastname}</strong>
            <div>
                <a class="btn btn-sm btn-danger" href="${pageContext.request.contextPath}/mvcEmployees/delete/${employee.id}" onclick="return confirm('Confirmer la suppression ?')">Supprimer</a>
            </div>
        </div>
        <div class="card-body">
            <p><strong>Email (login) :</strong> ${employee.login}</p>
            <p><strong>Rôle :</strong> ${employee.role}</p>
            <p><strong>Compte actif :</strong> <c:choose>
                <c:when test="${employee.active}">Oui</c:when>
                <c:otherwise>Non</c:otherwise>
            </c:choose></p>
        </div>
    </div>
</c:forEach>

<jsp:include page="/WEB-INF/pages/common/footer.jsp" />

</body>
</html>