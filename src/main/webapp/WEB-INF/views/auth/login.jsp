<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion - MiniStore</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

<div class="w-full max-w-md bg-white shadow-lg rounded-lg overflow-hidden">

    <div class="bg-indigo-600 p-6 text-center">
        <h1 class="text-white text-2xl font-bold"><i class="fas fa-store mr-2"></i>Mini-Store</h1>
        <p class="text-indigo-200 text-sm mt-1">Accédez à votre espace d'administration</p>
    </div>

    <div class="p-8">

        <c:if test="${not empty error}">
            <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-6" role="alert">
                <p class="font-bold">Erreur</p>
                <p>${error}</p>
            </div>
        </c:if>

        <c:if test="${param.registered == 'true'}">
            <div class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-6" role="alert">
                <p class="font-bold">Succès</p>
                <p>Votre compte a été créé. Connectez-vous !</p>
            </div>
        </c:if>

        <c:if test="${param.logout == 'true'}">
            <div class="bg-blue-100 border-l-4 border-blue-500 text-blue-700 p-4 mb-6" role="alert">
                <p>Vous avez été déconnecté avec succès.</p>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="POST">

            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="email">
                    Adresse Email
                </label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-envelope text-gray-400"></i>
                    </div>
                    <input class="shadow appearance-none border rounded w-full py-2 pl-10 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition"
                           id="email" name="email" type="email" placeholder="admin@ministore.com" required autofocus>
                </div>
            </div>

            <div class="mb-6">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="password">
                    Mot de passe
                </label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-lock text-gray-400"></i>
                    </div>
                    <input class="shadow appearance-none border rounded w-full py-2 pl-10 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition"
                           id="password" name="password" type="password" placeholder="******************" required>
                </div>
            </div>

            <div class="flex items-center justify-between">
                <button class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline transition duration-300 transform hover:scale-105"
                        type="submit">
                    Se connecter
                </button>
            </div>
        </form>

        <div class="mt-6 text-center">
            <p class="text-sm text-gray-600">
                Pas encore de compte ?
                <a href="${pageContext.request.contextPath}/register" class="font-bold text-indigo-600 hover:text-indigo-800 transition">
                    Créer un compte
                </a>
            </p>
        </div>
    </div>
</div>

</body>
</html>