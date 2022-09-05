import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  Online,
  Offline,
  Connecting,
}

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket? _socket;

  ServerStatus get serverStatus => _serverStatus;
  IO.Socket get socket => _socket!;

  SocketService() {
    this._initConfig();
  }

  void _initConfig() {
    // Dart client
    _socket = IO.io('http://192.168.1.43:3000', {
      'transports': ['websocket'],
      'autoConnect': true,
    });
    _socket!.onConnect((_) {
      _serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    _socket!.onDisconnect((_) {
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
    // _socket.on('new-message', (payload) {
    //   print('new message $payload');
    //   print('nombre:' + payload['nombre']);
    //   print('nombre:' + payload['message']);
    // });
  }
}
