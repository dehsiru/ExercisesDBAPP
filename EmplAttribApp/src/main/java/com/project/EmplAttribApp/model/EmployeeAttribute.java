package com.project.EmplAttribApp.model;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name ="employeeattribute")
@IdClass(EmployeeAttributePK.class)
public class EmployeeAttribute {

    @Id
    @Column(name="EMPATTR_EmployeeID")
    private UUID employeeId;

    @Id
    @Column(name="EMPATTR_AttributeID")
    private UUID attributeId;

    public UUID getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(UUID employeeId) {
        this.employeeId = employeeId;
    }

    public UUID getAttributeId() {
        return attributeId;
    }

    public void setAttributeId(UUID attributeId) {
        this.attributeId = attributeId;
    }
}
