package com.kh.maison.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.maison.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public int insertMember(SqlSessionTemplate session, Member mem) {
		return session.insert("member.insertMember", mem);
	}

	@Override
	public Member selectMemberOne(SqlSessionTemplate session, String id) {
		return session.selectOne("member.selectMemberOne", id);
	}
	
	

}
