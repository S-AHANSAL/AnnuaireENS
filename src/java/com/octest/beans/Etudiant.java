package com.octest.beans;

public class Etudiant {

    private int idf;
    private String cne;
    private String nom;
    private String prenom;
    private String telephone;
    private String nom_f;
    private String nom_d;
    
    
    public String getCne() {
        return cne;
    }

    public void setCne(String cne) {
        this.cne = cne;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public int getIdf() {
        return idf;
    }

    public void setIdf(int idf) {
        this.idf = idf;
    }

    public String getNom_f() {
        return nom_f;
    }

    public void setNom_f(String nom_f) {
        this.nom_f = nom_f;
    }

    public String getNom_d() {
        return nom_d;
    }
    
    public void setNom_d(String nom_d) {
        this.nom_d = nom_d;
    }
}
