// ignore_for_file: public_member_api_docs

import 'dart:io';

/*
 * Autogenerated header by File Header Comment extension - Donna Iwan
 * File:       local_storage_services.dart
 * Created on: Sat Jul 09 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description : Local storage services.
 */
import 'package:path_provider/path_provider.dart';

class LocalStorageServices {
  LocalStorageServices._internal();
  static String imagesDirName = 'images';
  static final LocalStorageServices instance = LocalStorageServices._internal();
  String _path = '';
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _path = dir.path;
  }

  Future<void> createDirectory(String dirName) async {
    final exist = Directory('$_path/$dirName').existsSync();
    if (!exist) {
      await Directory('$_path/$dirName').create(recursive: true);
    }
  }

  Future<void> saveFile({
    required String filePath,
    required List<int> bytes,
  }) async {
    final file = File(filePath);
    await file.writeAsBytes(bytes);
  }

  Future<List<int>> readFile({
    required String filePath,
    required List<int> bytes,
  }) async {
    final file = File(filePath);
    return file.readAsBytes();
  }

  String path() {
    return _path;
  }
}
