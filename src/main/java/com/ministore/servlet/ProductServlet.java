package com.ministore.servlet;

import com.ministore.dao.ProductDao;
import com.ministore.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/products/*")
public class ProductServlet extends HttpServlet {

    private ProductDao productDao;

    public void init() {
        productDao = new ProductDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getPathInfo(); // Récupère ce qu'il y a après /products

        if (action == null || action.equals("/")) {
            listProducts(req, resp);
        } else if (action.equals("/new")) {
            showNewForm(req, resp);
        } else if (action.equals("/edit")) {
            showEditForm(req, resp);
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND); // 404
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getPathInfo();

        if (action == null || action.equals("/insert")) {
            insertProduct(req, resp);
        } else if (action.equals("/update")) {
            updateProduct(req, resp);
        } else if (action.equals("/delete")) {
            deleteProduct(req, resp);
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    // --- Méthodes privées pour organiser le code ---

    private void listProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> listProducts = productDao.findAll();
        req.setAttribute("products", listProducts);
        req.getRequestDispatcher("/WEB-INF/views/product/list.jsp").forward(req, resp);
    }

    private void showNewForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/product/form.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        Product existingProduct = productDao.findById(id);
        req.setAttribute("product", existingProduct);
        req.getRequestDispatcher("/WEB-INF/views/product/form.jsp").forward(req, resp);
    }

    private void insertProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        BigDecimal price = new BigDecimal(req.getParameter("price"));
        String description = req.getParameter("description");

        Product newProduct = new Product(name, price, description);
        productDao.save(newProduct);
        resp.sendRedirect(req.getContextPath() + "/products");
    }

    private void updateProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        String name = req.getParameter("name");
        BigDecimal price = new BigDecimal(req.getParameter("price"));
        String description = req.getParameter("description");

        Product product = new Product(name, price, description);
        product.setId(id);
        productDao.update(product);
        resp.sendRedirect(req.getContextPath() + "/products");
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        productDao.delete(id);
        resp.sendRedirect(req.getContextPath() + "/products");
    }
}