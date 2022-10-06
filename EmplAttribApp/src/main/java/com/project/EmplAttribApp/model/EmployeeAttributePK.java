package com.project.EmplAttribApp.model;


import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.UUID;

@Embeddable
public class EmployeeAttributePK implements Serializable {

    private UUID employeeId;
    private UUID attributeId;

    public UUID getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(UUID empIoyeeId) {
        this.employeeId = empIoyeeId;
    }

    public UUID getAttributeId() {
        return attributeId;
    }

    public void setAttributeId(UUID attrId) {
        this.attributeId = attrId;
    }
}
