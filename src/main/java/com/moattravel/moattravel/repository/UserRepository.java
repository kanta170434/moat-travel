package com.moattravel.moattravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.moattravel.moattravel.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {

}
