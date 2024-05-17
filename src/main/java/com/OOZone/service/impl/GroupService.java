package com.OOZone.service.impl;

import com.OOZone.dao.GroupMapper;
import com.OOZone.entity.Group;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GroupService {
    @Autowired
    private GroupMapper groupMapper;

    public List<Group> getGroupsByUserId(int userId) {
        List<Group> groups = groupMapper.getGroupsByUserId(userId);
        for (Group group : groups) {
            group.setMemberCount(groupMapper.getMemberCount(group.getGroupId()));
        }
        return groups;
    }
}
