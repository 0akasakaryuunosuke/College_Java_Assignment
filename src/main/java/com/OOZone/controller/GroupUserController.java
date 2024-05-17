package com.OOZone.controller;

import com.OOZone.entity.GroupUser;
import com.OOZone.service.impl.GroupUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/chat")
public class GroupUserController {
    @Autowired
    private GroupUserService groupUserService;

    @PostMapping("/join")
    public void joinGroup(@RequestBody GroupUser groupUser) {
        groupUserService.joinGroup(groupUser.getGroupId(), groupUser.getUserId());
    }

    @PostMapping("/leave")
    public void leaveGroup(@RequestBody GroupUser groupUser) {
        groupUserService.leaveGroup(groupUser.getGroupId(), groupUser.getUserId());
    }
}

