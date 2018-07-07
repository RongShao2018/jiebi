package com.rong.dao;

import com.rong.model.In;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by rongjie on 2017/12/6.
 */
public interface IInDao {

    public int insert(In in);

    public List<In> selectInToday(String id);

    public List<In> selectInYesterday(String id);

    public List<In> selectInSevenDay(String id);

    public List<In> selectInMonth(String id);

    public List<In> selectInById(String id);

    public List<In> Amo500(String id);

    public List<In> Amo2000(String id);

    public List<In> Amobeyond2000(String id);

    public List<In> SelectSort(@Param("id") String id, @Param("sort") String sort);
}
