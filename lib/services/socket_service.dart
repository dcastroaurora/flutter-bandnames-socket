import 'package:band_names/models/band.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  Online,
  Offline,
  Connecting,
}

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;
  List<Band> _bands = [];

  ServerStatus get serverStatus => _serverStatus;
  IO.Socket get socket => _socket;
  List<Band> get bands => _bands;

  SocketService() {
    this._initConfig();
  }

  void _initConfig() {
    this._socket = IO.io('http://192.168.1.105:3000', {
      'transports': ['websocket'],
      'autoConnect': true,
    });

    this._socket.on('connect', (_) {
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    this._socket.on('disconnect', (_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    this._socket.on('active-bands', (payload) {
      this._bands = (payload as List)
          .map(
            (band) => Band.fromJson(band),
          )
          .toList();
      notifyListeners();
    });

    // this._socket.on('nuevo-mensaje', (payload) {
    //   print('message of flutter:$payload');
    //   // print(
    //   //     payload.containsKey('mensaje2') ? payload['mensaje2'] : 'No existe');
    // });
  }
}
