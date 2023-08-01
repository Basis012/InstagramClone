
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instanew/ModelClass/UserModel.dart';
class StoryView extends StatefulWidget {
  const StoryView({Key? key,required this.userModel}) : super(key: key);
 final UserModel userModel;
  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  double percent = 0.0;
  late Timer timer;
  void starttime(){
    timer = Timer.periodic(Duration(microseconds: 10), (timer) {
      setState(() {
        percent +=0.001;
        if(percent>1){
          timer.cancel();
          Navigator.pop(context);
        }
      });
    });
  }
  @override
  void initState() {
    starttime();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.userModel.background),
                  fit: BoxFit.cover
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 36.0,horizontal: 8.0),
              child: Column(
                children: [
                  LinearProgressIndicator(
                    value: percent,
                  ),
                  SizedBox(height: 8.0,),
                  Row(
                    children: [
                      CircleAvatar(
                      backgroundImage: NetworkImage(widget.userModel.url),
                        radius: 30.0,
                      ),
                      SizedBox(width: 8.0),
                      Text(widget.userModel.username,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
    );
  }
}
