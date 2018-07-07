package com.rong.service;

import com.rong.model.UFund;

import java.util.List;

/**
 * Created by rongjie on 2017/12/5.
 */
public interface IUFundService {

    public UFund selectUFund(String id);
    public List<UFund> selectUFundByFId(String fId);
    public int updateUBudget(UFund uFund);
}
