package com.server.dao.mapper;

import java.util.List;

import com.server.pojo.entity.Timegoods;

public interface TimegoodsMapper {
	/**
     * 根据条件查询
     */
    List<Timegoods> selectByCondition(Timegoods record);
	/**
	 * 根据主键删除
	 */
    int deleteByPrimaryKey(String timegoodsid);
    /**
     * 选择性添加
     */
    int insertSelective(Timegoods record);
    /**
     * 根据主键查询
     */
    Timegoods selectByPrimaryKey(String timegoodsid);
    /**
     * 根据主键选择性修改
     */
    int updateByPrimaryKeySelective(Timegoods record);

}