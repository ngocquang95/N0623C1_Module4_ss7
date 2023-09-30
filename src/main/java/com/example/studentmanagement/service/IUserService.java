package com.example.studentmanagement.service;

import com.example.studentmanagement.model.User;

import java.util.List;

public interface IUserService {
    User findByUsername(String username);

    List<String> findRolesByUsername(String username);
}
