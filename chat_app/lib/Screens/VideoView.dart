import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class Videoview extends StatefulWidget {
  const Videoview({Key key,this.path}) : super(key: key);
  final String path;

  @override
  _VideoviewState createState() => _VideoviewState();
}

class _VideoviewState extends State<Videoview> {
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.crop_rotate,size: 27,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.emoji_emotions_outlined,size: 27,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.title,size: 27,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.edit,size: 27,)),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-150,
              child: _controller.value.initialized
                  ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
                  : Container(),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black38,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                child: TextFormField(
                  minLines: 1,
                  maxLines: 6,
                  style:TextStyle(
                      color: Colors.white,
                      fontSize: 18
                  ) ,

                  decoration: InputDecoration(border:InputBorder.none,
                      hintText: "Add caption",
                      prefixIcon: Icon(Icons.add_photo_alternate,color: Colors.white,size: 27,),
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ),
                      suffixIcon:CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.teal,
                        child: Icon(Icons.check,color: Colors.white,size: 27,),
                      )
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center ,
              child: InkWell(
                onTap: (){
                  setState(() {
                    _controller.value.isPlaying?_controller.pause():_controller.play();
                  });
                },
                child: CircleAvatar(
                  radius: 33,backgroundColor: Colors.black38,
                  child: Icon(_controller.value.isPlaying?Icons.pause:Icons.play_arrow,
                    color: Colors.white,size: 50,),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
