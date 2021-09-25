import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Message extends Equatable {
  String type;
  String name;
  String voltage;
  String inOut;
  Message({
    required this.type,
    required this.name,
    required this.voltage,
    required this.inOut,
  });

  Message copyWith({
    String? type,
    String? name,
    String? voltage,
    String? inOut,
  }) {
    return Message(
      type: type ?? this.type,
      name: name ?? this.name,
      voltage: voltage ?? this.voltage,
      inOut: inOut ?? this.inOut,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'name': name,
      'voltage': voltage,
      'inOut': inOut,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      type: map['type'],
      name: map['name'],
      voltage: map['voltage'],
      inOut: map['inOut'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [type, name, voltage, inOut];
}
