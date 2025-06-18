<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
      <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" height="30" />
      Accueil
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
      aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mvcEmployees/findall">Gérer les employés</a></li>
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mvcAccount">Gérer mon compte</a></li>
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mvcItems/findall">Gérer les items</a></li>
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mvcCustomers/findall">Gérer les clients</a></li>
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mvcIngredients/findall">Gérer les ingrédients</a></li>
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mvcStats">Statistiques</a></li>
        <li class="nav-item"><a class="nav-link btn btn-danger text-white" href="${pageContext.request.contextPath}/logout">Déconnexion</a></li>
      </ul>
    </div>
  </div>
</nav>
