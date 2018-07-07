package com.rong.service.impl;

import com.rong.dao.IUserDao;
import com.rong.model.User;
import com.rong.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by rongjie on 2017/12/4.
 */
@Service("userService")
public class UserServiceImpl implements IUserService {

    @Resource
    public IUserDao userDao;

    public User selectUser(String userId) {
        return this.userDao.selectUser(userId);
    }

    public boolean login(String userId,String passwird)
    {
        if(this.userDao.selectUser(userId).getPassword().equals(passwird))
            return true;
        else
            return false;
    }

    public int regist(User user)
    {
        return this.userDao.addUser(user);
    }

    public int delete(String userid)
    {
        return this.userDao.deleteUser(userid);
    }

    public int updateUser(User user)
    {
        return  this.userDao.updateUserPW(user);
    }

}
