import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:instanew/Screens/DashBoard.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:instanew/Screens/Signup.dart';
import 'package:lottie/lottie.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isloading  = false;
  Future<void> googlesignin(context) async{
    final signin = GoogleSignIn();
    final googleAccount = await signin.signIn();
    if(googleAccount!=null){
       final googleauth = await googleAccount.authentication;
      if(googleauth.accessToken!=null && googleauth.idToken!=null){
        try{
          await auth.signInWithCredential(
            GoogleAuthProvider.credential(idToken: googleauth.idToken,
            accessToken: googleauth.accessToken));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashBoard()));
        }on FirebaseException catch(error){

        }catch (error){

        }finally{

        }
      }
    }
  }
  bool loading = false;
  Future register()async{
    var url = "http://10.0.2.2/qbswork/index.php";
    var response = await http.post(Uri.parse(url),body: {
      "email" : email.text.toString(),
      "password" : password.text.toString()
    });
    var data = jsonDecode(response.body);
    if(data == "Error"){
      Fluttertoast.showToast(msg: "This User Already Exist!",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIosWeb: 1,backgroundColor: Colors.red,textColor: Colors.white,fontSize: 16);
    }
    else{
      Fluttertoast.showToast(msg: "Registration Successfull",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIosWeb: 1,backgroundColor: Colors.red,textColor: Colors.white,fontSize: 16);
    }
  }
  FirebaseAuth auth = FirebaseAuth.instance;
  void signin(){
    auth.signInWithEmailAndPassword(email: email.text.toString(), password: password.text.toString()).then((value){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashBoard()));
    }).onError((error, stackTrace){
      debugPrint(error.toString());
      Fluttertoast.showToast(msg: error.toString(),toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIosWeb: 1,backgroundColor: Colors.red,textColor: Colors.white,fontSize: 16);

    });
  }
  void login(){
    if(email.text.toString()==""){
      print("Enter your email");
     final snackBar = SnackBar(
        content: const Text('Enter your email'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    if(!email.text.toString().contains("@gmail.com")){
      print("correct your email");
      final snackBar = SnackBar(
        content: const Text('correct your email'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    if(password.text.toString().isEmpty){
      print("Enter your password");
      final snackBar = SnackBar(
        content: const Text('Enter your password'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    if(password.text.toString().length<6){
      print(" your password length is too short");
      final snackBar = SnackBar(
        content: const Text('your password length is too short'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    else{
      print("Done Bro");
      final snackBar = SnackBar(
        content: const Text('Successfully login'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashBoard()));
    }
    // if(password.text.toString()!=""){
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text("Please fill your password",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
    //   ));
    //   return;
    // }
    // if(email!="" && password!=""){
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoard()));
    //   return;
    // }
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 200,
                  child: Lottie.asset("assets/login.json",animate: true,fit: BoxFit.cover),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "@gmail.com",
                    label: Text("Enter your email"),
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    )
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: TextFormField(
                  controller: password,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "********",
                      label: Text("Enter your password"),
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter your password";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40)
                ),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  onPressed: (){
                    signin();
                    register();
                    login();
                    setState(() {
                      loading = true;
                    });
                  },
                  minWidth: double.infinity,
                  height: 50,
                  color: Colors.blue,
                child: Text("Submit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text("Don't have an account",style: TextStyle(fontSize: 12),),
                    ),
                    SizedBox(width: 5,),
                    InkWell(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signup()));
                        },
                        child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      child: InkWell(
                          onTap: (){
                            googlesignin(context);
                          },
                          child: Image(image: AssetImage("assets/google.png"),height: 40,width: 40,)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
