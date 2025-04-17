package com.moattravel.moattravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.moattravel.moattravel.entity.House;

@Repository
public interface HouseRepository extends JpaRepository<House, Integer> {

}
