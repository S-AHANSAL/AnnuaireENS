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

import com.octest.beans.Filiere;

/**
 *
 * @author ahansal
 */
public class FiliereBdd {

    private Connection connexion;

    public List<Filiere> recupererUtilisateurs() {
        List<Filiere> filieres = new ArrayList<Filiere>();
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();

        try {
            statement = connexion.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery("SELECT * FROM filieres INNER JOIN departements ON  departements.id = filieres.id_dep WHERE 1;");

            // Récupération des données
            while (resultat.next()) {
                String nom = resultat.getString("Nom_f");
                String date = resultat.getString("Date");
                String Nom_D = resultat.getString("Nom_Depa");

                Filiere filiere = new Filiere();
                filiere.setNom(nom);
                filiere.setDate(date);
                filiere.setNom_d(Nom_D);
                filieres.add(filiere);
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

        return filieres;
    }

    public List<Filiere> FiliereRecherche(String mot) {
        List<Filiere> filieres = new ArrayList<Filiere>();
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();

        try {
            statement = connexion.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery("SELECT * FROM filieres INNER JOIN departements ON  departements.id = filieres.id_dep WHERE filieres.Nom_f like '%" + mot + "%' OR departements.Nom_Depa like '%" + mot + "%';");

            // Récupération des données
            while (resultat.next()) {
                String nom = resultat.getString("Nom_f");
                String date = resultat.getString("Date");
                String Nom_D = resultat.getString("Nom_Depa");

                Filiere filiere = new Filiere();
                filiere.setNom(nom);
                filiere.setDate(date);
                filiere.setNom_d(Nom_D);
                filieres.add(filiere);
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

        return filieres;
    }

    public List<Filiere> recupererFiliereDep(int id) {
        List<Filiere> filieres = new ArrayList<Filiere>();
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();

        try {
            statement = connexion.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery("SELECT * FROM `filieres` WHERE `id_dep` =" + id + ";");

            // Récupération des données
            while (resultat.next()) {
                int id_f = resultat.getInt("id_f");
                String nom = resultat.getString("Nom_f");
                String date = resultat.getString("Date");

                Filiere filiere = new Filiere();
                filiere.setId(id_f);
                filiere.setNom(nom);
                filiere.setDate(date);
                filieres.add(filiere);

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

        return filieres;
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

    public void ajouterUtilisateur(Filiere filiere) {
        loadDatabase();
        try {
            PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO `filieres`(`Nom_f`, `id_dep`, `Date`) VALUES (?,?,?);");
            preparedStatement.setString(1, filiere.getNom());
            preparedStatement.setInt(2, filiere.getDepartement());
            preparedStatement.setString(3, filiere.getDate());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
