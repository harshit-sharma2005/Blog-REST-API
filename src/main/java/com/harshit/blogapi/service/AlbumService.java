package com.harshit.blogapi.service;

import com.harshit.blogapi.model.Album;
import com.harshit.blogapi.payload.AlbumResponse;
import com.harshit.blogapi.payload.ApiResponse;
import com.harshit.blogapi.payload.PagedResponse;
import com.harshit.blogapi.payload.request.AlbumRequest;
import com.harshit.blogapi.security.UserPrincipal;
import org.springframework.http.ResponseEntity;

public interface AlbumService {

	PagedResponse<AlbumResponse> getAllAlbums(int page, int size);

	ResponseEntity<Album> addAlbum(AlbumRequest albumRequest, UserPrincipal currentUser);

	ResponseEntity<Album> getAlbum(Long id);

	ResponseEntity<AlbumResponse> updateAlbum(Long id, AlbumRequest newAlbum, UserPrincipal currentUser);

	ResponseEntity<ApiResponse> deleteAlbum(Long id, UserPrincipal currentUser);

	PagedResponse<Album> getUserAlbums(String username, int page, int size);

}
