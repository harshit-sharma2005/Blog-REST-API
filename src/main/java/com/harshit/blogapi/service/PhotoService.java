package com.harshit.blogapi.service;

import com.harshit.blogapi.payload.ApiResponse;
import com.harshit.blogapi.payload.PagedResponse;
import com.harshit.blogapi.payload.PhotoRequest;
import com.harshit.blogapi.payload.PhotoResponse;
import com.harshit.blogapi.security.UserPrincipal;

public interface PhotoService {

	PagedResponse<PhotoResponse> getAllPhotos(int page, int size);

	PhotoResponse getPhoto(Long id);

	PhotoResponse updatePhoto(Long id, PhotoRequest photoRequest, UserPrincipal currentUser);

	PhotoResponse addPhoto(PhotoRequest photoRequest, UserPrincipal currentUser);

	ApiResponse deletePhoto(Long id, UserPrincipal currentUser);

	PagedResponse<PhotoResponse> getAllPhotosByAlbum(Long albumId, int page, int size);

}