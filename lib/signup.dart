import 'package:birds_main/imagePicker.dart';
import 'package:birds_main/loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:birds_main/colors.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUpPage extends StatelessWidget {
//   const LoginPage({Key? key}) :super(key: key);
//
//   @override
//   LoginPageState createState() => LoginPageState();
// }

  static Future<User?> createUsingEmailPassword(
      {required String email,required String password,
        required BuildContext context}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential = await
      auth.createUserWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    }
    on FirebaseAuthException catch(e){
      if(e.code=="user-not-found"){
        print(e);
      }
    }
    return user;
  }
  @override
  Widget build(BuildContext context)
  {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset : true,
      body: Stack(
        children: <Widget>[

          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/yellow.jpeg'), fit: BoxFit.cover)),
          ),
          // Container(
          //   margin: EdgeInsets.all(10),
          //   child:Image.asset('assets/images/A-removebg-preview.png'),
          // ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Color(0xff161d27).withOpacity(0.9),
                  Color(0xff161d27),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // Image(image:AssetImage('assets/images/A-removebg-preview.png'),
                //   fit: BoxFit.cover,
                // ),
                Text(
                  "Sign Up!",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontSize: 38,
                      fontWeight: FontWeight.bold
                  ),

                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "New? Create account here!!",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey.shade700),
                      filled: true,
                      fillColor: Color(0xff161d27).withOpacity(0.9),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: colors)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: colors)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey.shade700),
                      filled: true,
                      fillColor: Color(0xff161d27).withOpacity(0.9),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: colors)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: colors)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                // Text(
                //   "Forgot Password?",
                //   style: TextStyle(
                //       color: colors, fontSize: 14, fontWeight: FontWeight.bold),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    onPressed: () async{
                      User? user = await createUsingEmailPassword(email: emailController.text, password: passwordController.text, context: context);
                      print(user);
                      if(user!=null) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder:( context)=> const ImagePickerPage()));
                      }
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:( context)=> LoginPage()));
                    },
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )
                        )
                    ),
                    child: Text(
                      "SIGN up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Text(
                //       "It's your first time here?",
                //       style: TextStyle(color: Colors.white),
                //     ),
                //     SizedBox(
                //       width: 8,
                //     ),
                //     Text(
                //       "Sign up",
                //       style:
                //       TextStyle(color: colors, fontWeight: FontWeight.bold),
                //     )
                //   ],
                // ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}