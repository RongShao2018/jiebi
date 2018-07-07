package com.rong.dao;

import com.rong.model.Out;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.util.List;


/**
 * Created by rongjie on 2017/12/6.
 */
public interface IOutDao {
    public List<Out> selectAmoToday(String id);
    public List<Out> selectAmoYesterday(String id);
    public List<Out> selectAmoSevenDay(String id);
    public List<Out> selectAmoMonth(String id);
    public int insert(Out out);
    public List<Out> selectById(String id);
    public List<Out> selectByIdDate(@Param("id")String id, @Param("date")Date date);
    public List<Out> Amo500(String id);
    public List<Out> Amo2000(String id);
    public List<Out> Amobeyond2000(String id);
    public List<Out> SelectSort(@Param("id")String id, @Param("sort")String sort);
    public List<Out> SelectSortMonth(@Param("id")String id, @Param("sort")String sort);
}
