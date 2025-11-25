<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>
        <c:if test="${product != null}">Modifier Produit</c:if>
        <c:if test="${product == null}">Nouveau Produit</c:if>
        - MiniStore
    </title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 font-sans flex items-center justify-center min-h-screen">

<div class="w-full max-w-lg bg-white shadow-lg rounded-lg overflow-hidden">

    <div class="bg-indigo-600 p-4 flex justify-between items-center">
        <h2 class="text-white text-xl font-bold">
            <i class="fas fa-cube mr-2"></i>
            <c:choose>
                <c:when test="${product != null}">Modifier le Produit #${product.id}</c:when>
                <c:otherwise>Ajouter un Nouveau Produit</c:otherwise>
            </c:choose>
        </h2>
        <a href="${pageContext.request.contextPath}/products" class="text-indigo-200 hover:text-white transition">
            <i class="fas fa-times"></i>
        </a>
    </div>

    <div class="p-8">
        <c:set var="actionUrl" value="${product != null ? 'update' : 'insert'}" />

        <form action="${pageContext.request.contextPath}/products/${actionUrl}" method="POST">

            <c:if test="${product != null}">
                <input type="hidden" name="id" value="${product.id}">
            </c:if>

            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="name">
                    Nom du produit
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent"
                       id="name" name="name" type="text" placeholder="Ex: Smartphone X" required
                       value="${product.name}">
            </div>

            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="price">
                    Prix (MAD)
                </label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <span class="text-gray-500 sm:text-sm">DH</span>
                    </div>
                    <input class="shadow appearance-none border rounded w-full py-2 pl-10 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent"
                           id="price" name="price" type="number" step="0.01" min="0" placeholder="0.00" required
                           value="${product.price}">
                </div>
            </div>

            <div class="mb-6">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="description">
                    Description
                </label>
                <textarea class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent"
                          id="description" name="description" rows="4" placeholder="Détails du produit...">${product.description}</textarea>
            </div>

            <div class="flex items-center justify-between">
                <a href="${pageContext.request.contextPath}/products" class="text-gray-500 hover:text-gray-700 font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                    Annuler
                </a>
                <button class="bg-indigo-600 hover:bg-indigo-700 text-white font-bold py-2 px-6 rounded focus:outline-none focus:shadow-outline transition duration-300 flex items-center" type="submit">
                    <i class="fas fa-save mr-2"></i>
                    <c:choose>
                        <c:when test="${product != null}">Mettre à jour</c:when>
                        <c:otherwise>Enregistrer</c:otherwise>
                    </c:choose>
                </button>
            </div>
        </form>
    </div>
</div>

</body>
</html>