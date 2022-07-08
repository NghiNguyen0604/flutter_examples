import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'github_users_services_files.dart';

/// Provider github users services.
final githubUsersServicesProvider = Provider<GitHubUsersServicesController>(
  (ref) => throw ArgumentError(
    'This provider will be overrided when initializing the app.',
  ),
);
