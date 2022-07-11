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
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/config.dart';
import '../../model/github_user.dart';
import '../../services/github_users_services/github_users_services_files.dart';
import '../../utils/utilities.dart';
import 'shared/user_avatar_view.dart';

class GitHubUserDetailsPage extends ConsumerStatefulWidget {
  const GitHubUserDetailsPage({
    Key? key,
  }) : super(key: key);
  @override
  ConsumerState<GitHubUserDetailsPage> createState() =>
      _GitHubUserDetailsPageState();
}

class _GitHubUserDetailsPageState extends ConsumerState<GitHubUserDetailsPage> {
  bool forceRefresh = false;
  void _onPullToRefresh() {
    if (!forceRefresh) {
      setState(() {
        forceRefresh = true;
      });
    }

    ref.refresh(getUserProvider(forceRefresh));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(
      getUserProvider(forceRefresh),
    );

    return userAsync.when(
      data: (mUser) {
        return RefreshIndicator(
          onRefresh: () async {
            _onPullToRefresh();
          },
          child: Scaffold(
            body: ListView(
              children: [
                GitHubUserHeaderView(
                  imageUrl: mUser.avatar_url,
                  pathToImageData: mUser.avatar_path ?? '',
                  onRefresh: _onPullToRefresh,
                ),
                GitHubUserInformationView(
                  user: mUser,
                ),
              ],
            ),
          ),
        );
      },
      error: (error, _) => Center(
        child: Text(
          error.toString(),
        ),
      ),
      loading: () => const Scaffold(
        body: Center(
          child: Text('Đang tải dữ liệu.'),
        ),
      ),
    );
  }
}

class GitHubUserHeaderView extends StatefulWidget {
  const GitHubUserHeaderView({
    Key? key,
    required this.imageUrl,
    required this.pathToImageData,

    ///for desktop
    this.onRefresh,
  }) : super(key: key);
  final String imageUrl;
  final String pathToImageData;
  final void Function()? onRefresh;
  static const double coverHeight = 240;
  static const double avatarHeight = 120;
  static const double shift = 0.8;

  /// Change this value if additional background image to assets/images;
  static const int imagesAssetLength = 3;
  static int backgroundImageIdx = 1;

  @override
  State<GitHubUserHeaderView> createState() => _GitHubUserHeaderViewState();
}

class _GitHubUserHeaderViewState extends State<GitHubUserHeaderView> {
  late String _imageUrl;
  late String _pathToImageData;
  final random = Random();
  late String _backgroundImagePath;
  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(covariant GitHubUserHeaderView oldWidget) {
    super.didUpdateWidget(oldWidget);

    _init();
  }

  void _init() {
    _randomImagePath();

    _imageUrl = widget.imageUrl;
    _pathToImageData = widget.pathToImageData;
  }

  void _randomImagePath() {
    final idx = _randomValue(GitHubUserHeaderView.backgroundImageIdx);
    Utils.log(title: 'BackgroundImageIdx', info: idx);

    _backgroundImagePath = 'assets/images/background_$idx.png';
  }

  int _randomValue(int oldValue) {
    while (true) {
      final tmp = 1 + random.nextInt(GitHubUserHeaderView.imagesAssetLength);
      if (tmp != oldValue) {
        GitHubUserHeaderView.backgroundImageIdx = tmp;
        return tmp;
      }
    }
  }

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
            _backgroundImagePath,
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
                size: 24,
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
          top: 10,
          right: 10,
          child: Builder(
            builder: (context) {
              final platform = Utils.checkPlatform(context);
              if (platform == PlatformEnum.web ||
                  platform == PlatformEnum.desktop) {
                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      widget.onRefresh?.call();
                    },
                    child: const Icon(
                      Icons.sync,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
        // Positioned(
        //   top: avatarPosition,
        //   child: CircleAvatar(
        //     radius: avatarHeight / 2,
        //     backgroundImage:
        //         imageUrl.isNotEmpty ? Image.network(imageUrl).image : null,
        //   ),
        Positioned(
          top: avatarPosition,
          child: UserAvatarView(
            radius: GitHubUserHeaderView.avatarHeight / 2,
            url: _imageUrl,
            pathToImageData: _pathToImageData,
          ),
        ),
      ],
    );
  }
}

class GitHubUserInformationView extends StatelessWidget {
  const GitHubUserInformationView({
    Key? key,
    required this.user,
  }) : super(key: key);
  final GitHubUser user;
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
    final userName = user.login;
    final location = user.location ?? '';
    final following = user.following ?? 0;
    final follower = user.followers ?? 0;
    final repos = user.public_repos ?? 0;
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
                  userName,
                  style: titleStyle,
                ),
                Text(
                  location,
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
                  follower,
                ),
                const SizedBox(
                  width: AppInsets.xl,
                ),
                _buildNumber(
                  context,
                  'Following',
                  following,
                ),
                const SizedBox(
                  width: AppInsets.xl,
                ),
                _buildNumber(
                  context,
                  'Repos',
                  repos,
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
