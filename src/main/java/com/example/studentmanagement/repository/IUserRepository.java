package com.example.studentmanagement.repository;

import com.example.studentmanagement.model.User;

import java.util.List;

public interface IUserRepository {
    User findByUsername(String username);

    List<String> findRolesByUsername(String username);
}
