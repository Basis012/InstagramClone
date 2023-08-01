
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instanew/ModelClass/UserModel.dart';
import 'package:instanew/Screens/Profile.dart';
import 'package:instanew/Screens/Stories.dart';
import 'package:instanew/Screens/StoryView.dart';
import 'package:instanew/Screens/Suggestions.dart';
import '../CommentScreen.dart';
class DashBoard extends StatefulWidget {
late final UserModel userModel;
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

List<UserModel> names = [
UserModel("Humza", "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWVuJTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60","https://images.unsplash.com/photo-1601108691646-d7f0a1e4ba6f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YmFja2dyb3VuZCUyMGltYWdlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
  UserModel("Taimoor", "https://images.unsplash.com/photo-1595956553066-fe24a8c33395?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWVuJTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60","https://images.unsplash.com/photo-1610295388717-7c72886bd20a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8YmFja2dyb3VuZCUyMGltYWdlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
  UserModel("Ali", "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bWVuJTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60","https://images.unsplash.com/photo-1617084246407-4a69e0d14e71?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGJhY2tncm91bmQlMjBpbWFnZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
  UserModel("Basit", "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bWVuJTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60","https://images.unsplash.com/photo-1498354136128-58f790194fa7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGJhY2tncm91bmQlMjBpbWFnZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
  UserModel("Saqib", "https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1lbiUyMGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60","https://images.unsplash.com/photo-1470790376778-a9fbc86d70e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGJhY2tncm91bmQlMjBpbWFnZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
  UserModel("Ahmed", "https://images.unsplash.com/photo-1624395213043-fa2e123b2656?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8bWVuJTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60","https://images.unsplash.com/photo-1508898578281-774ac4893c0c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGJhY2tncm91bmQlMjBpbWFnZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
  UserModel("Ebad", "https://images.unsplash.com/photo-1513956589380-bad6acb9b9d4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fG1lbiUyMGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60","https://images.unsplash.com/photo-1531315630201-bb15abeb1653?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGJhY2tncm91bmQlMjBpbWFnZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
  UserModel("Huzaifa", "https://images.unsplash.com/photo-1590411506193-00ed62b2d08d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fG1lbiUyMGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60","https://images.unsplash.com/photo-1504660069764-2b37e279874a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGJhY2tncm91bmQlMjBpbWFnZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
  UserModel("Basis", "https://images.unsplash.com/photo-1551022372-0bdac482b9d6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fG1lbiUyMGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60","https://media.istockphoto.com/id/157594819/photo/metal-copper-background-abstract-scratchy-mottled-texture-xl.jpg?b=1&s=170667a&w=0&k=20&c=wZHU005RwFcBDge_UvmQj9eYBOLeaBZiYdo_h8vVslg="),
  UserModel("Mustafa", "https://media.istockphoto.com/id/506116452/photo/horizontal-portrait-of-a-serious-man-with-beard.jpg?b=1&s=170667a&w=0&k=20&c=fnWNfj2qMBsGgCpNFf-kIr2c9tglMVX-zJHv2bpKwVQ=","https://media.istockphoto.com/id/1276983565/photo/big-data-abstract-digital-concept.jpg?s=612x612&w=0&k=20&c=RHeodLNjIBegp6AVWhQzyfIu924z_UdzXld5aR1whw4="),
  UserModel("Ali", "https://media.istockphoto.com/id/1183945946/photo/headshot-portrait-of-happy-mid-adult-hispanic-businessman.jpg?b=1&s=170667a&w=0&k=20&c=890Y54fDwd_JaAacvqMYTaFIzuFRqGBHaJclA2GgKjo=","https://media.istockphoto.com/id/1149046457/photo/background.jpg?s=612x612&w=0&k=20&c=iSiV0i98nFpyIX38I-zJ--CHWCELEMEVM2gC0x0apLE="),
  UserModel("Taimoor", "https://images.unsplash.com/photo-1595956553066-fe24a8c33395?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWVuJTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60","https://images.unsplash.com/photo-1511300636408-a63a89df3482?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8d2FsbHBhcGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
  UserModel("Ali", "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bWVuJTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60","https://images.unsplash.com/photo-1485470733090-0aae1788d5af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHdhbGxwYXBlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
  UserModel("Basit", "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bWVuJTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60","https://images.unsplash.com/photo-1481833761820-0509d3217039?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHdhbGxwYXBlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
  UserModel("Saqib", "https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1lbiUyMGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60","https://images.unsplash.com/photo-1501696461415-6bd6660c6742?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHdhbGxwYXBlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
  UserModel("Ahmed", "https://images.unsplash.com/photo-1624395213043-fa2e123b2656?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8bWVuJTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60","https://images.unsplash.com/photo-1491466424936-e304919aada7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8d2FsbHBhcGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
  UserModel("Ebad", "https://images.unsplash.com/photo-1513956589380-bad6acb9b9d4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fG1lbiUyMGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60","https://images.unsplash.com/photo-1620503374956-c942862f0372?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHdhbGxwYXBlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
  UserModel("Huzaifa", "https://images.unsplash.com/photo-1590411506193-00ed62b2d08d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fG1lbiUyMGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60","https://media.istockphoto.com/id/1371966433/photo/black-carbon-fiber-motion-background-technology-wavy-line-with-red-glowing-light-3d.jpg?b=1&s=170667a&w=0&k=20&c=AEQYj_mIwX9zPN-DgelW1o077BNP0RGtdv07lD4Hhyk="),
  UserModel("Basis", "https://images.unsplash.com/photo-1551022372-0bdac482b9d6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fG1lbiUyMGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60","https://media.istockphoto.com/id/1368264124/photo/extreme-close-up-of-thrashing-emerald-ocean-waves.jpg?b=1&s=170667a&w=0&k=20&c=qha_PaU54cu9QCu1UTlORP4-sW0MqLGERkdFKmC06lI="),
  UserModel("Mustafa", "https://media.istockphoto.com/id/506116452/photo/horizontal-portrait-of-a-serious-man-with-beard.jpg?b=1&s=170667a&w=0&k=20&c=fnWNfj2qMBsGgCpNFf-kIr2c9tglMVX-zJHv2bpKwVQ=","https://images.unsplash.com/photo-1563387852576-964bc31b73af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHdhbGxwYXBlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
  UserModel("Ali", "https://media.istockphoto.com/id/1183945946/photo/headshot-portrait-of-happy-mid-adult-hispanic-businessman.jpg?b=1&s=170667a&w=0&k=20&c=890Y54fDwd_JaAacvqMYTaFIzuFRqGBHaJclA2GgKjo=","https://images.unsplash.com/photo-1580137189272-c9379f8864fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHdhbGxwYXBlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
];
bool color = false;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.blueAccent,
        color: Colors.white,
        onTap: (index){
        if(index==0){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoard()));
        }
       else if(index==1){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Stories()));
        }
        else if(index==2){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Suggestions()));
        }
        else if(index==3){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
        }
        else if(index==4){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
        }
        },
        items: [
          Icon(Icons.home),
          Icon(Icons.search),
          Icon(Icons.video_collection),
          Icon(Icons.add_box_outlined),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(""),
          )
        ],
      ),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Text("Instagram",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
        actions: [
          Icon(Icons.chat),
          SizedBox(width: 20,),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.messenger),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
           Container(
             margin: EdgeInsets.symmetric(horizontal: 10),
             height: 110,
             child: ListView.builder(
               itemCount: names.length,
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (context,index){
                 if(index/2==0){
                   return InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>StoryView(
                         userModel: names[index],
                       )));
                     },
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(
                           child: Row(
                             children: [
                               Stack(
                                 children: [
                                   CircleAvatar(
                                     radius: 35,
                                     backgroundColor:Colors.pinkAccent,
                                     child: CircleAvatar(
                                       backgroundImage: NetworkImage(names[index].url),
                                       backgroundColor: Colors.teal,
                                       radius: 30,
                                     ),
                                   ),
                                  Padding(padding: EdgeInsets.only(left: 54  ,top: 30),
                                  child:  Container(
                                    width: 25,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                  border: Border.all(
                                    color: Colors.blue,
                                  ),
                                        borderRadius: BorderRadius.circular(25)
                                      ),
                                      height: 25,
                                      child: Icon(Icons.add,color: Colors.white,size: 25,)),
                                  )
                                 ],
                               ),
                             ],
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top: 3),
                           child: Text(names[index].username,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                         ),
                       ],
                     ),
                   );
                 }
                 else{
                   return InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>StoryView(userModel: names[index])));
                     },
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(
                           margin: EdgeInsets.only(right: 3,left: 6),
                           child: Row(
                             children: [
                               CircleAvatar(
                                 radius: 35,
                                 backgroundColor:Colors.green,
                                 child: CircleAvatar(
                                   backgroundImage: NetworkImage(names[index].url),
                                   backgroundColor: Colors.teal,
                                   radius: 30,
                                 ),
                               ),
                             ],
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top: 3),
                           child: Text(names[index].username,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                         ),
                       ],
                     ),
                   );
                 }
             }),
           ),
             SizedBox(height: 10,),
             Flexible(
               child: ListView.builder(
                   itemCount: names.length,
                   scrollDirection: Axis.vertical,
                   physics: NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemBuilder: (context,index){
                     return Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                           width: double.infinity,
                           height: 200,
                           margin: EdgeInsets.only(top: 10),
                           child: Image(image: NetworkImage(names[index].background),fit: BoxFit.cover),
                         ),
                         SizedBox(height: 20,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 10),
                               child: InkWell(
                                   onTap:(){
                                     setState(() {
                                        count += !color ? 1 : -1;
                                       color = !color;
                                     });
                     },
                                   //child: Icon(Icons.thumb_up,size: 30,color: (color == false) ? Colors.black : Colors.red)
                               child: Image(image: AssetImage("assets/insta2.png"),color: (color) ? Colors.red : Colors.black,height: 26,width: 26,),
                               ),
                             ),
                             SizedBox(width: 20,),
                             InkWell(
                                 onTap:(){
                     },
                               child: InkWell(
                                   onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentScreen()));
                                   },
                                   child: Image(image: AssetImage("assets/comment.png"),height: 25,width: 25,)),
                                 // child: Icon(Icons.thumb_down_alt,size: 30,)

                             ),
                             SizedBox(width: 20,),
                             InkWell(
                                 onTap:(){
                                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                     content: Text("Thanks",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                   ));
                                   print("long press");
                     },
                                 // child: Icon(Icons.emoji_emotions,size: 30,)
                               child: Image(image: AssetImage("assets/share.png"),height: 25,width: 25,),

                             ),
                             Expanded(child: Column(
                     crossAxisAlignment: CrossAxisAlignment.end,
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(right: 10),
                                   child: Icon(Icons.share),
                                 ),
                               ],
                             ))
                           ],
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 10,top: 10),
                           child: Text("$count likes",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 10,top: 10),
                           child: Text("Humza",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                         )
                       ],
                     );
                   }),
             ),
            ],
          ),
        ),
      ),
    );
  }
 
}
