<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Erreur Serveur - MiniStore</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen p-4">

<div class="w-full max-w-2xl bg-white shadow-xl rounded-lg overflow-hidden border-t-8 border-red-500">

    <div class="p-8 text-center">
        <div class="text-red-500 mb-4">
            <i class="fas fa-bug text-6xl"></i>
        </div>

        <h1 class="text-4xl font-bold text-gray-800 mb-2">Erreur Interne du Serveur (500)</h1>
        <p class="text-gray-600 mb-6">
            Quelque chose s'est mal passé de notre côté. Nos ingénieurs ont été notifiés.
        </p>

        <div class="flex justify-center gap-4">
            <a href="${pageContext.request.contextPath}/products"
               class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded transition">
                Retourner à l'accueil
            </a>
            <button onclick="window.location.reload();"
                    class="bg-red-500 hover:bg-red-600 text-white font-bold py-2 px-4 rounded transition">
                Réessayer
            </button>
        </div>
    </div>

    <div class="bg-gray-900 p-6 text-left">
        <p class="text-gray-400 text-sm font-bold uppercase mb-2">Détails de l'erreur (Mode Débogage) :</p>

        <div class="bg-black text-green-400 p-4 rounded font-mono text-xs overflow-auto max-h-64 shadow-inner">
            <p class="mb-2"><strong>Message :</strong> ${exception.message}</p>
            <p class="mb-2"><strong>Cause :</strong> ${exception.cause}</p>

            <div class="whitespace-pre-wrap">
                <%
                    // Petit scriptlet pour imprimer la stack trace proprement dans la page HTML
                    if (exception != null) {
                        java.io.StringWriter sw = new java.io.StringWriter();
                        java.io.PrintWriter pw = new java.io.PrintWriter(sw);
                        exception.printStackTrace(pw);
                        out.print(sw.toString());
                    }
                %>
            </div>
        </div>
    </div>
</div>

</body>
</html>