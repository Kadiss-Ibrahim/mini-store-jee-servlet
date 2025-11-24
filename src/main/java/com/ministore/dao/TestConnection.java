package com.ministore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TestConnection {

    public static void main(String[] args) {

        try (Connection conn = DatabaseConnection.getConnection()) {

            System.out.println("Connexion réussie !");

            // Test simple : récupérer la version de PostgreSQL
            String sql = "SELECT version()";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                System.out.println("Version PostgreSQL : " + rs.getString(1));
            }

        } catch (Exception e) {
            System.out.println("Erreur !");
            e.printStackTrace();
        }
    }
}