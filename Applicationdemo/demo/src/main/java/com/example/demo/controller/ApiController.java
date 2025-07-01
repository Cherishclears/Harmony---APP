package com.example.demo.controller;

import com.example.demo.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.*;
import com.example.demo.repo.UserRepo;
import java.util.Optional;
@RestController // 告诉spring该类用于接收http请求
@RequestMapping("/api")  // 分包分模块、设置请求路径


public class ApiController {
    @Autowired
    private UserRepo UserRepo;

    // http://localhost:8080/api/hello
    @GetMapping("/hello") // 设置请求路径、用于接收 GET方式的http请求
    public String hello() {
        return "Hello World";
    }

    // http://localhost:8080/api/getUserById?id=1
    @GetMapping("/getUserById")
    public String getUserById(@RequestParam int id) {
        return "id is :" + id;
    }

    // 根据用户名获取用户信息
    @GetMapping("/user/info")
    public ResponseEntity<?> getUserInfo(@RequestParam String username) {
        Optional<User> userOpt = UserRepo.findByUsername(username);

        User user = userOpt.get();
        return ResponseEntity.ok(user);
    }

        // http://localhost:8080/api/getUserByUsername/zz
    @GetMapping("/getUserByUsername/{username}")
        public String getUserByUsername (@PathVariable("username") String username){
            return "username is :" + username;
        }

        // http://localhost:8080/api/login
        @PostMapping("/login")
        public User login (@RequestBody User user){
            System.out.println(user);
            System.out.println("start query DB.....");

            user.setEmail("121727838@qq.com");
            user.setPhone("1234567890");

            return user;
        }


}