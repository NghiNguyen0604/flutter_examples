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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/app_router.dart';
import 'github_users_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        actions: [
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
      body: const GitHubUsersView(),
    );
  }
}
