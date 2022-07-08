// ignore_for_file: public_member_api_docs

/*
 * Autogenerated header by File Header Comment extension - Donna Iwan
 * File:       github_usersservices_remote.dart
 * Created on: Fri Jul 08 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description 
 */
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../model/github_user.dart';
import '../../utils/utilities.dart';
import 'github_users_services.dart';

/// This class used to interface with users through github API.
class GitHubUsersServicesRemote extends GitHubUsersServices {
  GitHubUsersServicesRemote._internal() {
    cacheValidDuration_ = const Duration(minutes: 5);
    lastFetchTime_ = DateTime.fromMillisecondsSinceEpoch(0);
  }

  /// Instance
  static final GitHubUsersServicesRemote instance =
      GitHubUsersServicesRemote._internal();
  late Duration cacheValidDuration_;
  late DateTime lastFetchTime_;
  List<GitHubUser> users = [];
  final dio_ = Dio();
  final url_ = 'https://api.github.com/users';
  @override
  Future<List<GitHubUser>> getAllUsers() async {
    try {
      final response = await dio_.get(
        url_,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        queryParameters: {
          'since': 1,
        },
      );
      if (response.statusCode == 200) {
        users = [
          ...await compute(_usersParser, response.data as List<dynamic>),
        ];
      }
    } catch (e) {
      throw ArgumentError(e.toString());
    }
    return users;
  }

  Future<void> _refreshAllUsersRecords() async {
    users = await getAllUsers();
    lastFetchTime_ = DateTime.now();
  }

  @override
  Future<List<GitHubUser>> getAllUsersRecords({
    bool forceRefresh = false,
  }) async {
    final shouldRefreshFromAPI = forceRefresh ||
        users.isEmpty ||
        lastFetchTime_.isBefore(DateTime.now().subtract(cacheValidDuration_));
    if (shouldRefreshFromAPI) {
      Utils.log(title: 'REFRESH', info: 'Get new users from API.');
      await _refreshAllUsersRecords();
    } else {
      Utils.log(title: 'REFRESH', info: 'Get old users from cache.');
    }
    return users;
  }

  @override
  Future<GitHubUser?> getUserInfo(String login) async {
    try {
      final response = await dio_.get(
        '$url_/$login',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        final user = GitHubUser.fromMap(
          Map<String, dynamic>.from(response.data as Map<dynamic, dynamic>),
        );

        ///Stored this user to buffer.
        final index = users.indexWhere((element) => element.id == user.id);
        if (index != -1) {
          users[index] = user;
        }
        return user;
      } else {
        return null;
      }
    } catch (e) {
      throw ArgumentError(e.toString());
    }
  }

  @override
  Future<GitHubUser?> getUserInfoRecords({
    required GitHubUser user,
    bool forceRefresh = false,
  }) async {
    final shouldRefreshFromAPI = forceRefresh ||
        lastFetchTime_.isBefore(DateTime.now().subtract(cacheValidDuration_));
    if (shouldRefreshFromAPI) {
      return getUserInfo(user.login ?? '');
    } else {
      return user;
    }
  }

  static List<GitHubUser> _usersParser(List<dynamic> data) {
    return data
        .map(
          (e) => GitHubUser.fromMap(
            Map<String, dynamic>.from(e as Map<dynamic, dynamic>),
          ),
        )
        .toList();
  }
}
