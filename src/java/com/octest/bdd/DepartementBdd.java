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

import com.octest.beans.Departement;

/**
 *
 * @author ahansal
 */
public class DepartementBdd {

    private Connection connexion;

    public List<Departement> recupererUtilisateurs() {
        List<Departement> departements = new ArrayList<Departement>();
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();

        try {
            statement = connexion.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery("SELECT * FROM `departements` WHERE 1;");

            // Récupération des données
            while (resultat.next()) {
                int id = resultat.getInt("id");
                String nom = resultat.getString("Nom_Depa");
                String date = resultat.getString("Date");

                Departement departement = new Departement();
                departement.setId(id);
                departement.setNom(nom);
                departement.setDate(date);
                departements.add(departement);
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

        return departements;
    }

    public List<Departement> DepartementRecherche(String mot) {
        List<Departement> departements = new ArrayList<Departement>();
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();

        try {
            statement = connexion.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery("SELECT * FROM `departements` WHERE `Nom_Depa` like  '%" + mot + "%' ;");

            // Récupération des données
            while (resultat.next()) {
                int id = resultat.getInt("id");
                String nom = resultat.getString("Nom_Depa");
                String date = resultat.getString("Date");

                Departement departement = new Departement();
                departement.setId(id);
                departement.setNom(nom);
                departement.setDate(date);
                departements.add(departement);
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

        return departements;
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

    public void ajouterUtilisateur(Departement departement) {
        loadDatabase();
        try {
            PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO `departements`(`Nom_Depa`, `Date`) VALUES (?,?);");
            preparedStatement.setString(1, departement.getNom());
            preparedStatement.setString(2, departement.getDate());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
