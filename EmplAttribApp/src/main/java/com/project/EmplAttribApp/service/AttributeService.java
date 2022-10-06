package com.project.EmplAttribApp.service;



import com.project.EmplAttribApp.exception.EmployeeOrAttributeNotFoundException;
import com.project.EmplAttribApp.model.Attribute;
import com.project.EmplAttribApp.repository.AttributeRepository;
import com.project.EmplAttribApp.repository.EmployeeAttributeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class AttributeService {

    private final AttributeRepository attributeRepository;
    private final EmployeeAttributeRepository employeeAttributeRepository;

    @Autowired
    public AttributeService(AttributeRepository attributeRepository, EmployeeAttributeRepository employeeAttributeRepository){
        this.attributeRepository = attributeRepository;
        this.employeeAttributeRepository = employeeAttributeRepository;
    }

    public Attribute addAttribute(Attribute attribute){
        return attributeRepository.save(attribute);
    }

    public List<Attribute> findAllAttributes(){
        return attributeRepository.findAll();
    }

    public Attribute updateAttribute(Attribute attribute){
        return attributeRepository.save(attribute);
    }

    public void deleteAttribute(UUID id){
        attributeRepository.deleteAttributeByid(id);
    }

    public Attribute findAttributeById(UUID id){
        return attributeRepository.findAttributeById(id)
                .orElseThrow(() -> new EmployeeOrAttributeNotFoundException("Attribute by id "+ id + " was not found!"));
    }

}
