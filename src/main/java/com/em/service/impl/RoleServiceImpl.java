package com.em.service.impl;

import com.em.dao.RoleMapper;
import com.em.domain.Role;
import com.em.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public String findNameById(Integer roleId) throws Exception {
        return roleMapper.findNameById(roleId);
    }
}
