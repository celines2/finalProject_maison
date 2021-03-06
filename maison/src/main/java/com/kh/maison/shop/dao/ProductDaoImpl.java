package com.kh.maison.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.maison.shop.model.vo.PdInquiry;
import com.kh.maison.shop.vo.Product;
import com.kh.maison.shop.vo.WishList;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Override
	public List<Map> selectProductList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("shop.shopList");
	}

	@Override
	public Product selectProductOne(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("shop.selectProductOne",no);
	}

	@Override
	public int insertWishList(SqlSession session, WishList w) {
		// TODO Auto-generated method stub
		
		return session.insert("wishList.insertWishList",w);
	}

	@Override
	public List<Map> selectWishList(SqlSession session, String id) {
		// TODO Auto-generated method stub
		return session.selectList("wishList.selectWishList",id);
	}

	@Override
	public int deleteWishList(SqlSession session, WishList w) {
		// TODO Auto-generated method stub
		return session.delete("wishList.deleteWishList",w);
	}

	@Override
	public int countMyWish(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("wishList.countMyWish",param);
	}
	
	

	
	
	
	
	
	
	

}
