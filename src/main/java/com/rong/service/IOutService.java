package com.rong.service;

import com.rong.model.Out;

import java.sql.Date;
import java.util.List;

/**
 * Created by rongjie on 2017/12/6.
 */
public interface IOutService {
    public int insertOut(Out out);
    public List<Out> selectAmoToday(String id);
    public List<Out> selectAmoYesterday(String id);
    public List<Out> selectAmoSevenDay(String id);
    public List<Out> selectAmoMonth(String id);
    public List<Out> selectById(String id);
    public List<Out> selectByIdDate(String id, Date date);
    public List<Out> Amo500(String id);
    public List<Out> Amo2000(String id);
    public List<Out> Amobeyond2000(String id);
    public List<Out> SelectSort(String id, String sort);
    public List<Out> SelectSortMonth(String id, String sort);
}
