package com.harshit.blogapi.service;

import com.harshit.blogapi.model.Comment;
import com.harshit.blogapi.payload.ApiResponse;
import com.harshit.blogapi.payload.CommentRequest;
import com.harshit.blogapi.payload.PagedResponse;
import com.harshit.blogapi.security.UserPrincipal;

public interface CommentService {

	PagedResponse<Comment> getAllComments(Long postId, int page, int size);

	Comment addComment(CommentRequest commentRequest, Long postId, UserPrincipal currentUser);

	Comment getComment(Long postId, Long id);

	Comment updateComment(Long postId, Long id, CommentRequest commentRequest, UserPrincipal currentUser);

	ApiResponse deleteComment(Long postId, Long id, UserPrincipal currentUser);

}
