import 'package:dio/dio.dart';

import '../../model/github_user.dart';

class GitHubApiServices {
  final _dio = Dio();
  Future<void> test() async {
    const _accessUrl = 'https://api.github.com/users';
    final response = await _dio.get(
      _accessUrl,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
      queryParameters: {
        'since': 135,
      },
    );
    final _users = (response.data as List<dynamic>)
        .map(
          (e) => GitHubUser.fromMap(
            Map<String, dynamic>.from(e as Map<dynamic, dynamic>),
          ),
        )
        .toList();
    print(_users);
  }

  Future<void> test1() async {
    const _accessUrl = 'https://api.github.com/users/simonjefford';
    final response = await _dio.get(
      _accessUrl,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    final _user = GitHubUser.fromMap(
      Map<String, dynamic>.from(response.data as Map<dynamic, dynamic>),
    );
    print(_user);
  }
}
