package com.project.millatinventory.dao;

import java.util.List;

import com.project.millatinventory.model.Deal;
import com.project.millatinventory.model.Dormancy;
import com.project.millatinventory.model.Portfolio;

public interface ReportDao {
	public List<Portfolio> getPortfolioDetails();
	public List<Dormancy> getDormancyLetterDetails();
	
	Deal getDealbyRef(int refNo);
}
