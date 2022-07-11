import 'package:flutter/material.dart';
import 'package:flutter_mqtt/mqtt/mqtt_app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screen/mqtt_view.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProviderScope(
          overrides: [
            mqttAppStateProvider.overrideWithValue(
              MQTTAppState(),
            ),
          ],
          child: const MQTTView(),
        ));
  }
}


/*
Padding(
        padding: const EdgeInsets.all(100.0),
        child: Center(
          child:Column(
            children: <Widget>[
              Center(
                child: RaisedButton(
                  child: Text("Connect"),
                  onPressed: manager.connect ,
                ),
              )
            ],
          ) ,
        ),
      )
 */