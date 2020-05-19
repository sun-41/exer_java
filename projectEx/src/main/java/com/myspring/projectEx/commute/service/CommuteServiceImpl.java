package com.myspring.projectEx.commute.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.projectEx.commute.dao.CommuteDAO;
import com.myspring.projectEx.commute.vo.CommuteVO;

@Service("commuteService")
@Transactional(propagation = Propagation.REQUIRED)
public class CommuteServiceImpl implements CommuteService {
	@Autowired
	private CommuteDAO commuteDAO;

	@Override
	public List listCommute() throws DataAccessException {
		List commutesList = null;
		commutesList = commuteDAO.selectAllCommuteList();
		return commutesList;
	}

	@Override
	public int addCommute(CommuteVO commute) throws DataAccessException {
		return commuteDAO.insertCommute(commute);
	}

	@Override
	public int removeCommute(String id) throws DataAccessException {
		return commuteDAO.deleteCommute(id);
	}
	
	@Override
	public CommuteVO login(CommuteVO commuteVO) throws Exception{
		return commuteDAO.loginById(commuteVO);
	}
}
