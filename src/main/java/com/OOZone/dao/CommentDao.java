package com.OOZone.dao;

import com.OOZone.entity.Comment;

import java.util.List;

public interface CommentDao {
    int addComment(Comment comment);

    List<Comment> findCommentById(Integer articleId);
}
