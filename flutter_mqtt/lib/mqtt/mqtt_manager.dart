/*
 * Autogenerated header by File Header Comment extension - Donna Iwan
 * File:       mqtt_manager.dart
 * Created on: Mon Jul 11 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description 
 */
import 'package:flutter/foundation.dart';
import 'package:flutter_mqtt/mqtt/mqtt_files.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import 'mqtt_app_state.dart';

class MQTTManager {
  String? usr = 'aijsc';
  String? password = 'AiJSC!@3456';
  // Private instance of client
  final MQTTAppState state;
  MqttServerClient? client;
  final String identifier;
  final String host;
  final String topic;

  // Constructor
  MQTTManager({
    required this.host,
    required this.topic,
    required this.identifier,
    required this.state,
  });

  void initializeMQTTClient() {
    client = MqttServerClient(host, identifier);
    client!.port = 8883;
    client!.keepAlivePeriod = 20;
    client!.onDisconnected = onDisconnected;
    client!.secure = true;
    client!.autoReconnect = false;
    client!.logging(on: true);

    /// Add the successful connection callback
    client!.onConnected = onConnected;
    client!.onSubscribed = onSubscribed;

    final MqttConnectMessage connMess = MqttConnectMessage()
        .authenticateAs('aijsc', 'AiJSC!@3456')
        .withClientIdentifier(identifier)
        .withWillTopic('global,') // If you set this you must set a will message
        .withWillMessage('My Will message')
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    client!.connectionMessage = connMess;
  }

  // Connect to the host
  void connect() async {
    assert(client != null);
    try {
      MQTTManager.log(title: 'MQTT', msg: 'Client connecting');
      state.setAppConnectionState(MQTTAppConnectionState.connecting);
      await client!.connect(usr, password);
    } on Exception catch (e) {
      MQTTManager.log(title: 'MQTT', msg: 'Client exception - $e');
      disconnect();
    }
  }

  void disconnect() {
    MQTTManager.log(title: 'MQTT', msg: 'Disconnected');
    client!.disconnect();
  }

  void publish(String message) {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client!.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
  }

  /// The subscribed callback
  void onSubscribed(String topic) {
    MQTTManager.log(
        title: 'MQTT', msg: 'Subscription confirmed for topic $topic');
  }

  /// The unsolicited disconnect callback
  void onDisconnected() {
    MQTTManager.log(
        title: 'MQTT', msg: 'client callback - Client disconnection');
    state.setAppConnectionState(MQTTAppConnectionState.disconnected);
  }

  /// The successful connect callback
  void onConnected() {
    state.setAppConnectionState(MQTTAppConnectionState.connected);
    MQTTManager.log(title: 'MQTT', msg: 'client Connected');
    client!.subscribe(topic, MqttQos.atLeastOnce);
    client!.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final MqttPublishMessage recMess = c![0].payload as MqttPublishMessage;
      final String pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      state.setReceivedText(pt);
      MQTTManager.log(
          title: 'MQTT',
          msg: 'topic is <${c[0].topic}>, payload is <-- $pt -->');
    });
    MQTTManager.log(title: 'MQTT', msg: 'client Connected');
  }

  static void log({required String title, required String msg}) {
    if (kDebugMode) {
      debugPrint('$title: $msg');
    }
  }
}