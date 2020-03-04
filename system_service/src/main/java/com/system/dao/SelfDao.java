package com.system.dao;

import com.system.entity.Staff;
import org.springframework.stereotype.Repository;

@Repository("selfDao")
/**
 * in charge of the login function
 */
public interface SelfDao {
    Staff selectByAccount(String account);
}
