package com.project.EmplAttribApp.exception;

public class EmployeeOrAttributeNotFoundException extends  RuntimeException{
    public EmployeeOrAttributeNotFoundException(String message) {
        super(message);
    }
}
