package com.ministore.servlet;

import com.ministore.dao.UserDao;
import com.ministore.model.AppUser;
import org.mindrot.jbcrypt.BCrypt;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserDao userDao;

    @Override
    public void init() {
        this.userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Si l'utilisateur est déjà connecté, on le redirige directement vers les produits
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }
        // Sinon, on affiche la JSP qui se trouve dans le dossier protégé WEB-INF
        request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
    }

    // 2. Traite la soumission du formulaire (POST)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validation basique
        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "Veuillez remplir tous les champs.");
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
            return;
        }

        // Recherche de l'utilisateur en base de données
        AppUser user = userDao.findByEmail(email);

        // Vérification : L'utilisateur existe ET le mot de passe correspond au hachage
        if (user != null && BCrypt.checkpw(password, user.getPasswordHash())) {

            // --- SUCCÈS ---
            // 1. Création de la session HTTP
            HttpSession session = request.getSession();

            // 2. On stocke l'objet utilisateur (sans le mot de passe idéalement, mais l'objet User convient ici)
            session.setAttribute("user", user);

            // 3. Redirection vers la page d'accueil de l'application (liste des produits)
            response.sendRedirect(request.getContextPath() + "/products");

        } else {

            // --- ÉCHEC ---
            // On renvoie vers la page de login avec un message d'erreur
            request.setAttribute("error", "Email ou mot de passe incorrect.");
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
        }
    }
}