import 'package:dio/dio.dart';

class GitHubApiServices {
  final _dio = Dio();
  Future<void> test() async {
    const _accessUrl = 'https://api.github.com/users';
    final response = await _dio.get(
      _accessUrl,
      queryParameters: {
        'since': 135,
      },
    );
    print(response.data);
  }
}
