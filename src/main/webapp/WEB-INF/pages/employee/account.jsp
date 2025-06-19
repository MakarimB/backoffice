<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Mon Compte</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" />
</head>
<body class="bg-light">
<div class="container mt-5" style="max-width: 500px;">
    <h2>Mon compte</h2>

    <form action="${pageContext.request.contextPath}/mvcAccount/update" method="post">
        <div class="mb-3">
            <label for="firstname" class="form-label">Prénom</label>
            <input type="text" class="form-control" id="firstname" name="firstname" value="${sessionScope.user.firstname}" required />
        </div>

        <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>

            <c:if test="${not empty success}">
                <div class="alert alert-success">${success}</div>
            </c:if>


        <div class="mb-3">
            <label for="lastname" class="form-label">Nom</label>
            <input type="text" class="form-control" id="lastname" name="lastname" value="${sessionScope.user.lastname}" required />
        </div>

        <h5>Changer le mot de passe</h5>
        <div class="mb-3">
            <label for="currentPassword" class="form-label">Mot de passe actuel</label>
            <input type="password" class="form-control" id="currentPassword" name="currentPassword" required />
        </div>
        <div class="mb-3">
            <label for="newPassword" class="form-label">Nouveau mot de passe</label>
            <input type="password" class="form-control" id="newPassword" name="newPassword" required />
        </div>
        <div class="mb-3">
            <label for="confirmPassword" class="form-label">Confirmer le nouveau mot de passe</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required />
        </div>

        <button type="submit" class="btn btn-primary-custom">Mettre à jour</button>
        <a href="${pageContext.request.contextPath}/home" class="btn btn-cancel">Annuler</a>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
