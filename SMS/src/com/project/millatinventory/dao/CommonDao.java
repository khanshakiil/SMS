package com.project.millatinventory.dao;

import java.util.List;
import java.util.Map;

import com.project.millatinventory.model.ApplicantTypeLookup;
import com.project.millatinventory.model.Department;

public interface CommonDao {

	List<Department> getDepartments();

	List<ApplicantTypeLookup> getApplicantTypeLookup();

}
