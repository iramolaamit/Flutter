import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
 class MyApp extends StatelessWidget {
    MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'App Demo',
       debugShowCheckedModeBanner: false,
       debugShowMaterialGrid: true,
       theme: ThemeData.light(),
       home: Scaffold(

         appBar: AppBar(
           title: Text('App Demo' , style :TextStyle(
               color: Colors.black,
               letterSpacing: 1.0,
                fontSize: 30,
             wordSpacing: 10,
             fontWeight: FontWeight.w500,
             backgroundColor: Colors.redAccent,


             textBaseline: TextBaseline.alphabetic,
           )
           ),
            centerTitle: true,
           automaticallyImplyLeading: true,
           bottomOpacity: 100,
           foregroundColor: Colors.black26,

           actions: [
             Icon(Icons.add_box_outlined),
           ],
         ),
       ),
     ) ;
   }
 }


