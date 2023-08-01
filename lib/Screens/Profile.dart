import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instanew/Screens/Login.dart';
import 'package:provider/provider.dart';

import '../constants/theme_changer.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<theme_changer>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Asif Taj Tech'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: AnimatedCrossFade(
              crossFadeState: Theme.of(context).brightness == Brightness.light
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: CircleAvatar(
                radius: 50,
              ),
              secondChild: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.tealAccent,
              ),
              duration: Duration(milliseconds: 200),
            ),
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Light Mode'),
            groupValue: themeChanger.themeMode,
            value: ThemeMode.light,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark Mode'),
            groupValue: themeChanger.themeMode,
            value: ThemeMode.dark,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('System Mode'),
            groupValue: themeChanger.themeMode,
            value: ThemeMode.system,
            onChanged: themeChanger.setTheme,
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: MaterialButton(onPressed: ()
            {
              FirebaseAuth.instance.signOut().then((value){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
              }).onError((error, stackTrace){
                Fluttertoast.showToast(msg: error.toString(),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16);
              });
            },child: Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16),),height: 50,minWidth: double.infinity,color: Colors.blue,),
          )
        ],
      ),
    );
  }
}

