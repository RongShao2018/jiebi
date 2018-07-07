package com.rong.service.impl;

import com.rong.dao.IFFundDao;
import com.rong.model.FFund;
import com.rong.service.IFFundService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by rongjie on 2017/12/5.
 */
@Service("fFundService")
public class FFundServiceImpl implements IFFundService{

    @Resource
    public IFFundDao fundDao;

    public FFund selectFFund(String fId){ return this.fundDao.selectFFund(fId);}

    public int updateBudget(FFund fFund){ return this.fundDao.updateBudget(fFund);}

    public int updateCapital(FFund fFund){ return this.fundDao.updateCapital(fFund);}
}
