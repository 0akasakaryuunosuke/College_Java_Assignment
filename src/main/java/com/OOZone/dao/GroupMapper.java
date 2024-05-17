package com.OOZone.dao;

import com.OOZone.entity.Group;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface GroupMapper {
    @Select("SELECT * FROM f_group")
    List<Group> getAllGroups();

    @Select("SELECT * FROM f_group WHERE group_id IN (SELECT group_id FROM f_group_user WHERE user_id = #{userId})")
    List<Group> getGroupsByUserId(int userId);

    @Select("SELECT COUNT(*) FROM f_group_user WHERE group_id = #{groupId}")
    int getMemberCount(int groupId);
}
