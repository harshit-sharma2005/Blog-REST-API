package com.harshit.blogapi.service;

import com.harshit.blogapi.model.user.User;
import com.harshit.blogapi.payload.ApiResponse;
import com.harshit.blogapi.payload.InfoRequest;
import com.harshit.blogapi.payload.UserIdentityAvailability;
import com.harshit.blogapi.payload.UserProfile;
import com.harshit.blogapi.payload.UserSummary;
import com.harshit.blogapi.security.UserPrincipal;

public interface UserService {

	UserSummary getCurrentUser(UserPrincipal currentUser);

	UserIdentityAvailability checkUsernameAvailability(String username);

	UserIdentityAvailability checkEmailAvailability(String email);

	UserProfile getUserProfile(String username);

	User addUser(User user);

	User updateUser(User newUser, String username, UserPrincipal currentUser);

	ApiResponse deleteUser(String username, UserPrincipal currentUser);

	ApiResponse giveAdmin(String username);

	ApiResponse removeAdmin(String username);

	UserProfile setOrUpdateInfo(UserPrincipal currentUser, InfoRequest infoRequest);

}