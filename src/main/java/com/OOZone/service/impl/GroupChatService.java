package com.OOZone.service.impl;

import com.OOZone.dao.GroupChatMapper;
import com.OOZone.entity.GroupChat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GroupChatService {
    @Autowired
    private GroupChatMapper groupChatMapper;

    public List<GroupChat> getChatByGroupId(int groupId) {
        return groupChatMapper.getChatByGroupId(groupId);
    }

    public void addChatMessage(GroupChat groupChat) {
        groupChatMapper.addChatMessage(groupChat);
    }
}
