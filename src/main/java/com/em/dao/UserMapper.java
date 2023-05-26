package com.em.dao;

import com.em.domain.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

/**
 * Created by Admiral on 2018/1/19.
 */
public interface UserMapper {
    @Select("select * from user where id=#{id}")
    public User findUserById(@Param("id") String id);

    public void addNewUser(User user);
    
    public void updateUser(User user);
}
