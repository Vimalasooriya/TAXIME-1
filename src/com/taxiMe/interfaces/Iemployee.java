package com.taxiMe.interfaces;

import java.util.ArrayList;

import com.taxiMe.model.Employee;

public interface Iemployee {
	public ArrayList<Employee> getEmployeeList();
	public Employee getEmployee(int id);
	public boolean addEmployee(Employee employee);
	public boolean updateEmployee (Employee employee);
	public boolean deleteEmployee(int id);
}
