import 'package:chat_app/Model/ChatModel.dart';
import 'package:chat_app/pages/CameraPage.dart';
import 'package:chat_app/pages/ChatPage.dart';
import 'package:chat_app/pages/StatusPage.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  final List<ChatModel> chatmodels;
  final ChatModel sourcechat;

  const Homescreen({Key key, this.chatmodels, this.sourcechat})
      : super(key: key);
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("GezzanUpp"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            PopupMenuButton<String>(onSelected: (value) {
              print(value);
            }, itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("New group"),
                  value: "New group",
                ),
                PopupMenuItem(
                  child: Text("New broadcast"),
                  value: "New broadcast",
                ),
                PopupMenuItem(
                  child: Text("GezzanUpp web"),
                  value: "GezzanUPP web",
                ),
                PopupMenuItem(
                  child: Text("Starred messages"),
                  value: "Starred messages",
                ),
                PopupMenuItem(
                  child: Text("Settings"),
                  value: "Settings",
                ),
              ];
            })
          ],
          bottom: TabBar(
            controller: _controller,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt_outlined),
              ),
              Tab(
                text: 'CHATS',
              ),
              Tab(
                text: 'STATUS',
              ),
              Tab(
                text: 'CALLS',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            CameraPage(),
            ChatPage(
              chatmodels: widget.chatmodels,
              sourcechat: widget.sourcechat,
            ),
            StatusPage(),
            Text('Calls'),
          ],
        ),
      ),
    );
  }
}
