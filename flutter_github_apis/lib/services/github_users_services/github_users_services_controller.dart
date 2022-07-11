// ignore_for_file: public_member_api_docs, no_leading_underscores_for_local_identifiers
/*
 * Autogenerated header by File Header Comment extension - Donna Iwan
 * File:       github_users_services_controller.dart
 * Created on: Fri Jul 08 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description 
 */

import '../../model/github_user.dart';
import '../../utils/utilities.dart';
import 'github_users_services.dart';

class GitHubUsersServicesController {
  GitHubUsersServicesController({
    required this.remote,
    required this.local,
  });
  final GitHubUsersServices remote;
  final GitHubUsersServices local;

  Future<List<GitHubUser>> getAllUsersRecords({
    bool forceRefresh = false,
    bool offline = false,
  }) async {
    if (!offline) {
      final length = remote.checkUsersBuffer();
      if (length == 0) {
        Utils.log(title: 'LOCAL', info: 'Fetch users data.');
        final localUsers = await local.getAllUsers();
        if (localUsers.isNotEmpty) {
          ///Save users data to buffer.
          remote.saveAllUsers(users: localUsers);

          ///Fetch users data from remote.
          final records =
              await remote.getAllUsersRecords(forceRefresh: forceRefresh);
          return records['data'] as List<GitHubUser>;
        } else {
          ///Get new users from remote.
          final records =
              await remote.getAllUsersRecords(forceRefresh: forceRefresh);
          if (!(records['cache'] as bool)) {
            /// Stored to local if data fetch from API.
            local.saveAllUsers(users: records['data'] as List<GitHubUser>);
          }

          return records['data'] as List<GitHubUser>;
        }
      } else {
        ///Get users from remote. May be from cache.
        final records =
            await remote.getAllUsersRecords(forceRefresh: forceRefresh);
        if (!(records['cache'] as bool)) {
          /// Stored to local if data fetch from API.

          local.saveAllUsers(users: records['data'] as List<GitHubUser>);
        }

        return records['data'] as List<GitHubUser>;
      }
    } else {
      return local.getAllUsers();
    }
  }

  Future<GitHubUser?> getUserInfoRecords({
    required GitHubUser user,
    bool forceRefresh = false,
    bool offline = false,
  }) async {
    if (!offline) {
      final records = await remote.getUserInfoRecords(
        user: user,
        forceRefresh: forceRefresh,
      );
      final _user = records['data'] as GitHubUser;
      if (!(records['cache'] as bool)) {
        local.saveUser(user: _user);
      }
      return _user;
    } else {
      return local.getUserInfo(user.login);
    }
  }
}
