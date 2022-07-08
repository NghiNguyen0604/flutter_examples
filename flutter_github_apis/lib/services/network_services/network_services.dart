// ignore_for_file: public_member_api_docs

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../utils/utilities.dart';

class NetworkServices {
  // ignore: slash_for_doc_comments
  /** Check connectivity
   ** true : Network is connected.
   ** false: Network is not connected.
  */
  static Future<bool> checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Utils.log(title: 'NETWORK', info: 'Connected.');

      return true;
    } else {
      Utils.log(title: 'NETWORK', info: 'Not connected.');

      return false;
    }
  }
}
