import 'package:chat_app/CustomUI/ButtonCard.dart';
import 'package:chat_app/Model/ChatModel.dart';
import 'package:chat_app/Screens/Homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ChatModel sourcechat;
  List<ChatModel> chatmodels = [
    ChatModel(
      name: "Arafat",
      icon: "person.svg",
      isGroup: false,
      time: "11:40 PM",
      currentMessage: "Hello !everyone.",
      id: 1,
    ),
    ChatModel(
      name: "Jame",
      icon: "person.svg",
      isGroup: false,
      time: "11:45 PM",
      currentMessage: "Hey! to everyone.",
      id: 2,
    ),
    ChatModel(
      name: "Nur Akhi",
      icon: "person.svg",
      isGroup: false,
      time: "11:50 PM",
      currentMessage: "Hi! to everyone.",
      id: 3,
    ),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chatmodels.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  sourcechat = chatmodels.removeAt(index);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (buider) => Homescreen(
                                chatmodels: chatmodels,
                                sourcechat: sourcechat,
                              )));
                },
                child: ButtonCard(
                  name: chatmodels[index].name,
                  icon: Icons.person,
                ),
              )),
    );
  }
}
