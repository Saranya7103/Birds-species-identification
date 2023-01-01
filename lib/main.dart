import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:birds_main/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // fontFamily: 'Raleway-BoldItalic.ttf'),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class HomeScreen extends StatelessWidget
{
//   const HomeScreen({Key? key}):super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
//
//
// }
// class _HomePageState extends State<HomeScreen>
// {
  String selectedImagePath='';
  Future<FirebaseApp> _intializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: FutureBuilder(
        future: _intializeFirebase(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return LoginPage();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}