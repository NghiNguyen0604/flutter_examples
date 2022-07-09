// ignore_for_file: public_member_api_docs

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global_providers.dart';
import '../../../services/local_storage_services/local_storage_services.dart';

class UserAvatarView extends ConsumerWidget {
  const UserAvatarView({
    Key? key,
    required this.url,
    required this.pathToImageData,
    this.radius = 50,
  }) : super(key: key);
  final String url;
  final String pathToImageData;
  final double radius;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectivityAsync = ref.watch(connectivityProvider);
    return connectivityAsync.when(
      data: (isConnected) {
        if (isConnected) {
          return CircleAvatar(
            radius: radius,
            backgroundImage: url.isNotEmpty ? Image.network(url).image : null,
          );
        } else {
          return FutureBuilder(
            future: LocalStorageServices.instance
                .readFile(filePath: pathToImageData),
            builder: (context, snapshotData) {
              if (snapshotData.hasData) {
                final data = snapshotData.data! as List<int>;
                return CircleAvatar(
                  radius: radius,
                  backgroundImage: url.isNotEmpty
                      ? Image.memory(Uint8List.fromList(data)).image
                      : null,
                );
              } else {
                return const SizedBox();
              }
            },
          );
        }
      },
      error: (error, _) => Center(
        child: Text(error.toString()),
      ),
      loading: () => const SizedBox(),
    );
  }
}
