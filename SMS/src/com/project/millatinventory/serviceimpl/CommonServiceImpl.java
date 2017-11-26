package com.project.millatinventory.serviceimpl;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.millatinventory.dao.CommonDao;
import com.project.millatinventory.model.ApplicantTypeLookup;
import com.project.millatinventory.model.Department;
import com.project.millatinventory.service.CommonService;
@Service("CommonService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class CommonServiceImpl implements CommonService{
	
	@Autowired
	private CommonDao commonDao;

	@Override
	public Map<Integer, String> getCities() {
		//TODO : Fetch from DB
				Map<Integer, String> map = new LinkedHashMap<Integer, String>();
				map.put(1,"Mumbai" );
				map.put(2,"Delhi" );
				return map;
	}

	@Override
	public Map<Integer, String> getStates() {
		//TODO : Fetch from DB
				Map<Integer, String> map = new LinkedHashMap<Integer, String>();
				map.put(1,"Maharashtra" );
				map.put(2,"Tamil Nadu" );
				return map;
	}
	@Override
	public List<Department> getDepartments() {
				
		return  commonDao.getDepartments();
				
	}
	@Override
	public List<ApplicantTypeLookup> getApplicantTypeLookup() {
				
		return  commonDao.getApplicantTypeLookup();
				
	}

	@Override
	public Map<String, String> getGenders() {
		//TODO : Fetch from DB
				Map<String, String> map = new LinkedHashMap<String, String>();
				map.put("MALE","MALE" );
				map.put("FEMALE","FEMALE" );
				return map;
	}
	@Override
	public Map<String, String> getRoles() {
		//TODO : Fetch from DB
				Map<String, String> map = new LinkedHashMap<String, String>();
				map.put("1","Maker/uploader" );
				map.put("2","Checker/Authorizer" );
				return map;
	}
	
}

