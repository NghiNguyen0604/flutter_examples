/*
 * Autogenerated header by File Header Comment extension - Donna Iwan
 * File:       global_providers.dart
 * Created on: Fri Jul 08 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description 
 */
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Network status provider
final connectivityProvider = FutureProvider.autoDispose<bool>(
  (ref) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  },
);
