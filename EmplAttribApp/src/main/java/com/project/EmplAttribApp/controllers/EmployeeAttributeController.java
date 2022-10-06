package com.project.EmplAttribApp.controllers;

import com.project.EmplAttribApp.model.Attribute;
import com.project.EmplAttribApp.model.Employee;
import com.project.EmplAttribApp.model.EmployeeAttribute;
import com.project.EmplAttribApp.service.AttributeService;
import com.project.EmplAttribApp.service.EmployeeAttributeService;
import com.project.EmplAttribApp.service.EmployeeService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/employee-attribute")
public class EmployeeAttributeController {

    private final AttributeService attributeService;
    private final EmployeeService employeeService;
    private final EmployeeAttributeService employeeAttributeService;

    public EmployeeAttributeController(AttributeService attributeService, EmployeeService employeeService, EmployeeAttributeService employeeAttributeService) {
        this.attributeService = attributeService;
        this.employeeService = employeeService;
        this.employeeAttributeService = employeeAttributeService;
    }

    @GetMapping("/all")
    public ResponseEntity<List<EmployeeAttribute>> getEmployeesAttributes(){
        List<EmployeeAttribute> listEmployeesAttributes= employeeAttributeService.findAttributesEmployee();
        return new ResponseEntity<>(listEmployeesAttributes, HttpStatus.OK);
    }

//    @GetMapping("/find-attributes-by-employee-id/{empId}")
//     public ResponseEntity<List<Attribute>> getAttributesByEmpId(@PathVariable("empId") UUID empId){
//        List<Attribute> listAttributesByEmployeeId = employeeAttributeService.findAttributesByEmployeeId(empId);
//        return new ResponseEntity<>(listAttributesByEmployeeId, HttpStatus.OK);
//     }


//    @GetMapping("/find-attributes-by-attribute-id/{attrId}")
//    public ResponseEntity<List<EmployeeAttribute>> getAttributesByAtrId(@PathVariable("attrId") UUID attrId){
//        List<EmployeeAttribute> listAttributesByAttributeId = employeeAttributeService.findAttributesByAttributeId(attrId);
//        return new ResponseEntity<>(listAttributesByAttributeId, HttpStatus.OK);
//    }

}
