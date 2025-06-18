<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>Statistiques - Projet Final</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 2rem; }
        h2 { color: #5c3a00; }
        table { border-collapse: collapse; width: 100%; margin-bottom: 2rem; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #5c3a00; color: white; }
    </style>
</head>
<body class="container mt-5">

<h1>Statistiques</h1>

<h2>Favoris (items avec au moins un client)</h2>
<table>
    <thead>
    <tr><th>Nom</th><th>Prix</th><th>Nombre de clients</th></tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${favoris}">
        <tr>
            <td>${item.name}</td>
            <td>${item.price}</td>
            <td>${item.customers.size()}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<h2>Top 10 des items les plus commandés</h2>
<table>
    <thead>
    <tr><th>Nom</th><th>Quantité commandée</th></tr>
    </thead>
    <tbody>
    <c:forEach var="entry" items="${topItems}">
        <tr>
            <td>${entry.key.name}</td>
            <td>${entry.value}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<h2>Statistiques sur le total des commandes</h2>
<ul>
    <li>Moyenne : ${avgPrice}</li>
    <li>Maximum : ${maxPrice}</li>
    <li>Minimum : ${minPrice}</li>
    <li>Médiane : ${medianPrice}</li>
</ul>

<h2>Clients</h2>
<ul>
    <li>Total clients : ${totalCustomers}</li>
    <li>Clients avec commande : ${customersWithOrders} (<fmt:formatNumber value="${pctCustomersWithOrders}" pattern="##0.00"/>%)</li>
    <li>Clients avec réservation : ${customersWithReservations} (<fmt:formatNumber value="${pctCustomersWithReservations}" pattern="##0.00"/>%)</li>
</ul>

</body>
</html>
