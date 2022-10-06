package com.project.EmplAttribApp.service;

import com.project.EmplAttribApp.model.Attribute;
import com.project.EmplAttribApp.model.EmployeeAttribute;
import com.project.EmplAttribApp.repository.AttributeRepository;
import com.project.EmplAttribApp.repository.EmployeeAttributeRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.jar.Attributes;

@Service
public class EmployeeAttributeService {

    private final AttributeRepository attributeRepository;
    private final EmployeeAttributeRepository employeeAttributeRepository;
    private final AttributeService attributeService;

    public EmployeeAttributeService(AttributeRepository attributeRepository, EmployeeAttributeRepository employeeAttributeRepository, AttributeService attributeService) {
        this.attributeRepository = attributeRepository;
        this.employeeAttributeRepository = employeeAttributeRepository;
        this.attributeService = attributeService;
    }

    public List<EmployeeAttribute> findAttributesEmployee() {
        return employeeAttributeRepository.findAll();
    }

//    public ArrayList<Attribute> findAttributesByEmployeeId(UUID empId){
//        }

//  public List<EmployeeAttribute> findAttributesByAttributeId(UUID attrId){
//      return employeeAttributeRepository.findAttributesByAttributeId(attrId);
//  }

}

