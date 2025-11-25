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
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "Veuillez remplir tous les champs.");
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
            return;
        }

        AppUser user = userDao.findByEmail(email);

        if (user != null && BCrypt.checkpw(password, user.getPasswordHash())) {

            // 1. Création de la session HTTP
            HttpSession session = request.getSession();

            // 2. On stocke l'objet utilisateur (sans le mot de passe idéalement, mais l'objet User convient ici)
            session.setAttribute("user", user);

            // 3. Redirection vers la page d'accueil de l'application (liste des produits)
            response.sendRedirect(request.getContextPath() + "/products");

        } else {

            request.setAttribute("error", "Email ou mot de passe incorrect.");
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
        }
    }
}