package com.moattravel.moattravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.moattravel.moattravel.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {
    public Role findByName(String name);
}
