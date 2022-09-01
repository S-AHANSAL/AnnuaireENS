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

import com.octest.beans.Etudiant;

public class EtudiantBdd {

    private Connection connexion;

    public List<Etudiant> recupererUtilisateurs() {
        List<Etudiant> etudiants = new ArrayList<Etudiant>();
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();

        try {
            statement = connexion.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery("SELECT * FROM etudiants INNER JOIN filieres INNER JOIN departements ON etudiants.id_filieres=filieres.id_f AND departements.id = filieres.id_dep WHERE 1;");

            // Récupération des données
            while (resultat.next()) {
                String nom = resultat.getString("nom");
                String prenom = resultat.getString("prenom");
                String cne = resultat.getString("cne");
                String telephone = resultat.getString("telephone");
                String Nom_f = resultat.getString("Nom_f");
                String Nom_D = resultat.getString("Nom_Depa");

                Etudiant etudiant = new Etudiant();

                etudiant.setNom(nom);
                etudiant.setPrenom(prenom);
                etudiant.setCne(cne);
                etudiant.setTelephone(telephone);
                etudiant.setNom_f(Nom_f);
                etudiant.setNom_d(Nom_D);

                etudiants.add(etudiant);
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

        return etudiants;
    }

    public List<Etudiant> RechercheEtudiant(String mot) {
        List<Etudiant> etudiants = new ArrayList<Etudiant>();
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();

        try {
            statement = connexion.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery("SELECT * FROM etudiants INNER JOIN filieres INNER JOIN departements ON etudiants.id_filieres=filieres.id_f AND departements.id = filieres.id_dep WHERE etudiants.cne like  '%" + mot + "%' OR etudiants.nom like  '%" + mot + "%' OR etudiants.prenom like  '%" + mot + "%' OR etudiants.telephone like  '%" + mot + "%' OR filieres.Nom_f like  '%" + mot + "%' OR departements.Nom_Depa like  '%" + mot + "%';");

            // Récupération des données
            while (resultat.next()) {
                String nom = resultat.getString("nom");
                String prenom = resultat.getString("prenom");
                String cne = resultat.getString("cne");
                String telephone = resultat.getString("telephone");
                String Nom_f = resultat.getString("Nom_f");
                String Nom_D = resultat.getString("Nom_Depa");

                Etudiant etudiant = new Etudiant();

                etudiant.setNom(nom);
                etudiant.setPrenom(prenom);
                etudiant.setCne(cne);
                etudiant.setTelephone(telephone);
                etudiant.setNom_f(Nom_f);
                etudiant.setNom_d(Nom_D);

                etudiants.add(etudiant);
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

        return etudiants;
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

    public void ajouterUtilisateur(Etudiant etudiant) {
        loadDatabase();
        /*  Statement statement = null;*/
        try {
            PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO `etudiants`(`cne`, `nom`, `prenom`, `telephone`, `id_filieres`) VALUES (?,?,?,?,?);");
            preparedStatement.setString(1, etudiant.getCne());
            preparedStatement.setString(2, etudiant.getNom());
            preparedStatement.setString(3, etudiant.getPrenom());
            preparedStatement.setString(4, etudiant.getTelephone());
            preparedStatement.setInt(5, etudiant.getIdf());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
