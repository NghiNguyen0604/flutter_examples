/*
 * File:       main.dart
 * Created on: Sun Jun 19 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description 
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'app/my_app.dart';
import 'services/github_users_services/github_users_services_files.dart';
import 'services/local_storage_services/sembast_database.dart';
import 'theme/theme_controller.dart';
import 'theme/theme_providers.dart';
import 'theme/theme_sembast.dart';
import 'theme/theme_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Init local storage database
  final sembastLocalStore = await SembastDataStore.init();
  final ThemeService themeService = ThemeServiceSembast(sembastLocalStore);

  final themeModeController = ThemeModeController(themeService);
  await themeModeController.getThemeMode();

  final themeController = SchemeController(themeService);
  await themeController.getTheme();
  final githubUsersServicesRemote = GitHubUsersServicesRemote.instance;
  final gitHubUsersServicesLocal =
      GitHubUsersServicesLocal(dataStore: sembastLocalStore);
  final githubUsersServicesController = GitHubUsersServicesController(
    remote: githubUsersServicesRemote,
    local: gitHubUsersServicesLocal,
  );

  // turn off the # in the URLs on the web
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

  runApp(
    ProviderScope(
      overrides: [
        themeModeControllerProvider.overrideWithValue(themeModeController),
        schemeControllerProvider.overrideWithValue(themeController),
        githubUsersServicesProvider
            .overrideWithValue(githubUsersServicesController),
      ],
      child: const MyApp(),
    ),
  );
}
