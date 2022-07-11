// ignore_for_file: public_member_api_docs

import '../../model/github_user.dart';

/*
 * Autogenerated header by File Header Comment extension - Donna Iwan
 * File:       github_user_services.dart
 * Created on: Fri Jul 08 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description 
 */
abstract class GitHubUsersServices {
  /// Get all users from source
  Future<List<GitHubUser>> getAllUsers();

  /// Get user information from source
  Future<GitHubUser?> getUserInfo(
    String login,
  );

  /// Get all users from cache
  Future<Map<String, dynamic>> getAllUsersRecords({
    bool forceRefresh = false,
  });

  /// Get user information from cache
  Future<Map<String, dynamic>> getUserInfoRecords({
    required GitHubUser user,
    bool forceRefresh = false,
  });
  void saveAllUsers({required List<GitHubUser> users});
  void saveUser({
    required GitHubUser user,
  });
  int checkUsersBuffer();
}