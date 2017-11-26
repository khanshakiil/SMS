package com.project.millatinventory.daoimpl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.millatinventory.dao.ReportDao;
import com.project.millatinventory.model.Deal;
import com.project.millatinventory.model.Dormancy;
import com.project.millatinventory.model.Portfolio;

@Repository("Portfolio,Dormancy")
public class ReportDaoImpl implements ReportDao {
	//Changes for oracle connection
	@Resource(name = "mySQLSessionFactory")
	private SessionFactory sessionFactory;

	Logger logger = Logger.getLogger(StudentDaoImpl.class);

	@Override
	public Deal getDealbyRef(int refNo) {
		logger.info("ReportDaoImpl.getDeal");
		String hqlC="from Deal where refNo=:refNo";
		Query createQuery = sessionFactory.getCurrentSession().createQuery(hqlC);
		createQuery.setParameter("refNo", refNo);
		Deal deal = (Deal) createQuery.uniqueResult();
		logger.info("Deal="+deal);
		return deal;
	
	}
	@Override
	public List<Portfolio> getPortfolioDetails() {
		logger.info("ReportDaoImpl.getPortfolioDetails");
		String hqlC="from Portfolio ";
		Query createQuery = sessionFactory.getCurrentSession().createQuery(hqlC);
		List<Portfolio> list = createQuery.list();
		logger.info("list="+list.size());
		return list;
	
	}
	
	@Override
	public List<Dormancy> getDormancyLetterDetails() {
		logger.info("ReportDaoImpl.getDormancyLetterDetails");
		String hqlC="from Dormancy ";
		Query createQuery = sessionFactory.getCurrentSession().createQuery(hqlC);
		List<Dormancy> list = createQuery.list();
		logger.info("list="+list.size());
		return list;
	
	}
}
