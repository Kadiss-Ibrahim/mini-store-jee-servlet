<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Page non trouvée - MiniStore</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

<div class="text-center">
    <div class="text-indigo-600 mb-4">
        <i class="fas fa-ghost text-9xl animate-bounce"></i>
    </div>

    <h1 class="text-9xl font-extrabold text-gray-800 tracking-widest">404</h1>

    <div class="bg-indigo-600 px-2 text-sm rounded rotate-12 absolute">
        Page introuvable
    </div>

    <div class="mt-8">
        <h3 class="text-2xl font-semibold md:text-3xl text-gray-800 mb-4">
            Oups ! Vous semblez perdu.
        </h3>
        <p class="text-gray-500 mb-8">
            La page que vous recherchez n'existe pas ou a été déplacée.
        </p>

        <a href="${pageContext.request.contextPath}/products"
           class="px-8 py-3 border border-transparent text-base font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 md:py-4 md:text-lg transition duration-300">
            <i class="fas fa-home mr-2"></i> Retour au catalogue
        </a>
    </div>
</div>

</body>
</html>