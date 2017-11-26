package com.project.millatinventory.service;




import java.util.List;
import java.util.Map;

import com.project.millatinventory.model.ApplicantTypeLookup;

public interface CommonService {
public Map<Integer, String> getCities();
public Map<Integer, String> getStates();
public List getDepartments();
Map<String, String> getGenders();
public Map getRoles();
List<ApplicantTypeLookup> getApplicantTypeLookup();

}
