package com.project.EmplAttribApp.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Entity
@Getter
@Setter
public class Employee implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="EMP_ID", insertable = false, updatable = false, nullable = false)
    @Type(type="org.hibernate.type.UUIDCharType")
    private UUID id;

    @Column(name="EMP_Name")
    private String name;

    @Column(name="EMP_Birthdate")
    private Date birthdate;

    @Column(name="EMP_Car")
    private Boolean hasCar;

    @Column(name="EMP_Address")
    private String address;

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", birthdate=" + birthdate +
                ", hasCar=" + hasCar +
                ", address='" + address + '\'' +
                '}';
    }
}
