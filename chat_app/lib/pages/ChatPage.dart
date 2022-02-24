import 'package:chat_app/CustomUI/CustomCard.dart';
import 'package:chat_app/Model/ChatModel.dart';
import 'package:chat_app/Screens/SelectContact.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final List<ChatModel> chatmodels;

  const ChatPage({Key key, this.chatmodels, this.sourcechat}) : super(key: key);
  final ChatModel sourcechat;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: "Arafat",
      icon: "person.svg",
      isGroup: false,
      time: "11:40 PM",
      currentMessage: "Hello! everyone.",
    ),
    ChatModel(
      name: "Jame",
      icon: "person.svg",
      isGroup: false,
      time: "11:45 PM",
      currentMessage: "Hey! to everyone.",
    ),
    ChatModel(
      name: "Nur Akhi",
      icon: "person.svg",
      isGroup: false,
      time: "11:50 PM",
      currentMessage: "Hi! to everyone.",
    ),
    ChatModel(
      name: "Family pack",
      icon: "groups.svg",
      isGroup: true,
      time: "11:55 PM",
      currentMessage: "Hows! to everyone.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => SelectContact()));
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: widget.chatmodels.length,
        itemBuilder: (context, index) => CustomCard(
          chatModel: widget.chatmodels[index],
          sourcechat: widget.sourcechat,
        ),
      ),
    );
  }
}
