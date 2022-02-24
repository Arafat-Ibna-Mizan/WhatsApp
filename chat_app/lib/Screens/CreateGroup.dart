import 'package:chat_app/CustomUI/AvtarCard.dart';
import 'package:chat_app/CustomUI/ButtonCard.dart';
import 'package:chat_app/CustomUI/ContactCard.dart';
import 'package:chat_app/Model/ChatModel.dart';
import 'package:chat_app/Screens/CreateGroup.dart';
import 'package:flutter/material.dart';
class CreateGroup extends StatefulWidget {

  const CreateGroup({key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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
  List<ChatModel> groups =[];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Create Group",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Add Participants',
                style: TextStyle(
                  fontSize: 12,
                ),),

            ],
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 25,)),

          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length+1,
                itemBuilder: (context,index)
                {
                  if(index==0)
                    {
                      return Container(
                        height: groups.length>0?90:10,
                      );
                    }
                  return InkWell(
                    onTap: (){
                      if(contacts[index-1].select==false)
                        {
                          setState(() {
                            contacts[index-1].select=true;
                            groups.add(contacts[index-1]);
                          });
                        }
                      else
                        {
                          setState(() {
                            contacts[index-1].select=false;
                            groups.remove(contacts[index]);
                          });
                        }

                    },
                    child: ContactCard
                      (contact: contacts[index-1],
                    ),
                  );
                }
            ),
            groups.length>0?Column(
              children: [
                Container(
                  height: 75,
                  color: Colors.amberAccent,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: contacts.length,
                      itemBuilder: (context,index)
                          {
                            if(contacts[index].select==true)
                              {
                                return InkWell(
                                  onTap: (){
                                    setState(() {
                                      groups.remove(contacts[index]);
                                      contacts[index].select=false;

                                    });
                                  },
                                    child: AvtarCard(
                                      contact: contacts[index],
                                    )
                                );
                              }
                            else
                              {
                                return Container();
                              }
                          }
                  ),
                ),
                Divider(
                  thickness: 1,
                )
              ],
            ):Container(),
          ],
        ),

    );
  }
}
