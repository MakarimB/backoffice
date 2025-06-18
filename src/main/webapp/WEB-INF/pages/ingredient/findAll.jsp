

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Liste des Ingredients</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" />
</head>
<body class="container mt-5">
<%@ include file="/WEB-INF/pages/common/header.jsp" %>

<h2 class="mb-4 text-center">Liste des Ingrédients</h2>

<table class="table table-striped table-bordered shadow">
    <thead class="table-dark">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="ingredient" items="${liste}">
        <tr>
            <td>${ingredient.id}</td>
            <td>${ingredient.name}</td>
            <td>
                <!-- Modifier -->
                <a href="${pageContext.request.contextPath}/mvcIngredients/update/${ingredient.id}" class="btn btn-primary btn-sm me-1">Modifier</a>

                <!-- Supprimer -->
                <form action="${pageContext.request.contextPath}/mvcIngredients/delete/${ingredient.id}" method="get" style="display:inline;" onsubmit="return confirm('Supprimer cet ingrédient ?');">
                    <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- Ajouter un ingrédient -->
<a href="${pageContext.request.contextPath}/mvcIngredients/create" class="btn btn-success mt-3">+ Ajouter un ingrédient</a>

<jsp:include page="/WEB-INF/pages/common/footer.jsp" />

</body>
</html>
