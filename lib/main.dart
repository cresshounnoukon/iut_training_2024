import 'package:flutter/material.dart';
import 'package:training/pages/friend_list_page.dart';

void main(){
  runApp(MyApp());
 }

 class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Iut Training',
       home: FriendListPage(),
     );
   }
 }
