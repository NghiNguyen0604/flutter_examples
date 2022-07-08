// ignore_for_file: public_member_api_docs, no_leading_underscores_for_local_identifiers

/*
 * File:       home_page.dart
 * Created on: Sun Jun 19 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description : This screen display the github's user list.
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/github_users_services/github_users_services_files.dart';
import 'github_user_details_page.dart';

class GitHubUsersView extends ConsumerWidget {
  const GitHubUsersView({
    Key? key,
    required this.forceRefresh,
    this.onPop,
  }) : super(key: key);
  final bool forceRefresh;
  final void Function()? onPop;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        );
    final subtitle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.normal,
        );

    return Consumer(
      builder: (context, ref, _) {
        final _usersAsync = ref.watch(
          getAllUsersProvider(forceRefresh),
        );
        return _usersAsync.when(
          data: (mUsers) {
            return ListView.builder(
              itemCount: mUsers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 50,
                    backgroundImage: (mUsers[index].avatar_url ?? '').isNotEmpty
                        ? Image.network(mUsers[index].avatar_url!).image
                        : null,
                  ),
                  title: Text(
                    mUsers[index].login ?? '',
                    style: title,
                  ),
                  subtitle: Text(
                    mUsers[index].url ?? '',
                    style: subtitle,
                  ),
                  onTap: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const GitHubUserDetailsPage(),
                      ),
                    );
                    onPop?.call();
                  },
                );
              },
            );
          },
          error: (error, _) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(
            child: Text('Đang tải dữ liệu.'),
          ),
        );
      },
    );
  }
}
