package com.OOZone.service;

import com.OOZone.entity.Comment;

import java.util.List;

public interface CommentService {
    List<Comment> findCommentById(Integer articleId);

    int addComment(Comment comment);
}
