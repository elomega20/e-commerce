package com.el.database.articles;

import java.util.List;
import java.util.Map;

import com.el.beans.Article;
import com.el.beans.Categorie;
import com.el.beans.Commande;
import com.el.exceptions.DaoException;

/*On utilise une interface pour définir 
 * les méthodes d'accès aux données des articles, 
 * indépendamment de la méthode de stockage. On indique 
 * juste des noms de méthodes ici.*/

public interface ArticleDao {
    public Map<String, List<Article>> consulterCatalogue() throws DaoException;
    public Map<String, List<Article>> rechercherArticleParMotCle(String motCles) throws DaoException;
    public Article rechercherArticleViaSonIdentifiant(int idArticle) throws DaoException;
    public List<Article> rechercherArticleViaSonCategorie(Categorie categorie) throws DaoException;
    public boolean ajouterArticleDansLaBase(Article article) throws DaoException;
    public boolean supprimerArticleDansLaBase(Article article) throws DaoException;
    public boolean mettreAjourPrixUnitaireArticle(Article article,int nouveauPrixUnitaire) throws DaoException;
    public boolean mettreAjourStockArticle(Article article,int nouveauStock) throws DaoException;
}
