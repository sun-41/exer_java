package com.myspring.projectEx.commute.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import com.myspring.projectEx.commute.vo.CommuteVO;

public interface CommuteService {
	 public List listCommute() throws DataAccessException;
	 public int addCommute(CommuteVO commuteVO) throws DataAccessException;
	 public int removeCommute(String id) throws DataAccessException;
	 public CommuteVO login(CommuteVO commuteVO) throws Exception;
}
