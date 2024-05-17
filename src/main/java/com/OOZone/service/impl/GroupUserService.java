package com.OOZone.service.impl;

import com.OOZone.dao.GroupUserMapper;
import com.OOZone.entity.GroupUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GroupUserService {
    @Autowired
    private GroupUserMapper groupUserMapper;

    public List<GroupUser> getUsersByGroupId(int groupId) {
        return groupUserMapper.getUsersByGroupId(groupId);
    }

    public void joinGroup(int groupId, int userId) {
        groupUserMapper.joinGroup(groupId, userId);
    }

    public void leaveGroup(int groupId, int userId) {
        groupUserMapper.leaveGroup(groupId, userId);
    }
}