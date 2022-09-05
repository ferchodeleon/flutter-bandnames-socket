import 'package:band_name/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    void _emitMessage() {
      print('object');
      return socketService.socket.emit(
          'new-message', {'nombre': 'Flutter', 'message': 'Desde flutter'});
    }

    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ServerStatus ${socketService.serverStatus}'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () => _emitMessage(),
      ),
    );
  }
}
