package com.myspring.projectEx.commute.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.projectEx.commute.vo.ArticleworkVO;
import com.myspring.projectEx.commute.vo.CommuteVO;


public interface CommuteDAO {
	 public List selectAllCommuteList() throws DataAccessException;
	 public int insertCommute(CommuteVO commuteVO) throws DataAccessException ;
	 public int deleteCommute(String id) throws DataAccessException;
	 public CommuteVO loginById(CommuteVO commuteVO) throws DataAccessException;
	 public int insertCommute(ArticleworkVO commuteVO) throws DataAccessException ;

}
