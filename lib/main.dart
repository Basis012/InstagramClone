import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/SplashScreen.dart';
import 'constants/newconstants.dart';
import 'constants/theme_changer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<theme_changer>(
        create: (_) => theme_changer(),
        child: Builder(
            builder: (BuildContext context) {
              final themeChanger = Provider.of<theme_changer>(context);
              return  MaterialApp(
                title: 'Flutter Demo',
                home:  SplashScreen(),
                themeMode: themeChanger.themeMode,
                theme: ThemeData(
                  textTheme: const TextTheme(
                    headline3: TextStyle(fontFamily: 'Bold', fontSize: 20.0,color: Colors.black ),
                    headline4: TextStyle(fontFamily: 'Bold', fontSize: 18.0,color: Color(0xff25292B) ),
                    headline5: TextStyle(fontFamily: Bold,fontSize: 16.0,color: Color(0xff25292B) ),
                    headline6: TextStyle(fontFamily: Bold, fontSize: 14.0,color: Color(0xff25292B)),
                    bodyText1: TextStyle(fontFamily: Regular, fontSize: 12.0, color: Color(0xff25292B)),
                    bodyText2: TextStyle(fontFamily: Regular, fontSize: 10.0, color:Color(0xff25292B)),
                  ),
                  iconTheme: IconThemeData(
                      color: Colors.grey.shade600
                  ),
                ),

                darkTheme: ThemeData(
                    brightness: Brightness.dark,
                    textTheme: const TextTheme(
                      headline3: TextStyle(fontFamily: 'Bold', fontSize: 20.0,color: Colors.white ),
                      headline4: TextStyle(fontFamily: 'Bold', fontSize: 18.0,color: Colors.white ),
                      headline5: TextStyle(fontFamily: Bold,fontSize: 16.0, color: Colors.white),
                      headline6: TextStyle(fontFamily: Bold, fontSize: 14.0,color: Colors.white),
                      bodyText1: TextStyle(fontFamily: Regular, fontSize: 12.0, color: Colors.white),
                      bodyText2: TextStyle(fontFamily: Regular, fontSize: 10.0,color: Colors.white),
                    ),
                    iconTheme: IconThemeData(
                        color: Colors.grey
                    )
                ),
                debugShowCheckedModeBanner: false,
              );

            })
    );
  }
}

