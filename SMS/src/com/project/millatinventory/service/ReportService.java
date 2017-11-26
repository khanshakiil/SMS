package com.project.millatinventory.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import com.itextpdf.text.DocumentException;
import com.project.millatinventory.model.Deal;
import com.project.millatinventory.model.Dormancy;
import com.project.millatinventory.model.Portfolio;


public interface ReportService {
	
	public List<Portfolio> getPortfolioDetails();

	public void generatePortfolioReport(Portfolio portfolio, String file) throws FileNotFoundException, DocumentException, MalformedURLException, IOException;

	
	
	public List<Dormancy> getDormancyLetterDetails();

	public void generateDormancyReport(Dormancy dormancy, String file) throws FileNotFoundException, DocumentException, MalformedURLException, IOException;

	Deal getDealbyRef(int refNo);

	void generateDealReport(Deal deal, String file) throws DocumentException, MalformedURLException, IOException;

}
