package com.OOZone.service.impl;

import com.OOZone.dao.CommentDao;
import com.OOZone.entity.Comment;
import com.OOZone.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentDao commentDao;

    @Override
    public List<Comment> findCommentById(Integer articleId){
        return commentDao.findCommentById(articleId);
    }

    @Override
    public int addComment(Comment comment){
        return commentDao.addComment(comment);
    }
}
