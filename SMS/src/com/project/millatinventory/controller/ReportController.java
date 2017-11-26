package com.project.millatinventory.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itextpdf.text.DocumentException;
import com.project.millatinventory.common.Properties;
import com.project.millatinventory.model.Deal;
import com.project.millatinventory.model.Dormancy;
import com.project.millatinventory.model.Portfolio;
import com.project.millatinventory.service.ReportService;

@Controller
@RequestMapping(value = "/report")
public class ReportController {
	Logger logger = Logger.getLogger(ReportController.class);

	// @Autowired
	// private ReportService reportService;

	@Autowired
	private Properties properties;

	@RequestMapping()
	public String showReport(Model model) throws ParseException {
		logger.info("ReportController.showReport()");
		return "report";
	}

	@Autowired
	private ReportService reportService;

	@RequestMapping(value = "/dealReport", method = RequestMethod.POST)
	public String dealReport(@RequestParam(value = "refNo", defaultValue = "0") String refNo, Model model,
			HttpServletResponse response) throws ParseException, FileNotFoundException, IOException, DocumentException {
		System.out.println(refNo);
		logger.info("ReportController.dealReport()");

		logger.info("refNo=" + refNo);

		try {

			Deal deal = reportService.getDealbyRef(Integer.parseInt(refNo));
			if (null != deal) {
				System.out.println(deal);
				String basePath= properties.getFileLocation();
				String dir = basePath + File.separator + "deal";
				File location = new File(dir);
				if (!location.isDirectory())
					location.mkdirs();
				String file = dir + File.separator + refNo + ".pdf";
				logger.info("generating file at " + dir);
				reportService.generateDealReport(deal, file);
				model.addAttribute("message", "Deal Report generated successfully at " + basePath
						+ File.separator + "deal");
				logger.info("Pdf generated at " + file);
			} else {
				model.addAttribute("message", "Ref No. not found");
			}
		} catch (Exception e) {
			logger.error("Report generation fails");
			logger.error(e);
			model.addAttribute("message", "Dormancy Report generation fails");
		}
		// final File file = new File("C:\\FirstPdf10.pdf");
		/*
		 * InputStream inputStream=null; OutputStream outStream=null; try {
		 * 
		 * final int BUFFER_SIZE = 4096; inputStream = new
		 * ByteArrayInputStream(IOUtils.toByteArray(new FileInputStream(file)));
		 * 
		 * // set headers for the response String mimeType = "application/pdf";
		 * response.setContentType(mimeType); String headerKey =
		 * "Content-Disposition"; String headerValue = String.format(
		 * "attachment; filename=" + refNo + ".pdf");
		 * response.setHeader(headerKey, headerValue);
		 * 
		 * // get output stream of the response outStream =
		 * response.getOutputStream();
		 * 
		 * byte[] buffer = new byte[BUFFER_SIZE]; int bytesRead = -1;
		 * 
		 * // write bytes read from the input stream into the output stream
		 * while ((bytesRead = inputStream.read(buffer)) != -1) {
		 * outStream.write(buffer, 0, bytesRead); } } finally {
		 * inputStream.close(); outStream.close(); }
		 */
		return "report";
	}

	@RequestMapping(value = "/portfolioReport", method = RequestMethod.POST)
	public String portfolioReport(Model model)
			throws ParseException, FileNotFoundException, MalformedURLException, DocumentException, IOException {
		System.out.println("ReportController.portfolioReport()");
		logger.info("ReportController.showReport()");
		List<Portfolio> portfolios = reportService.getPortfolioDetails();
		logger.info("portfolio list=" + portfolios.size());
		String dir = properties.getFileLocation() + File.separator + "portfolio";
		File file = new File(dir);
		if (!file.isDirectory())
			file.mkdirs();

		for (Portfolio portfolio : portfolios) {

			logger.info("Report generating for " + portfolio.getClientName() + " " + dir);
			logger.info(portfolio);
			reportService.generatePortfolioReport(portfolio,
					file + File.separator + portfolio.getClientName() + ".pdf");
			logger.info("Report generated for " + portfolio.getClientName());
		}
		logger.info("Portfolio Report generated successfully at " + properties.getFileLocation() + File.separator
				+ "portfolio");
		model.addAttribute("message", "Portfolio Report generated successfully at " + properties.getFileLocation()
				+ File.separator + "portfolio");

		return "report";
	}

	@RequestMapping(value = "/dormancyReport", method = RequestMethod.POST)
	public String dormancyReport(@RequestParam("option") String option, Model model)
			throws ParseException, FileNotFoundException, MalformedURLException, DocumentException, IOException {
		System.out.println("ReportController.dormancyReport()");
		try {
			logger.info("ReportController.dormancyReport()" + option);
			if ("1".equals(option)) {
				List<Dormancy> dormancyList = reportService.getDormancyLetterDetails();

				logger.info("portfolio list=" + dormancyList.size());
				String dir = properties.getFileLocation() + File.separator + "dormancy";
				File file = new File(dir);
				if (!file.isDirectory())
					file.mkdirs();

				for (Dormancy dormancy : dormancyList) {
					// logger.info("Report generating for
					// "+dormancy.getClientName()+" "+dir);
					logger.info(dormancy);
					String fileName = file + File.separator + "InactiveAccount_" + dormancy.getAccountNumber() + ".pdf";
					reportService.generateDormancyReport(dormancy, fileName);
					// logger.info("Report generated for
					// "+dormancy.getClientName());
				}
				logger.info("Dormant Report generated successfully at " + properties.getFileLocation() + File.separator
						+ "portfolio");
				model.addAttribute("message", "Dormancy Report generated successfully at "
						+ properties.getFileLocation() + File.separator + "dormancy");
			}
		} catch (Exception e) {
			logger.error("Report generation fails");
			logger.error(e);
			model.addAttribute("message", "Dormancy Report generation fails");
		}
		return "report";
	}
}
