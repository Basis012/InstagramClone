
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instanew/Screens/Login.dart';
import 'package:lottie/lottie.dart';
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Future<void> showchoicedialog() async{
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Select",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Row(
                children: [
                  GestureDetector(
                    child: Icon(Icons.camera,size: 40,color: Colors.blue,),

                  ),
                  SizedBox(width: 20,),
                  GestureDetector(
                    child: Icon(Icons.camera_enhance,size: 40,color: Colors.blue,),

                  )
                ],
              ),
            ],
          ),
        ),
      );
    },);
  }
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  void Signup(){
    if(name.text.toString().isEmpty){
      print("Enter your name");
      final snackBar = SnackBar(
        content: const Text('Enter your name'),
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
    if(email.text.toString().isEmpty){
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
    if(phone.text.toString().isEmpty){
      print("Enter your phone number");
      final snackBar = SnackBar(
        content: const Text('Enter your phone number'),
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
      print("password lenth is too short");
      final snackBar = SnackBar(
        content: const Text('password length is too short'),
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
    if(password.text.toString()!=confirmpassword.text.toString()){
      print("password is not match");
      final snackBar = SnackBar(
        content: const Text('your password is not matched'),
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
    if(password.text.toString()==confirmpassword.text.toString()){

      print("Account createed");
      return;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              margin: EdgeInsets.symmetric(horizontal: 15),
              child:  CircleAvatar(
                backgroundImage: NetworkImage("https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bWVuJTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                radius: 50,
                backgroundColor: Colors.blue,
              ),
            ),
            SizedBox(height: 10,),
            MaterialButton(onPressed: (){
              showchoicedialog();
            },
              height: 40,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child: Text("Image Upload"),
              color: Colors.blue,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: TextFormField(
                controller: name,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Name",
                    label: Text("Enter your Name"),
                    prefixIcon: Icon(Icons.near_me),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    )
                ),
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
                controller: phone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "+92",
                    label: Text("Enter your phone number"),
                    prefixIcon: Icon(Icons.phone),
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
                obscureText: true,
                textInputAction: TextInputAction.send,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "********",
                    label: Text("Enter your password"),
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: TextFormField(
                controller: confirmpassword,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "********",
                    label: Text("Confirm password"),
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    )
                ),
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
                  Signup();
                  auth.createUserWithEmailAndPassword(email: email.text.toString(), password: password.text.toString()).then((value){
                    name.text = "";
                    email.text = "";
                    phone.text = "";
                    password.text = "";
                    confirmpassword.text = "";
                  }).onError((error, stackTrace){
                    Fluttertoast.showToast(msg: error.toString(),
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16);
                  });
                },
                minWidth: double.infinity,
                height: 50,
                color: Colors.blue,
                child: Text("Submit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15,right: 15,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text("Already have an account",style: TextStyle(fontSize: 12),),
                  ),
                  SizedBox(width: 5,),
                  InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                      },
                      child: Text("Sign in",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
