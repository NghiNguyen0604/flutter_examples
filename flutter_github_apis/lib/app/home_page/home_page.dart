// ignore_for_file: public_member_api_docs

/*
 * File:       home_page.dart
 * Created on: Sun Jun 19 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description : Main screen.
 */

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../config/app_router.dart';
import '../../config/config.dart';
import '../../services/github_users_services/github_users_services_files.dart';
import '../../utils/utilities.dart';
import 'github_users_view.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool forceRefresh = false;
  void _onPullToRefresh() {
    if (!forceRefresh) {
      setState(() {
        forceRefresh = true;
      });
    }

    ref.refresh(getAllUsersProvider(forceRefresh));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('User List')),
        actions: [
          Builder(
            builder: (context) {
              final platform = Utils.checkPlatform(context);
              if (platform == PlatformEnum.web ||
                  platform == PlatformEnum.desktop) {
                return IconButton(
                  icon: const Icon(Icons.sync),
                  onPressed: _onPullToRefresh,
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              context.pushNamed(AppRouter.SETTINGS);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _onPullToRefresh();
        },
        child: GitHubUsersView(
          forceRefresh: forceRefresh,
          onPop: () {
            setState(() {
              forceRefresh = false;
            });
            ref.refresh(getAllUsersProvider(forceRefresh));
          },
        ),
      ),
    );
  }
}
