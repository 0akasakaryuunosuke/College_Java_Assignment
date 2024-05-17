package com.OOZone.dao;

import com.OOZone.entity.GroupChat;
import org.apache.ibatis.annotations.*;

import java.util.List;

import org.apache.ibatis.annotations.*;

import java.util.List;

import org.apache.ibatis.annotations.*;

import java.util.List;

public interface GroupChatMapper {
    @Select("SELECT gc.*, (SELECT u.user_name FROM f_user u WHERE u.user_id = gc.user_id) AS userName " +
            "FROM f_group_chat gc WHERE gc.group_id = #{groupId}")
    List<GroupChat> getChatByGroupId(int groupId);

    @Insert("INSERT INTO f_group_chat (group_id, user_id, message, timestamp) VALUES (#{groupId}, #{userId}, #{message}, NOW())")
    void addChatMessage(GroupChat groupChat);
}

