package com.rong.service;

import com.rong.model.User;

/**
 * Created by rongjie on 2017/12/4.
 */
public interface IUserService {
    public User selectUser(String userId);
    public boolean login(String userId,String password);
    public int regist(User user);
    public int delete(String userId);
    public int updateUser(User user);
}
