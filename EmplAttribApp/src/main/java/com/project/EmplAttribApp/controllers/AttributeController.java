package com.project.EmplAttribApp.controllers;

import com.project.EmplAttribApp.model.Attribute;
import com.project.EmplAttribApp.service.AttributeService;
import io.swagger.annotations.ApiOperation;
import org.apache.catalina.valves.rewrite.InternalRewriteMap;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/attribute")
public class AttributeController {
    private final AttributeService attributeService;

    public AttributeController(AttributeService attributeService) {
        this.attributeService = attributeService;
    }

    @GetMapping("/all")
    @ApiOperation(value = "Find all attributes")
    public ResponseEntity<List<Attribute>> getAllAttributes(){
        List<Attribute> attributes = attributeService.findAllAttributes();
        return new ResponseEntity<>(attributes, HttpStatus.OK);
    }

    @GetMapping("/find/{id}")
    @ApiOperation(value = "Find attribute by id")
    public ResponseEntity<Attribute> getAttributeById(@PathVariable("id")UUID id){
        Attribute attribute = attributeService.findAttributeById(id);
        return new ResponseEntity<>(attribute, HttpStatus.OK);
    }

    @PostMapping("/add")
    @ApiOperation(value = "Add new attribute")
    public ResponseEntity<Attribute> addAttribute(@RequestBody Attribute attribute){
        Attribute newAttribute = attributeService.addAttribute(attribute);
        return new ResponseEntity<>(newAttribute, HttpStatus.CREATED);
    }

    @PutMapping("/update")
    public ResponseEntity<Attribute> updateAttribute(@RequestBody Attribute attribute){
        Attribute updateAttribute = attributeService.updateAttribute(attribute);
        return new ResponseEntity<>(updateAttribute, HttpStatus.CREATED);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> deleteAttribute(@PathVariable("id")UUID id){
        attributeService.deleteAttribute(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }


}
