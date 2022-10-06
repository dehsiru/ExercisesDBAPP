package com.project.EmplAttribApp.repository;

import com.project.EmplAttribApp.model.EmployeeAttribute;
import com.project.EmplAttribApp.model.EmployeeAttributePK;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.persistence.TypedQuery;
import java.util.List;
import java.util.UUID;

@Repository
public interface EmployeeAttributeRepository extends JpaRepository<EmployeeAttribute, UUID> {

//    @Query("SELECT attr FROM Attribute attr INNER JOIN EmployeeAttribute emat ON attr.id = emat.attrId WHERE emat.empId = :empId")
//     List<Attribute> findAttributesByEmployeeId(@Param("empId") UUID empId);
//
//    @Query("SELECT ea from EmployeeAttribute ea where ea.attributeId = :attrId")
//    List<EmployeeAttribute> findAttributesByAttributeId(@Param("attrId") UUID attrId);

//    @Query(nativeQuery = true,
//            value = "select * from employeeattribute" +
//                    "where attrId = ?1")
//    List<EmployeeAttribute> findAttributesByAttributeId(UUID attrId);
//
//    TypedQuery<EmployeeAttribute> query = em.createQuery(
//        "SELECT ea from EmployeeAttribute ea where ea.attrId = :attrId", EmployeeAttribute.class);
//        UUID attributeId =  UUID. fromString("30623264-3066-3463-2d33-3638652d3463");
//        List<EmployeeAttribute> findAttributesByAttributeId = query.setParameter("attrId",attributeId)
//        getResultList();
}





