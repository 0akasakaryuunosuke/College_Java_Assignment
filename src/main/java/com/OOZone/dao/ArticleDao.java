package com.OOZone.dao;

import com.OOZone.entity.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleDao {
    List<Article> queryAll(@Param("offset") int offset, @Param("limit") int limit);

    int addArticle(Article article);

    int updateArticle(Article article);

    int deleteArticleById(Integer id);

    Article getArticleById(Integer id);

    List<Article> getMyArticle(Integer userId);

    List<Article> searchArticles(String keyword);
}
