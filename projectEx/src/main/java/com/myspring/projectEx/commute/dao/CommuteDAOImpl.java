package com.myspring.projectEx.commute.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.projectEx.commute.vo.ArticleworkVO;
import com.myspring.projectEx.commute.vo.CommuteVO;

@Repository("commuteDAO")
public class CommuteDAOImpl implements CommuteDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllCommuteList() throws DataAccessException {
		List<CommuteVO> commutesList = null;
		commutesList = sqlSession.selectList("mapper.commute.selectAllCommuteList");
		return commutesList;
	}

	@Override
	public int insertCommute(CommuteVO commuteVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.commute.insertCommute", commuteVO);
		return result;
	}
	
	@Override
	public int insertCommute(ArticleworkVO commuteVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.commute.insertCommute", commuteVO);
		return result;
	}

	@Override
	public int deleteCommute(String id) throws DataAccessException {
		int result = sqlSession.delete("mapper.commute.deleteCommute", id);
		return result;
	}
	
	@Override
	public CommuteVO loginById(CommuteVO commuteVO) throws DataAccessException{
		  CommuteVO vo = sqlSession.selectOne("mapper.commute.loginById",commuteVO);
		return vo;
	}
}
