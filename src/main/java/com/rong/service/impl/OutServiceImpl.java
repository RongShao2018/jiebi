package com.rong.service.impl;

import com.rong.dao.IOutDao;
import com.rong.model.Out;
import com.rong.service.IOutService;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Date;
import java.util.List;

/**
 * Created by rongjie on 2017/12/6.
 */
@Service("outService")
public class OutServiceImpl implements IOutService{

    @Resource
    public IOutDao outDao;

    public int insertOut(Out out)
    {
        return this.outDao.insert(out);
    }

    public List<Out> selectAmoToday(String id){return this.outDao.selectAmoToday(id);}

    public List<Out> selectAmoYesterday(String id){return this.outDao.selectAmoYesterday(id);}

    public List<Out> selectAmoSevenDay(String id){return this.outDao.selectAmoSevenDay(id);}

    public List<Out> selectAmoMonth(String id){return this.outDao.selectAmoMonth(id);}

    public List<Out> selectById(String id){return this.outDao.selectById(id);}

    public List<Out> selectByIdDate(String id, Date date){return this.outDao.selectByIdDate(id,date);}

    public List<Out> Amo500(String id){return this.outDao.Amo500(id); }

    public List<Out> Amo2000(String id){ return this.outDao.Amo2000(id);}

    public List<Out> Amobeyond2000(String id){ return this.outDao.Amobeyond2000(id);}

    public List<Out> SelectSort(String id, String sort){ return this.outDao.SelectSort(id,sort);}

    public List<Out> SelectSortMonth(String id, String sort){ return this.outDao.SelectSortMonth(id,sort);}
}
