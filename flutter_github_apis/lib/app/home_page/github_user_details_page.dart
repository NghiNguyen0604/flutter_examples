// ignore_for_file: public_member_api_docs

/*
 * Autogenerated header by File Header Comment extension - Donna Iwan
 * File:       github_user_details_page.dart
 * Created on: Thu Jul 07 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description: Display user infomation.
 */
import 'package:flutter/material.dart';

import '../../config/config.dart';

class GitHubUserDetailsPage extends StatefulWidget {
  const GitHubUserDetailsPage({Key? key}) : super(key: key);

  @override
  State<GitHubUserDetailsPage> createState() => _GitHubUserDetailsPageState();
}

class _GitHubUserDetailsPageState extends State<GitHubUserDetailsPage> {
  void _onPullToRefresh() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          GitHubUserHeaderView(),
          GitHubUserInformationView(),
        ],
      ),
    );
  }
}

class GitHubUserHeaderView extends StatelessWidget {
  const GitHubUserHeaderView({Key? key}) : super(key: key);
  static const double coverHeight = 240;
  static const double avatarHeight = 120;
  static const double shift = 0.8;
  @override
  Widget build(BuildContext context) {
    const avatarPosition = GitHubUserHeaderView.coverHeight -
        GitHubUserHeaderView.avatarHeight * GitHubUserHeaderView.shift;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(
            bottom: GitHubUserHeaderView.avatarHeight *
                (1 - GitHubUserHeaderView.shift),
          ),
          child: Image.asset(
            'assets/images/background_1.png',
            height: GitHubUserHeaderView.coverHeight,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
        ),
        const Positioned(
          top: 10,
          child: Text(
            'Profile',
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: avatarPosition,
          child: CircleAvatar(
            radius: avatarHeight / 2,
            backgroundImage: Image.asset(
              'assets/images/avatar_1.png',
              fit: BoxFit.contain,
            ).image,
          ),
        ),
      ],
    );
  }
}

class GitHubUserInformationView extends StatelessWidget {
  const GitHubUserInformationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(fontWeight: FontWeight.bold);
    final noteStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 12,
        );
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
        left: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: AppInsets.xl,
              bottom: AppInsets.xl,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'User Name',
                  style: titleStyle,
                ),
                Text(
                  'Location',
                  style: noteStyle,
                ),
              ],
            ),
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.only(
              top: AppInsets.xl,
              bottom: AppInsets.xl,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildNumber(
                  context,
                  'Followers',
                  323,
                ),
                const SizedBox(
                  width: AppInsets.xl,
                ),
                _buildNumber(
                  context,
                  'Following',
                  234,
                ),
                const SizedBox(
                  width: AppInsets.xl,
                ),
                _buildNumber(
                  context,
                  'Repos',
                  30,
                ),
              ],
            ),
          ),
          const Divider(),
          Row(
            children: [
              Text(
                'About',
                style: titleStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumber(BuildContext context, String title, int value) {
    final style = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(fontWeight: FontWeight.normal);
    return Column(
      children: [
        Text(
          '$value',
          style: style,
        ),
        Text(
          title,
          style: style,
        ),
      ],
    );
  }
}
