package com.rong.dao;

import com.rong.model.FFund;

/**
 * Created by rongjie on 2017/12/5.
 */
public interface IFFundDao {

    public FFund selectFFund(String fId);

    public int updateBudget(FFund fFund);

    public int updateCapital(FFund fFund);
}
