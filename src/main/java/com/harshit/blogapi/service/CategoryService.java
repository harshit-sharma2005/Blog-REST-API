package com.harshit.blogapi.service;

import com.harshit.blogapi.exception.UnauthorizedException;
import com.harshit.blogapi.model.Category;
import com.harshit.blogapi.payload.ApiResponse;
import com.harshit.blogapi.payload.PagedResponse;
import com.harshit.blogapi.security.UserPrincipal;
import org.springframework.http.ResponseEntity;

public interface CategoryService {

	PagedResponse<Category> getAllCategories(int page, int size);

	ResponseEntity<Category> getCategory(Long id);

	ResponseEntity<Category> addCategory(Category category, UserPrincipal currentUser);

	ResponseEntity<Category> updateCategory(Long id, Category newCategory, UserPrincipal currentUser)
			throws UnauthorizedException;

	ResponseEntity<ApiResponse> deleteCategory(Long id, UserPrincipal currentUser) throws UnauthorizedException;

}
