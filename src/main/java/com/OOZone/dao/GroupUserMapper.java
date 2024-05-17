package com.OOZone.dao;
import com.OOZone.entity.GroupUser;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface GroupUserMapper {
    @Select("SELECT * FROM f_group_user WHERE group_id = #{groupId}")
    List<GroupUser> getUsersByGroupId(int groupId);

    @Insert("INSERT INTO f_group_user (group_id, user_id, join_date) VALUES (#{groupId}, #{userId}, NOW())")
    void joinGroup(@Param("groupId") int groupId, @Param("userId") int userId);

    @Delete("DELETE FROM f_group_user WHERE group_id = #{groupId} AND user_id = #{userId}")
    void leaveGroup(@Param("groupId") int groupId, @Param("userId") int userId);
}
