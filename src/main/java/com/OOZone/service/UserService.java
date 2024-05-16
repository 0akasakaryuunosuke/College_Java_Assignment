package com.OOZone.service;

import com.OOZone.entity.User;

public interface UserService {
    User findUserById(Integer id);

    User findUserByNameAndPassword(String username,String password);

    User findUserByEmailAndPassword(String email, String password);

    User findUserByNameOrEmail(String username, String email);

    int addUser(String username,String email,String password);
    void updateUser(User user);
}
