<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Accueil</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .logo {
            display: block;
            max-width: 250px;
            margin: 2rem auto 1rem auto;
        }
        .welcome-msg {
            font-size: 1.3rem;
            margin-bottom: 1rem;
            color: #5c3a00;
            text-align: center;
        }
        .fun-msg {
            font-style: italic;
            color: #855c00;
            text-align: center;
            margin-bottom: 2rem;
        }
        .btn-primary-custom {
            background-color: #5c3a00;
            border-color: #5c3a00;
            color: white;
        }
        .btn-primary-custom:hover {
            background-color: #7a5000;
            border-color: #7a5000;
            color: white;
        }
    </style>
</head>
<body>

<c:choose>
    <c:when test="${not empty username}">
        <%-- Header avec menu --%>
        <%@ include file="/WEB-INF/pages/common/header.jsp" %>

        <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" class="logo" />

        <div class="container mt-4">
            <h3 class="welcome-msg">Bonjour, <strong>${username}</strong> !</h3>
            <p class="fun-msg">Vous êtes maintenant connecté. Pas besoin de cape pour être un héros du service !</p>
            <p class="text-center">Utilisez le menu ci-dessus pour accéder à vos outils et gérer la journée comme un(e) pro.</p>
        </div>
    </c:when>
    <c:otherwise>
        <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" class="logo" />

        <div class="container mt-4 text-center">
            <h3 class="welcome-msg">Bienvenue, visiteur !</h3>
            <p class="fun-msg">L’aventure commence ici, mais il faut d’abord s’identifier pour embarquer.</p>
            <a href="${pageContext.request.contextPath}/login" class="btn btn-primary-custom">Se connecter</a>
        </div>
    </c:otherwise>
</c:choose>

<jsp:include page="/WEB-INF/pages/common/footer.jsp" />

</body>
</html>
