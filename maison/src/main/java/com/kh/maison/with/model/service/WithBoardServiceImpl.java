package com.kh.maison.with.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.maison.with.model.dao.WithBoardDao;
import com.kh.maison.with.model.vo.WithBoard;
import com.kh.maison.with.model.vo.WithComment;

@Service
public class WithBoardServiceImpl implements WithBoardService {

	@Autowired
	SqlSessionTemplate session;
	
	@Autowired
	private WithBoardDao dao;

	@Override
	public int insertWith(WithBoard wb) {
		// TODO Auto-generated method stub
		int result = dao.insertWith(session,wb);
		return result;
	}

	@Override
	public List<WithBoard> selectAllWith(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		List<WithBoard> list = dao.selectAllWith(session,cPage,numPerPage);
		return list;
	}

	@Override
	public int selectWithCount() {
		// TODO Auto-generated method stub
		int result = dao.selectWithCount(session);
		return result;
	}

	@Override
	public WithBoard selectOneWith(int no) {
		// TODO Auto-generated method stub
		WithBoard wb = dao.selectOneWith(session,no);
		return wb;
	}

	@Override
	public int insertWithReply(WithComment comment) {
		// TODO Auto-generated method stub
		int result = dao.insertWithReply(session,comment);
		return result;
	}

	@Override
	public List<WithComment> selectAllWithReply(int bno) {
		// TODO Auto-generated method stub
		List<WithComment> list = dao.selectAllWithReply(session,bno);
		return list;
	}

	@Override
	public int insertWithReplySecond(WithComment comment) {
		// TODO Auto-generated method stub
		int result = dao.insertWithReplySecond(session,comment);
		return result;
	}
}
