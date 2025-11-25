package com.ministore.dao;

import com.ministore.model.AppUser;
import java.sql.*;

public class UserDao {

    private static final String INSERT_USER_SQL = "INSERT INTO app_user (username, email, password_hash) VALUES (?, ?, ?)";
    private static final String SELECT_USER_BY_EMAIL = "SELECT * FROM app_user WHERE email = ?";

    public void save(AppUser user) {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {

            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPasswordHash());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(); // Gérer l'erreur proprement (log ou exception personnalisée)
        }
    }


    public AppUser findByEmail(String email) {
        AppUser user = null;
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_EMAIL)) {

            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                user = new AppUser();
                user.setId(rs.getLong("id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPasswordHash(rs.getString("password_hash"));
                // Conversion Timestamp SQL -> LocalDateTime Java
                Timestamp timestamp = rs.getTimestamp("created_at");
                if (timestamp != null) {
                    user.setCreatedAt(timestamp.toLocalDateTime());
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}