import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  final connectivityStreamController = StreamController<ConnectivityResult>();

  ConnectivityService() {
    _connectivity.onConnectivityChanged.listen((event) {
      connectivityStreamController.add(event);
    });
  }
}
