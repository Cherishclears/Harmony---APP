package com.example.demo.model;//package com.example.demo.model;


import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Data
@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    private String username;

    private String password;
    private String nickname;
    private String uid;
    private String phone;
    private String email;
    private String signature;

    @ElementCollection
    @CollectionTable(name = "user_labels")
    private List<String> labels;

    // getter/setter省略
}