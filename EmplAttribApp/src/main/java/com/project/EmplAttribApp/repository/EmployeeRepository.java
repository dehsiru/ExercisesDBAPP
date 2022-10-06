package com.project.EmplAttribApp.repository;

import com.project.EmplAttribApp.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, UUID> {

    @Transactional
    void deleteEmployeeByid(UUID id);

    Optional<Employee> findEmployeeById(UUID id);
}
