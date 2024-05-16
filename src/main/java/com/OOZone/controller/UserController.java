package com.OOZone.controller;

import com.OOZone.entity.User;
import com.OOZone.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("/findUserById")
    private String findUserById(Integer id, Model model){
        User user = userService.findUserById(id);
        model.addAttribute("user",user);
        System.out.println(user);
        return "userCenter";
    }

    //login by name or email
    @RequestMapping(value = "/toLogin",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
    private String login(String username, String password, Model model, HttpSession session){
        User user = userService.findUserByNameAndPassword(username,password);
        if(user!=null){
            session.setAttribute("USER_SESSION",user);
            System.out.println(user);
            return "redirect:articleList ";
        }else{
            User user2 = userService.findUserByEmailAndPassword(username,password);
            if(user2!=null){
                session.setAttribute("USER_SESSION",user2);
                System.out.println(user2);
                return "redirect:articleList ";
            }
            model.addAttribute("msg","账号或密码错误");
            return "login";
        }
    }

    //logout
    @RequestMapping(value = "/logout")
    private String logout(HttpSession session){
        session.invalidate();
        return "redirect:articleList";
    }

    //注册并登录
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    private String register(String username,String password,String email,Model model,HttpSession session){
        User user2 = userService.findUserByNameOrEmail(username,email);
        if (user2!=null){
            model.addAttribute("msg","该用户名或邮箱已被注册");
            return "register";
        }else {
            int user3 = userService.addUser(username, email, password);

            User user4 = userService.findUserByNameAndPassword(username,password);
            session.setAttribute("USER_SESSION",user4);
            System.out.println(user4);
            return "redirect:articleList";
        }
    }
    @RequestMapping(value = "/updateUser", method = RequestMethod.POST,consumes = "application/json")
    public String updateUser(@RequestBody User user) {
        userService.updateUser(user);
        return "userCenter";
    }
    @GetMapping("/userCenter")
    public String userCenterPage(Model model) {
        // 可以在这里加载用户数据
        return "userCenter";  // 返回视图名称，假设视图文件为 userCenter.jsp
    }
}
