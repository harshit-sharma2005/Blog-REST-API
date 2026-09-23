package com.harshit.blogapi.service;

import com.harshit.blogapi.model.Post;
import com.harshit.blogapi.payload.ApiResponse;
import com.harshit.blogapi.payload.PagedResponse;
import com.harshit.blogapi.payload.PostRequest;
import com.harshit.blogapi.payload.PostResponse;
import com.harshit.blogapi.security.UserPrincipal;

public interface PostService {

	PagedResponse<Post> getAllPosts(int page, int size);

	PagedResponse<Post> getPostsByCreatedBy(String username, int page, int size);

	PagedResponse<Post> getPostsByCategory(Long id, int page, int size);

	PagedResponse<Post> getPostsByTag(Long id, int page, int size);

	Post updatePost(Long id, PostRequest newPostRequest, UserPrincipal currentUser);

	ApiResponse deletePost(Long id, UserPrincipal currentUser);

	PostResponse addPost(PostRequest postRequest, UserPrincipal currentUser);

	Post getPost(Long id);

}
