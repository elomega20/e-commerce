package com.el.beans;

public class Livreur {
    private int identifiant;
    private String nomComplet;
    private String numeroTelephone;
    private boolean disponibilite; 

	public int getIdentifiant() {
		return identifiant;
	}
	
	public void setIdentifiant(int identifiant) {
		this.identifiant = identifiant;
	}
	
	public String getNomComplet() {
		return nomComplet;
	}
	
	public void setNomComplet(String nomComplet) {
		this.nomComplet = nomComplet;
	}
	
	public String getNumeroTelephone() {
		return numeroTelephone;
	}
	
	public void setNumeroTelephone(String numeroTelephone) {
		this.numeroTelephone = numeroTelephone;
	}
	
	public boolean isDisponibilite() {
		return disponibilite;
	}

	public void setDisponibilite(boolean disponibilite) {
		this.disponibilite = disponibilite;
	}
}
