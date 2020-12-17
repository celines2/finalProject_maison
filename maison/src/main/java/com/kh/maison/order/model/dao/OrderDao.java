package com.kh.maison.order.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.maison.basket.model.vo.Basket;
import com.kh.maison.order.model.vo.Order;
import com.kh.maison.order.model.vo.OrderDetail;

public interface OrderDao {
	
	int insertOrder(SqlSession session,Order o);
	
	int insertOrderDetail(SqlSession session,Basket b);
	
	int updateMileage(SqlSession session, Map<String,Object> map2);
	
	int updateStock(SqlSession session, Map<String,Object> map3);

	int bupdateStock(SqlSession session, Basket b);
	
	OrderDetail selectOdOne(SqlSession session, int orderDetailNo );
}
