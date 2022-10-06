package com.project.EmplAttribApp.repository;

import com.project.EmplAttribApp.model.Attribute;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface AttributeRepository extends JpaRepository<Attribute, UUID> {

    @Transactional
    void deleteAttributeByid(UUID id);

    Optional<Attribute> findAttributeById(UUID id);
}
