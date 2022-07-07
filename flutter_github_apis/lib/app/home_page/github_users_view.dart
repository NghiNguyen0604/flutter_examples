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

import 'github_user_details_page.dart';

class GitHubUsersView extends StatelessWidget {
  const GitHubUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        );
    final subtitle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.normal,
        );
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading:
              CircleAvatar(child: Image.asset('assets/images/avatar_1.png')),
          title: Text(
            'User name $index',
            style: title,
          ),
          subtitle: Text(
            'https://github.com/NghiNguyen0604',
            style: subtitle,
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const GitHubUserDetailsPage(),
              ),
            );
          },
        );
      },
    );
  }
}
