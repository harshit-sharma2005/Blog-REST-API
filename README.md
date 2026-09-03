# Blog REST API

A RESTful backend for a blogging platform, built with **Spring Boot**, **Spring Security (JWT)**, **JPA/Hibernate**, and **MySQL**. It supports user authentication, blog posts, comments, albums/photos, and per-user todos — with role-based access control for admins vs regular users.

I built this project to get hands-on practice with securing a Spring Boot API using JWT-based authentication, designing a relational schema with multiple related entities, and implementing full CRUD operations with proper authorization checks (e.g. only a post's owner or an admin can update/delete it).

## Tech Stack

- **Java / Spring Boot** — application framework
- **Spring Security + JWT** — authentication and authorization
- **Spring Data JPA / Hibernate** — ORM and persistence
- **MySQL** — relational database
- **Maven** — build and dependency management
- **Docker / Docker Compose** — containerized setup

## Features

- User signup/signin with JWT-based authentication
- Role-based access control (regular users vs admins)
- CRUD APIs for blog **posts**
- **Comments** scoped to individual posts
- **Albums** and **photos**, each linked to a user
- Personal **todo** management per logged-in user
- Username/email availability checks for signup validation
- Admin-only endpoints for promoting/demoting users

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/harshit-sharma2005/Blog-REST-API.git
cd Blog-REST-API
```

### 2. Set up the MySQL database

```sql
create database blogapi;
```

Then run the schema script located at `src/main/resources/blogapi.sql`.

### 3. Configure database credentials

Open `src/main/resources/application.properties` and update:

```properties
spring.datasource.username=<your-mysql-username>
spring.datasource.password=<your-mysql-password>
```

### 4. Run the application

```bash
mvn spring-boot:run
```

The API will be available at `http://localhost:8080`.

### Optional: Run with Docker

```bash
docker-compose up --build
```

## API Endpoints

### Auth

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/auth/signup` | Register a new user |
| POST | `/api/auth/signin` | Log in and receive a JWT |

### Users

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/users/me` | Get the logged-in user's profile |
| GET | `/api/users/{username}/profile` | Get a user's public profile |
| GET | `/api/users/{username}/posts` | Get posts created by a user |
| GET | `/api/users/{username}/albums` | Get albums created by a user |
| GET | `/api/users/checkUsernameAvailability` | Check if a username is available |
| GET | `/api/users/checkEmailAvailability` | Check if an email is available |
| POST | `/api/users` | Add a new user (admin only) |
| PUT | `/api/users/{username}` | Update a user (owner or admin) |
| DELETE | `/api/users/{username}` | Delete a user (owner or admin) |
| PUT | `/api/users/{username}/giveAdmin` | Grant admin role (admin only) |
| PUT | `/api/users/{username}/TakeAdmin` | Revoke admin role (admin only) |
| PUT | `/api/users/setOrUpdateInfo` | Update profile info (owner or admin) |

### Posts

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/posts` | Get all posts |
| GET | `/api/posts/{id}` | Get a single post |
| POST | `/api/posts` | Create a new post |
| PUT | `/api/posts/{id}` | Update a post (owner or admin) |
| DELETE | `/api/posts/{id}` | Delete a post (owner or admin) |

### Comments

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/posts/{postId}/comments` | Get all comments on a post |
| GET | `/api/posts/{postId}/comments/{id}` | Get a specific comment |
| POST | `/api/posts/{postId}/comments` | Add a comment to a post |
| PUT | `/api/posts/{postId}/comments/{id}` | Update a comment (owner or admin) |
| DELETE | `/api/posts/{postId}/comments/{id}` | Delete a comment (owner or admin) |

### Albums

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/albums` | Get all albums |
| GET | `/api/albums/{id}` | Get a single album |
| POST | `/api/albums` | Create a new album |
| PUT | `/api/albums/{id}` | Update an album (owner or admin) |
| DELETE | `/api/albums/{id}` | Delete an album (owner or admin) |
| GET | `/api/albums/{id}/photos` | Get all photos in an album |

### Photos

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/photos` | Get all photos |
| GET | `/api/photos/{id}` | Get a single photo |
| POST | `/api/photos` | Upload a new photo |
| PUT | `/api/photos/{id}` | Update a photo (owner or admin) |
| DELETE | `/api/photos/{id}` | Delete a photo (owner or admin) |

### Todos

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/todos` | Get the logged-in user's todos |
| GET | `/api/todos/{id}` | Get a specific todo |
| POST | `/api/todos` | Create a new todo |
| PUT | `/api/todos/{id}` | Update a todo |
| DELETE | `/api/todos/{id}` | Delete a todo |
| PUT | `/api/todos/{id}/complete` | Mark a todo as complete |
| PUT | `/api/todos/{id}/unComplete` | Mark a todo as incomplete |

Test the endpoints with **Postman** or any REST client of your choice.

## What I Learned

- Implementing stateless authentication with JWT in Spring Security
- Designing entity relationships (one-to-many between users, posts, comments, albums, and photos)
- Writing authorization logic so users can only modify their own resources unless they're an admin
- Structuring a multi-module Spring Boot project with clean separation between controllers, services, and repositories
- Containerizing a Spring Boot + MySQL app with Docker Compose


