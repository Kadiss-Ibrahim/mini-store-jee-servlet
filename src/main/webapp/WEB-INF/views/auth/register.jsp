<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription - MiniStore</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

<div class="w-full max-w-md bg-white shadow-xl rounded-lg overflow-hidden my-8">

    <div class="bg-indigo-500 p-6 text-center">
        <h1 class="text-white text-2xl font-bold"><i class="fas fa-user-plus mr-2"></i>Inscription</h1>
        <p class="text-indigo-100 text-sm mt-1">Rejoignez l'équipe Mini-Store</p>
    </div>

    <div class="p-8">

        <c:if test="${not empty error}">
            <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-6 text-sm" role="alert">
                <p class="font-bold">Erreur :</p>
                <p>${error}</p>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/register" method="POST">

            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="username">
                    Nom d'utilisateur
                </label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-user text-gray-400"></i>
                    </div>
                    <input class="shadow appearance-none border rounded w-full py-2 pl-10 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-indigo-500 transition"
                           id="username" name="username" type="text" placeholder="Ibrahim" required>
                </div>
            </div>

            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="email">
                    Adresse Email
                </label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-envelope text-gray-400"></i>
                    </div>
                    <input class="shadow appearance-none border rounded w-full py-2 pl-10 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-indigo-500 transition"
                           id="email" name="email" type="email" placeholder="exemple@email.com" required>
                </div>
            </div>

            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="password">
                    Mot de passe
                </label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-lock text-gray-400"></i>
                    </div>
                    <input class="shadow appearance-none border rounded w-full py-2 pl-10 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-indigo-500 transition"
                           id="password" name="password" type="password" placeholder="********" required>
                </div>
                <p class="text-xs text-gray-500 mt-1">Au moins 6 caractères recommandés.</p>
            </div>

            <div class="mb-6">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="confirmPassword">
                    Confirmer le mot de passe
                </label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-check-circle text-gray-400"></i>
                    </div>
                    <input class="shadow appearance-none border rounded w-full py-2 pl-10 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-indigo-500 transition"
                           id="confirmPassword" name="confirmPassword" type="password" placeholder="********" required>
                </div>
            </div>

            <div class="flex items-center justify-between">
                <button class="w-full bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline transition duration-300 transform hover:scale-105"
                        type="submit">
                    S'inscrire
                </button>
            </div>
        </form>

        <div class="mt-6 text-center">
            <p class="text-sm text-gray-600">
                Déjà un compte ?
                <a href="${pageContext.request.contextPath}/login" class="font-bold text-indigo-600 hover:text-indigo-800 transition">
                    Connectez-vous ici
                </a>
            </p>
        </div>
    </div>
</div>

</body>
</html>