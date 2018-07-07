package com.rong.service.impl;

import com.rong.dao.IInDao;
import com.rong.model.In;
import com.rong.service.IInService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by rongjie on 2017/12/6.
 */
@Service("inService")
public class InServiceImpl implements IInService{

    @Resource
    public IInDao inDao;
    public int insertIn(In in)
    {
        return this.inDao.insert(in);
    }

    public List<In> selectInToday(String id){ return this.inDao.selectInToday(id);}

    public List<In> selectInYesterday(String id){ return this.inDao.selectInYesterday(id);}

    public List<In> selectInSevenDay(String id){ return  this.inDao.selectInSevenDay(id);}

    public List<In> selectInMonth(String id){ return this.inDao.selectInMonth(id);}

    public List<In> selectInById(String id){ return this.inDao.selectInById(id);}

    public List<In> Amo500(String id){ return this.inDao.Amo500(id);}

    public List<In> Amo2000(String id){ return this.inDao.Amo2000(id);}

    public List<In> Amobeyond2000(String id){ return this.inDao.Amobeyond2000(id);}

    public List<In> SelectSort(String id, String sort){ return this.inDao.SelectSort(id,sort);}
}
