package com.rong.dao;

import com.rong.model.User;

/**
 * Created by rongjie on 2017/12/4.
 */
public interface IUserDao {

    public User selectUser(String userId);
    public int addUser(User user);
    public int deleteUser(String userId);
    public int updateUserPW(User user);
}
