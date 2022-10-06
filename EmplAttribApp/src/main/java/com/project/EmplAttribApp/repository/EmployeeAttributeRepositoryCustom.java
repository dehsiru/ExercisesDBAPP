//package com.project.EmplAttribApp.repository;
//
//import com.project.EmplAttribApp.model.EmployeeAttribute;
//import com.project.EmplAttribApp.model.EmployeeAttributePK;
//import org.springframework.data.jpa.provider.HibernateUtils;
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.stereotype.Repository;
//
//import javax.persistence.EntityManager;
//import javax.persistence.PersistenceContext;
//import javax.persistence.TypedQuery;
//import javax.transaction.Transactional;
//import java.util.List;
//import java.util.UUID;
//
//@Repository
//@Transactional
//public class EmployeeAttributeRepositoryCustom implements JpaRepository<EmployeeAttribute, UUID> { {
//
//    @PersistenceContext
//    private EntityManager entityManager;
//
//    public List<EmployeeAttribute> getAttributesByAttributeId(UUID attributeId){
//        TypedQuery<EmployeeAttribute> typedQuery
//                = entityManager.createQuery("SELECT ea from EmployeeAttribute ea where ea.attributeId = :attrId", EmployeeAttribute.class);
//        typedQuery.setParameter("attrId",attrId);
//        return typedQuery.getResultList();
//    }
//
//
//
//
//}
