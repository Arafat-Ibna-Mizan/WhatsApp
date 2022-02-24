import 'package:chat_app/CustomUI/ButtonCard.dart';
import 'package:chat_app/CustomUI/ContactCard.dart';
import 'package:chat_app/Model/ChatModel.dart';
import 'package:chat_app/Screens/CreateGroup.dart';
import 'package:flutter/material.dart';
class SelectContact extends StatefulWidget {
   const SelectContact({key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel>contacts=[
      ChatModel(
        name:'Arafat',
        status: 'An app developer',
      ),
      ChatModel(
        name:'Nazmul',
        status: 'A cheater',
      ),
      ChatModel(
        name:'Sajid',
        status: 'Theoretical lover',
      ),
      ChatModel(
        name:'Tonu',
        status: 'Profitable lover',
      ),

      ChatModel(
        name:'Sifat',
        status: 'Good thiker',
      ),
      ChatModel(
        name:'Golap',
        status: 'boss public',
      ),
      ChatModel(
        name:'Hasan',
        status: 'Little master',
      ),
      ChatModel(
        name:'Faizul',
        status: 'A good person ovar all',
      ),

    ];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Contact",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
            Text('300 Contacts',
              style: TextStyle(
                fontSize: 12,
              ),),

          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 25,)),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("Invite a Friend"),
                value: "Invite a Friend",
              ),
              PopupMenuItem(
                child: Text("Contacts"),
                value: "Contacts",
              ),
              PopupMenuItem(
                child: Text("Refresh"),
                value: "Refresh",
              ),
              PopupMenuItem(
                child: Text("Help"),
                value: "Help",
              ),
            ];
          }
          )
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length+2,
        itemBuilder: (context,index)
        {
        if(index==0)
        {
          return InkWell
            (
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>CreateGroup()));
            },
              child: ButtonCard
                (icon: Icons.group,name:'new group')
          );
        }
        else if(index==1)
          {
          return ButtonCard(icon: Icons.person_add,name:'new contact');
          }
            return ContactCard
            (contact: contacts[index-2],
            );
          }
      )

    );
  }
}
