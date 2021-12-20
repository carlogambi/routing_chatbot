import 'package:routing_app/navigation/spindox_locations.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart' as locationPack;
import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';

import './../../../routing_components/RoutingExample.dart';

// import 'package:here_sdk/core.dart';

class NavigationPopup extends StatefulWidget {
  final Map data;

  NavigationPopup({Key? key, required this.data}) : super(key: key);

  @override
  _NavigationPopupState createState() => _NavigationPopupState();
}

class _NavigationPopupState extends State<NavigationPopup> {
  RoutingExample? _routingExample;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // inserimento componente mappa in scaffold principale
        HereMap(onMapCreated: _onMapCreated),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            button('Add Route', _addRouteButtonClicked),
            button('Clear Map', _clearMapButtonClicked),
          ],
        ),
      ],
    );
  }

  void _onMapCreated(HereMapController hereMapController) {
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay,
        (MapError? error) {
      if (error == null) {
        _routingExample = RoutingExample(_showDialog, hereMapController);
      } else {
        print("Map scene not loaded. MapError: " + error.toString());
      }
    });
  }

  void _addRouteButtonClicked() {
    _routingExample?.addRoute();
  }

  void _clearMapButtonClicked() {
    _routingExample?.clearMap();
  }

  // A helper method to add a button on top of the HERE map.
  Align button(String buttonLabel, Function callbackFunction) {
    return Align(
      alignment: Alignment.topCenter,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.lightBlueAccent,
          onPrimary: Colors.white,
        ),
        onPressed: () => callbackFunction(),
        child: Text(buttonLabel, style: TextStyle(fontSize: 20)),
      ),
    );
  }

  // A helper method to show a dialog.
  Future<void> _showDialog(String title, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  // var currentCoord;
  // var currentOffice;
  // RoutingExample? _routingExample;

  // dynamic getLocation() async {
  //   locationPack.Location location = new locationPack.Location();
  //   bool _serviceEnabled;
  //   locationPack.PermissionStatus _permissionGranted;
  //   locationPack.LocationData _locationData;
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == locationPack.PermissionStatus.DENIED) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != locationPack.PermissionStatus.GRANTED) {
  //       print('permission granted');
  //     }
  //   }
  //   _locationData = await location.getLocation();
  //   setState(() {
  //     currentCoord = _locationData;
  //   });
  //   return await location.getLocation();
  // }

  // void _onMapCreated(HereMapController hereMapController) {
  //   hereMapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay,
  //       (MapError? error) {
  //     if (error == null) {
  //       this._routingExample = RoutingExample(_showDialog, hereMapController);
  //     } else {
  //       print("Map scene not loaded. MapError: " + error.toString());
  //     }
  //   });
  // }

  // Future<void> _showDialog(String title, String message) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(title),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Text(message),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text('OK'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   var location = this.getLocation();
  //   location.then((value) => {
  //         this.setState(() {
  //           currentCoord = value;
  //           currentOffice = spindoxLocations[widget.data['workplace']];
  //         })
  //       });
  //   return Dialog(
  //       backgroundColor: Colors.transparent,
  //       insetPadding: EdgeInsets.all(10),
  //       child: Stack(
  //         clipBehavior: Clip.none,
  //         alignment: Alignment.center,
  //         children: <Widget>[
  //           Container(
  //             width: double.infinity,
  //             height: 500,
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(15),
  //                 color: Colors.lightBlue),
  //             padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
  //             child: HereMap(onMapCreated: _onMapCreated),
  //             // child: Text(currentCoord.toString(),
  //             //     style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
  //           ),
  //           Positioned(
  //               top: -100,
  //               child: Image.network("https://i.imgur.com/2yaf2wb.png",
  //                   width: 150, height: 150))
  //         ],
  //       ));

  // }
}
