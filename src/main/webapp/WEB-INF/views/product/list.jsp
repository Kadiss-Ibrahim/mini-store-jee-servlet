<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalogue Produits - MiniStore</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 font-sans leading-normal tracking-normal">

<nav class="bg-indigo-600 p-4 shadow-lg">
    <div class="container mx-auto flex items-center justify-between flex-wrap">
        <div class="flex items-center text-white mr-6">
            <span class="font-bold text-xl tracking-tight"><i class="fas fa-store mr-2"></i>Mini-Store Admin</span>
        </div>
        <div class="flex items-center">
            <span class="text-indigo-200 text-sm mr-4">Bonjour, ${sessionScope.user.username}</span>
            <a href="${pageContext.request.contextPath}/logout" class="bg-indigo-800 hover:bg-indigo-700 text-white font-bold py-2 px-4 rounded transition duration-300 text-sm">
                <i class="fas fa-sign-out-alt mr-1"></i> Déconnexion
            </a>
        </div>
    </div>
</nav>

<div class="container mx-auto px-4 py-8">

    <div class="flex justify-between items-center mb-6">
        <h1 class="text-3xl font-bold text-gray-800">Gestion des Produits</h1>
        <a href="${pageContext.request.contextPath}/products/new" class="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded shadow transition duration-300">
            <i class="fas fa-plus mr-1"></i> Nouveau Produit
        </a>
    </div>

    <div class="bg-white shadow-md rounded-lg overflow-hidden">
        <table class="min-w-full leading-normal">
            <thead>
            <tr>
                <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-50 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">ID</th>
                <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-50 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Nom</th>
                <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-50 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Description</th>
                <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-50 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Prix</th>
                <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-50 text-right text-xs font-semibold text-gray-600 uppercase tracking-wider">Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="p" items="${products}">
                <tr class="hover:bg-gray-50 transition duration-150">
                    <td class="px-5 py-5 border-b border-gray-200 text-sm">
                        <span class="text-gray-500">#${p.id}</span>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 text-sm">
                        <p class="text-gray-900 font-medium whitespace-no-wrap">${p.name}</p>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 text-sm">
                        <p class="text-gray-600 truncate max-w-xs" title="${p.description}">${p.description}</p>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 text-sm">
                                <span class="relative inline-block px-3 py-1 font-semibold text-green-900 leading-tight">
                                    <span aria-hidden class="absolute inset-0 bg-green-200 opacity-50 rounded-full"></span>
                                    <span class="relative">
                                        <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="MAD " minFractionDigits="2"/>
                                    </span>
                                </span>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 text-sm text-right">
                        <div class="flex items-center justify-end space-x-3">
                            <a href="${pageContext.request.contextPath}/products/edit?id=${p.id}" class="text-indigo-600 hover:text-indigo-900 transition duration-150">
                                <i class="fas fa-edit"></i> Éditer
                            </a>

                            <form action="${pageContext.request.contextPath}/products/delete" method="POST" onsubmit="return confirm('Voulez-vous vraiment supprimer ce produit ?');">
                                <input type="hidden" name="id" value="${p.id}">
                                <button type="submit" class="text-red-600 hover:text-red-900 transition duration-150">
                                    <i class="fas fa-trash"></i> Supprimer
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty products}">
                <tr>
                    <td colspan="5" class="px-5 py-10 border-b border-gray-200 bg-white text-sm text-center text-gray-500">
                        <i class="fas fa-box-open text-4xl mb-3 text-gray-300"></i><br>
                        Aucun produit disponible pour le moment.
                    </td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>