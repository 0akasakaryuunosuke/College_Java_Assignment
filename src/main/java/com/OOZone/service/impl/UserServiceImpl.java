package com.OOZone.service.impl;

import com.OOZone.dao.UserDao;
import com.OOZone.entity.User;
import com.OOZone.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    //test byId
    public User findUserById(Integer id){
        return this.userDao.findUserById(id);
    }

    @Override
    public User findUserByNameAndPassword(String username,String password){
        User user = this.userDao.findUserByNameAndPassword(username,password);
        return user;
    }

    @Override
    public User findUserByEmailAndPassword(String email, String password){
        User user = this.userDao.findUserByEmailAndPassword(email,password);
        return user;
    }

    @Override
    public User findUserByNameOrEmail(String username,String email){
        User user = this.userDao.findUserByNameOrEmail(username,email);
        return user;
    }

    @Override
    public int addUser(String username,String email,String password){
        return this.userDao.addUser(username,email,password);
    }
    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

}
