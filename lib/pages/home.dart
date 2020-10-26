import 'dart:io';
import 'package:provider/provider.dart';
import 'package:band_names/models/band.dart';
import 'package:band_names/services/socket_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final socketService = context.watch<SocketService>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Band Names',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 1.0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: socketService.serverStatus == ServerStatus.Online
                ? Icon(
                    Icons.check_circle,
                    color: Colors.blue,
                  )
                : Icon(
                    Icons.check_circle,
                    color: Colors.red,
                  ),
          )
        ],
      ),
      body: Column(
        children: [
          socketService.bands.length == 0
              ? Container()
              : _showGraph(socketService.bands),
          Expanded(
            child: ListView.builder(
              itemCount: socketService.bands.length,
              itemBuilder: (_, index) => _bandTile(socketService.bands[index]),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 1.0,
        onPressed: _addNewBand,
      ),
    );
  }

  Widget _bandTile(Band band) {
    final socketService = context.read<SocketService>();

    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        socketService.socket.emit('delete-band', {'id': band.id});
      },
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Deteled Band',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            band.name.substring(0, 2),
          ),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text(
          '${band.votes}',
          style: TextStyle(fontSize: 20.0),
        ),
        onTap: () {
          socketService.socket.emit(
            'vote-band',
            {'id': band.id},
          );
        },
      ),
    );
  }

  _addNewBand() {
    final textController = TextEditingController();

    if (Platform.isAndroid) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('New Band Name'),
            content: TextField(
              controller: textController,
            ),
            actions: [
              MaterialButton(
                child: Text('Add'),
                elevation: 5.0,
                textColor: Colors.blue,
                onPressed: () => addBandToList(textController.text),
              )
            ],
          );
        },
      );
    }

    showCupertinoDialog(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: Text('New Band Name'),
          content: CupertinoTextField(
            controller: textController,
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Add'),
              onPressed: () {
                print('vovovo');
                return addBandToList(textController.text);
              },
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: Text('Dissmis'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }

  addBandToList(String name) {
    if (name.length > 1) {
      context.read<SocketService>().socket.emit('add-band', {'name': name});
    }
    Navigator.pop(context);
  }

  _showGraph(List<Band> bands) {
    Map<String, double> dataMap = new Map();

    bands.forEach((element) {
      dataMap[element.name] = element.votes.toDouble();
    });
    return Container(
      width: double.infinity,
      height: 200.0,
      child: PieChart(dataMap: dataMap),
    );
  }
}
