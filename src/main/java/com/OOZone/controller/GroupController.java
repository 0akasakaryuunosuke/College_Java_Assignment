package com.OOZone.controller;

import com.OOZone.entity.Group;
import com.OOZone.entity.User;
import com.OOZone.service.impl.GroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class GroupController {
    @Autowired
    private GroupService groupService;

    @GetMapping("/chat")
    public String getChatPage(Model model, @SessionAttribute("USER_SESSION") User user) {
        List<Group> groups = groupService.getGroupsByUserId(user.getUserId());
        model.addAttribute("groups", groups);
        return "chat";
    }
}
