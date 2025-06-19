<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

  <meta charset="UTF-8"/>
  <title>Créer un employé</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" />

</head>
<body class="container mt-5">



  <h2 class="mb-4">Créer un nouvel employé</h2>

  <c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
  </c:if>
  <c:if test="${not empty success}">
    <div class="alert alert-success">${success}</div>
  </c:if>

  <form method="post" action="${pageContext.request.contextPath}/mvcEmployees/create">
    <div class="mb-3">
      <label for="firstname" class="form-label">Prénom</label>
      <input type="text" id="firstname" name="firstname" class="form-control"
             value="${employee.firstname}" required />
    </div>

    <div class="mb-3">
      <label for="lastname" class="form-label">Nom</label>
      <input type="text" id="lastname" name="lastname" class="form-control"
             value="${employee.lastname}" required />
    </div>

    <div class="mb-3">
      <label for="login" class="form-label">Email (login)</label>
      <input type="email" id="login" name="login" class="form-control"
             value="${employee.login}" required />
    </div>

    <div class="mb-3">
      <label for="password" class="form-label">Mot de passe</label>
      <input type="password" id="password" name="password" class="form-control" required />
    </div>

    <div class="mb-3">
      <label for="confirmPassword" class="form-label">Confirmer mot de passe</label>
      <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required />
    </div>

    <div class="mb-3">
      <label for="role" class="form-label">Rôle</label>
      <select id="role" name="role" class="form-select" required>
        <c:forEach var="r" items="${roles}">
          <option value="${r}" <c:if test="${employee.role == r}">selected</c:if>>
            ${r}
          </option>
        </c:forEach>
      </select>
    </div>

    <div class="form-check mb-3">
      <input type="checkbox" id="active" name="active" class="form-check-input" value="true"
             <c:if test="${employee.active}">checked</c:if> />
      <label for="active" class="form-check-label">Compte activé</label>
    </div>

    <button type="submit" class="btn btn-primary">Créer</button>
    <a href="${pageContext.request.contextPath}/mvcEmployees/findall" class="btn btn-secondary ms-2">Annuler</a>
  </form>

</body>
</html>
