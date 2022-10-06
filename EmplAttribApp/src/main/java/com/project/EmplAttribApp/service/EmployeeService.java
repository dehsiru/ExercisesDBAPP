package com.project.EmplAttribApp.service;



import com.project.EmplAttribApp.exception.EmployeeOrAttributeNotFoundException;
import com.project.EmplAttribApp.model.Employee;
import com.project.EmplAttribApp.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class EmployeeService {

    private final EmployeeRepository employeeRepository;

    @Autowired
    public EmployeeService(EmployeeRepository employeeRepository){
        this.employeeRepository = employeeRepository;
    }

    public Employee addEmployee(Employee employee){
        return employeeRepository.save(employee);
    }

    public List<Employee> findAllEmployees(){
        return employeeRepository.findAll();
    }

    public Employee updateEmployee(Employee employee){
        return employeeRepository.save(employee);
    }

    public void deleteEmployee(UUID id){
        employeeRepository.deleteEmployeeByid(id);
    }

    public Employee findEmployeeById(UUID id){
        return employeeRepository.findEmployeeById(id)
                .orElseThrow(() -> new EmployeeOrAttributeNotFoundException("Employee by id "+ id + " was not found!"));
    }


}
