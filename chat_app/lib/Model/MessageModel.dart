import 'package:flutter/cupertino.dart';

class MessageModel {
  String type;
  String message;
  String time;
  String path;
  MessageModel(this.type, this.message, this.time, @required this.path);
}
