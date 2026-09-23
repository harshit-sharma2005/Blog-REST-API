package com.harshit.blogapi.service;

import com.harshit.blogapi.model.Tag;
import com.harshit.blogapi.payload.ApiResponse;
import com.harshit.blogapi.payload.PagedResponse;
import com.harshit.blogapi.security.UserPrincipal;

public interface TagService {

	PagedResponse<Tag> getAllTags(int page, int size);

	Tag getTag(Long id);

	Tag addTag(Tag tag, UserPrincipal currentUser);

	Tag updateTag(Long id, Tag newTag, UserPrincipal currentUser);

	ApiResponse deleteTag(Long id, UserPrincipal currentUser);

}
