// ignore_for_file: public_member_api_docs

import '../../model/github_user.dart';
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
  }) {
    if (!offline) {
      return remote.getAllUsersRecords(forceRefresh: forceRefresh);
    } else {
      return local.getAllUsers();
    }
  }

  Future<GitHubUser?> getUserInfoRecords({
    required GitHubUser user,
    bool forceRefresh = false,
    bool offline = false,
  }) {
    if (!offline) {
      return remote.getUserInfoRecords(
        user: user,
        forceRefresh: forceRefresh,
      );
    } else {
      return local.getUserInfo(user.login ?? '');
    }
  }
}
