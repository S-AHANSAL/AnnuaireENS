/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.octest.bdd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Driver;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import com.octest.beans.User;

/**
 *
 * @author ahansal
 */
public class UserBdd {

    private Connection connexion;

    public List<User> recupererUtilisateurs(String user, String pwd) {
        List<User> users = new ArrayList<User>();
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();

        try {
            statement = connexion.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery("SELECT * FROM `user` WHERE `user_name`='" + user + "' and `password` ='" + pwd + "';");

            // Récupération des données
            while (resultat.next()) {
                String user_a = resultat.getString("user_name");
                String password = resultat.getString("password");

                User usera = new User();

                usera.setUser(user_a);
                usera.setPassword(password);

                users.add(usera);
            }
        } catch (SQLException e) {
        } finally {
            // Fermeture de la connexion
            try {
                if (resultat != null) {
                    resultat.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connexion != null) {
                    connexion.close();
                }
            } catch (SQLException ignore) {
            }
        }

        return users;
    }

    private void loadDatabase() {
        // Chargement du driver
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
        }

        try {
            connexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/annuaireens?useSSL=false", "root", "");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
