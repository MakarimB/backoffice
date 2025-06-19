<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>Statistiques - Projet Final</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body { background-color: #f8f9fa; }
        h1, h2 { color: #343a40; margin-top: 2rem; }
        .section { margin-bottom: 3rem; }
        table { background-color: white; }
        .progress { height: 20px; }
        .btn-back { float: right; margin-top: -2rem; }
    </style>
</head>
<body class="container py-5">

    <h1 class="mb-4">Statistiques
        <a href="${pageContext.request.contextPath}/" class="btn btn-outline-secondary btn-sm btn-back">⬅ Retour à l'accueil</a>
    </h1>

    <div class="section">
        <h2>Favoris (items avec au moins un client)</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr><th>Nom</th><th>Prix (€)</th><th>Nombre de clients</th></tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${favoris}">
                        <tr>
                            <td>${item.name}</td>
                            <td><fmt:formatNumber value="${item.price}" type="currency" currencySymbol="€"/></td>
                            <td>${item.customers.size()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="section">
        <h2>Top 10 des items les plus commandés</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
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
        </div>

<!-- Donut redimensionné et centré -->
<div style="max-width: 350px; margin: 0 auto;">
    <canvas id="topItemsChart"></canvas>
</div>
<script>
    const ctx = document.getElementById('topItemsChart');
    new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: [
                <c:forEach var="entry" items="${topItems}" varStatus="loop">
                    "${entry.key.name}"<c:if test="${!loop.last}">,</c:if>
                </c:forEach>
            ],
            datasets: [{
                label: 'Commandes',
                data: [
                    <c:forEach var="entry" items="${topItems}" varStatus="loop">
                        ${entry.value}<c:if test="${!loop.last}">,</c:if>
                    </c:forEach>
                ],
                backgroundColor: [
                    '#007bff', '#28a745', '#ffc107', '#dc3545', '#6f42c1',
                    '#17a2b8', '#fd7e14', '#20c997', '#6610f2', '#adb5bd'
                ]
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            cutout: '65%', // Donut plus fin
            plugins: {
                legend: { position: 'bottom' }
            }
        }
    });
</script>


    <div class="section">
        <h2>Statistiques sur le total des commandes (€)</h2>
        <ul class="list-group">
            <li class="list-group-item">Moyenne : <strong><fmt:formatNumber value="${avgPrice}" type="currency" currencySymbol="€"/></strong></li>
            <li class="list-group-item">Maximum : <strong><fmt:formatNumber value="${maxPrice}" type="currency" currencySymbol="€"/></strong></li>
            <li class="list-group-item">Minimum : <strong><fmt:formatNumber value="${minPrice}" type="currency" currencySymbol="€"/></strong></li>
            <li class="list-group-item">Médiane : <strong><fmt:formatNumber value="${medianPrice}" type="currency" currencySymbol="€"/></strong></li>
        </ul>
    </div>

    <div class="section">
        <h2>Clients</h2>
        <ul class="list-group mb-3">
            <li class="list-group-item">Total clients : <strong>${totalCustomers}</strong></li>
            <li class="list-group-item">
                Clients avec commande : <strong>${customersWithOrders}</strong>
                <div class="progress mt-2">
                    <div class="progress-bar bg-success" role="progressbar"
                         style="width: ${pctCustomersWithOrders}%" aria-valuenow="${pctCustomersWithOrders}"
                         aria-valuemin="0" aria-valuemax="100">
                        <fmt:formatNumber value="${pctCustomersWithOrders}" pattern="##0.0"/>%
                    </div>
                </div>
            </li>
            <li class="list-group-item">
                Clients avec réservation : <strong>${customersWithReservations}</strong>
                <div class="progress mt-2">
                    <div class="progress-bar bg-info" role="progressbar"
                         style="width: ${pctCustomersWithReservations}%" aria-valuenow="${pctCustomersWithReservations}"
                         aria-valuemin="0" aria-valuemax="100">
                        <fmt:formatNumber value="${pctCustomersWithReservations}" pattern="##0.0"/>%
                    </div>
                </div>
            </li>
        </ul>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
