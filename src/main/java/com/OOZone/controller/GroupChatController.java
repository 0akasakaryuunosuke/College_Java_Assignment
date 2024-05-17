package com.OOZone.controller;

import com.OOZone.entity.GroupChat;
import com.OOZone.service.impl.GroupChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/chat")
public class GroupChatController {
    @Autowired
    private GroupChatService groupChatService;

    @GetMapping("/messages")
    public List<GroupChat> getMessages(@RequestParam int groupId) {
        return groupChatService.getChatByGroupId(groupId);
    }

    @PostMapping("/send")
    public void sendMessage(@RequestBody GroupChat groupChat) {
        groupChatService.addChatMessage(groupChat);
    }
}

