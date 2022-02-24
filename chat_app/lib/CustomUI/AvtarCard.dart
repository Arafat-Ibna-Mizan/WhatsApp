import 'package:chat_app/Model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class AvtarCard extends StatelessWidget {
  const AvtarCard({Key  key,this.contact}) : super(key: key);
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children:[
              CircleAvatar(
                radius: 22,
                child: SvgPicture.asset("assets/person.svg",color: Colors.white,height: 30,width: 30,),
                backgroundColor: Colors.blueGrey,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 10,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),


            ],
          ),
          SizedBox(
            height: 2,
          ),
          Text(contact.name,
          style: TextStyle(
            fontSize: 12
          ),),
        ],
      ),
    );
  }
}
