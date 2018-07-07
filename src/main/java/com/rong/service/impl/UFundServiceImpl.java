package com.rong.service.impl;

import com.rong.dao.IUFundDao;
import com.rong.model.UFund;
import com.rong.service.IUFundService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by rongjie on 2017/12/5.
 */
@Service("uFundService")
public class UFundServiceImpl implements IUFundService{

    @Resource
    public IUFundDao uFundDao;


    public UFund selectUFund(String id) {
        return this.uFundDao.selectUFund(id);
    }

    public List<UFund> selectUFundByFId(String fId){ return this.uFundDao.selectUFundByFId(fId);}

    public int updateUBudget(UFund uFund){ return this.uFundDao.updateUBudget(uFund);}
}
