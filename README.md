# 通鸿云课堂

一个基于HarmonyOS的在线学习平台，包含Spring Boot后端API和HarmonyOS移动端应用。（目前仅开发界面UI，具体功能待实现）

## 项目概述

通鸿云课堂是一个完整的在线教育解决方案，提供课程浏览、用户管理、学习进度跟踪等功能。项目采用前后端分离架构，后端使用Spring Boot，前端使用HarmonyOS原生开发。

## 项目结构

```
project/
├── Applicationdemo/          # Spring Boot后端项目
│   └── demo/
│       └── src/main/java/com/example/demo/
│           ├── DemoApplication.java      # 主应用入口
│           ├── controller/
│           │   └── ApiController.java    # REST API控制器
│           ├── model/
│           │   └── User.java            # 用户实体类
│           └── repo/
│               └── UserRepo.java        # 用户数据访问层
└── huaweiproject/           # HarmonyOS前端项目
    └── entry/src/main/ets/
        ├── pages/           # 页面文件
        │   ├── Index.ets    # 首页
        │   ├── Login.ets    # 登录页
        │   ├── Search.ets   # 搜索页
        │   ├── main.ets     # 主页面(Tab容器)
        │   ├── study.ets    # 学习页
        │   ├── mine.ets     # 个人中心
        │   ├── person.ets   # 个人资料
        │   └── Setting.ets  # 设置页
        └── tool/
            └── Httptool.ets # HTTP请求工具类
```

## 功能特性

### 后端功能

- 🔐 用户认证与授权
- 👤 用户信息管理
- 📚 课程数据API
- 🔍 用户查询接口
- 💾 MySQL数据库集成
- 🚀 RESTful API设计

### 前端功能

- 📱 现代化移动端界面
- 🏠 首页课程展示与轮播图
- 🔍 智能课程搜索与分类
- 📖 个人学习中心
- ⚙️ 完整的设置功能
- 👥 个人资料管理
- 🔒 安全的登录认证
- ☁️ 华为云服务集成

## 技术栈

### 后端技术

- **框架**: Spring Boot 2.x
- **数据库**: MySQL
- **ORM**: JPA/Hibernate + MyBatis
- **连接池**: Druid
- **工具**: Lombok

### 前端技术

- **平台**: HarmonyOS
- **语言**: ArkTS
- **UI框架**: ArkUI
- **网络**: HTTP Kit
- **架构**: 组件化开发

## 环境要求

### 后端环境

- Java 8+
- MySQL 5.7+
- Maven 3.6+

### 前端环境

- HarmonyOS SDK
- DevEco Studio 4.0+
- Node.js 16+

## 效果图



![Login](C:\Users\XR\Desktop\github\view\Login.png)

![Index](C:\Users\XR\Desktop\github\view\Index.png)



![mine](C:\Users\XR\Desktop\github\view\mine.png)





![UserInfo](C:\Users\XR\Desktop\github\view\UserInfo.png)



## 快速开始

### 后端部署

1. **克隆项目**

```bash
git clone [your-repository-url]
cd Applicationdemo/demo
```

1. **数据库配置**

```sql
CREATE DATABASE zz CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

1. **修改配置文件** 编辑 `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/zz?characterEncoding=utf8&serverTimezone=UTC
spring.datasource.username=your_username
spring.datasource.password=your_password
```

1. **启动应用**

```bash
mvn spring-boot:run
```

服务将在 `http://localhost:8080` 启动

### 前端部署

1. **打开DevEco Studio**
2. **导入项目** `huaweiproject`
3. **配置SDK路径**
4. **修改后端地址** 编辑 `Httptool.ets` 中的 `BASE_URL`
5. **运行项目**

## API 接口

### 用户相关

```
GET  /api/hello                    # 测试接口
GET  /api/getUserById?id={id}      # 根据ID获取用户
GET  /api/user/info?username={name} # 根据用户名获取用户信息
GET  /api/getUserByUsername/{name}  # 路径参数获取用户
POST /api/login                    # 用户登录
```

### 请求示例

```javascript
// 用户登录
POST /api/login
Content-Type: application/json

{
  "username": "testuser",
  "password": "password123"
}
```

## 数据库设计

### 用户表 (users)

```sql
CREATE TABLE users (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  nickname VARCHAR(100),
  uid VARCHAR(50),
  phone VARCHAR(20),
  email VARCHAR(100),
  signature TEXT
);

CREATE TABLE user_labels (
  users_id BIGINT,
  labels VARCHAR(255),
  FOREIGN KEY (users_id) REFERENCES users(id)
);
```

## 页面说明

| 页面        | 功能描述                      |
| ----------- | ----------------------------- |
| Login.ets   | 用户登录，支持多种登录方式    |
| main.ets    | Tab导航容器，包含四个主要模块 |
| Index.ets   | 首页，展示课程推荐和轮播图    |
| Search.ets  | 课程搜索和分类浏览            |
| study.ets   | 学习中心，我的课程管理        |
| person.ets  | 个人资料编辑                  |
| Setting.ets | 应用设置和账户管理            |

## 开发规范

### 代码风格

- 遵循阿里巴巴Java开发规范
- ArkTS代码使用驼峰命名
- 组件名使用PascalCase
- 接口统一使用RESTful风格

### 项目规范

- 控制器层只负责接收请求和返回响应
- 业务逻辑在Service层处理
- 数据访问使用Repository模式
- 前端组件化开发，提高复用性

## 贡献指南

1. Fork 项目
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 提交 Pull Request

