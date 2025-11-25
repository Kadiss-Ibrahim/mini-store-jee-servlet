package com.ministore.servlet;

import com.ministore.dao.UserDao;
import com.ministore.model.AppUser;
import org.mindrot.jbcrypt.BCrypt;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDao userDao;

    public void init() {
        userDao = new UserDao(); }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Le fichier est protégé dans WEB-INF, on doit utiliser forward()
        req.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Hachage et Sauvegarde
        String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
        AppUser user = new AppUser(username, email, hashed);
        userDao.save(user);

        resp.sendRedirect(req.getContextPath() + "/login");
    }
}