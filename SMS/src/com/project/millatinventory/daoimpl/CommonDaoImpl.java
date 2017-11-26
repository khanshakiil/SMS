package com.project.millatinventory.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.project.millatinventory.dao.CommonDao;
import com.project.millatinventory.model.ApplicantTypeLookup;
import com.project.millatinventory.model.Department;

@Repository("CommonDao")
public class CommonDaoImpl implements CommonDao {
	//Changes for oracle connection 
	@Autowired
	@Qualifier(value="mySQLSessionFactory")
	private SessionFactory sessionFactory;

	@Autowired
	@Qualifier(value="oracleSessionFactory")
	private SessionFactory sessionFactory1;
	
	@Override
	public List<Department> getDepartments() {		
		String hqlC="from Department c";
		Query createQuery = sessionFactory1.getCurrentSession().createQuery(hqlC);		
		return createQuery.list();
	}
	
	@Override
	public List<ApplicantTypeLookup> getApplicantTypeLookup() {		
		String hqlC="from ApplicantTypeLookup c";
		Query createQuery = sessionFactory.getCurrentSession().createQuery(hqlC);		
		return createQuery.list();
	}
	

}
