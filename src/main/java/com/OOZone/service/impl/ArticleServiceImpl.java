package com.OOZone.service.impl;

import com.OOZone.dao.ArticleDao;
import com.OOZone.dao.CommentDao;
import com.OOZone.entity.Article;
import com.OOZone.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.core.*;

import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleDao articleDao;

    @Autowired
    private CommentDao commentDao;

    @Override
    public List<Article> getList(int start,int pageNum){
        return articleDao.queryAll(start, pageNum);
    }

    @Override
    public int addArticle(Article article){
        return articleDao.addArticle(article);
    }

    @Override
    public int updateArticle(Article article){
        return articleDao.updateArticle(article);
    }

    @Override
    public int deleteArticleById(Integer id){
        return articleDao.deleteArticleById(id);
    }

    @Override
    public Article getArticleById(Integer id){
        return articleDao.getArticleById(id);
    }

    @Override
    public List<Article> getMyArticle(Integer userId){
        return articleDao.getMyArticle(userId);
    }

    @Override
    public List<Article> searchArticles(String keyword) {
        return articleDao.searchArticles(keyword);
    }

}
