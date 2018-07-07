package com.rong.service;

import com.rong.model.In;

import java.util.List;

/**
 * Created by rongjie on 2017/12/6.
 */
public interface IInService {

    public int insertIn(In in);

    public List<In> selectInToday(String id);

    public List<In> selectInYesterday(String id);

    public List<In> selectInSevenDay(String id);

    public List<In> selectInMonth(String id);

    public List<In> selectInById(String id);

    public List<In> Amo500(String id);

    public List<In> Amo2000(String id);

    public List<In> Amobeyond2000(String id);

    public List<In> SelectSort(String id, String sort);
}
