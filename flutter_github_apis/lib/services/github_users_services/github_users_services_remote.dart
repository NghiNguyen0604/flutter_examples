// ignore_for_file: public_member_api_docs, unnecessary_this

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
    cacheUsersValidDuration_ = const Duration(minutes: 5);
    lastFetchUsersTime_ = DateTime.fromMillisecondsSinceEpoch(0);
    cacheUserValidDuration_ = const Duration(minutes: 5);
  }

  /// Instance
  static final GitHubUsersServicesRemote instance =
      GitHubUsersServicesRemote._internal();
  late Duration cacheUsersValidDuration_;
  late DateTime lastFetchUsersTime_;
  late Duration cacheUserValidDuration_;
  List<GitHubUser> users_ = [];

  /// Record log for users.
  List<Map<String, dynamic>> usersLog_ = [];
  final dio_ = Dio();
  final url_ = 'https://api.github.com/users';
  @override
  Future<List<GitHubUser>> getAllUsers() async {
    var users = <GitHubUser>[];
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
        users = await compute(_usersParser, response.data as List<dynamic>);
      }
    } catch (e) {
      throw ArgumentError(e.toString());
    }
    return users;
  }

  Future<void> _refreshAllUsersRecords() async {
    this.saveAllUsers(users: await getAllUsers());
    lastFetchUsersTime_ = DateTime.now();
  }

  @override
  Future<List<GitHubUser>> getAllUsersRecords({
    bool forceRefresh = false,
  }) async {
    final shouldRefreshFromAPI = forceRefresh ||
        users_.isEmpty ||
        lastFetchUsersTime_
            .isBefore(DateTime.now().subtract(cacheUsersValidDuration_));
    if (shouldRefreshFromAPI) {
      Utils.log(title: 'REFRESH', info: 'Get new users from API.');
      await _refreshAllUsersRecords();
    } else {
      Utils.log(title: 'REFRESH', info: 'Get old users from cache.');
    }
    return users_;
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
        this.saveUser(user: user);
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
    final logIdx = usersLog_.indexWhere(
      (element) => (element['login'] as String) == user.login,
    );
    final lastFetchUserTime = logIdx != -1
        ? usersLog_[logIdx]['lastTime'] as DateTime
        : DateTime.fromMillisecondsSinceEpoch(0);
    final shouldRefreshFromAPI = forceRefresh ||
        lastFetchUserTime
            .isBefore(DateTime.now().subtract(cacheUserValidDuration_));
    if (shouldRefreshFromAPI) {
      if (logIdx != -1) {
        usersLog_[logIdx].update(
          'lastTime',
          (value) => DateTime.now(),
        );
      } else {
        usersLog_.add({
          'lastTime': DateTime.now(),
          'login': user.login,
        });
      }
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

  @override
  void saveAllUsers({required List<GitHubUser> users}) {
    users_ = [...users];
  }

  @override
  void saveUser({
    required GitHubUser user,
  }) {
    users_ = [
      for (final mUser in users_)
        if (mUser.id == user.id) user else mUser,
    ];
  }

  @override
  int checkUsersBuffer() {
    return users_.length;
  }
}
