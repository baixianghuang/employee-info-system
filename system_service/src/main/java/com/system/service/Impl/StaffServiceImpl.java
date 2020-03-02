package com.system.service.Impl;

import com.system.dao.StaffDao;
import com.system.entity.Staff;
import com.system.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("StaffService")
/**
 * Unlike DepartmentServiceImpl, this class also has to perform more function needed by service
 * e.g., set default status, password, and work time
 */
public class StaffServiceImpl implements StaffService {

    @Autowired
    private StaffDao staffDao;

    public void add(Staff staff) {
        staff.setPassword("root");
        staff.setWorkTime(new Date());
        staff.setStatus("normal");
        staffDao.insert(staff);
    }

    public void remove(Integer id) {
        staffDao.delete(id);
    }

    public void edit(Staff staff) {
        staffDao.update(staff);
    }

    public Staff get(Integer id) {
        return staffDao.selectById(id);
    }

    public List<Staff> getAll() {
        return staffDao.selectAll();
    }
}
