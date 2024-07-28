import 'package:animation/firebase/autth/profile_screen.dart';
import 'package:animation/firebase/autth/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Login successful, navigate to the home screen
    } catch (e) {
      print("Failed to login: $e");
      // Handle login failure
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login page', style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body:  Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                  controller:emailController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration:  InputDecoration(
                      fillColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),

                      )
                  ),
                  controller: passwordController,
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple
                  ),
                  onPressed: (){
                    _login();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) =>const ProfileScreen()));
                  }, child: const Text('Login',
                style: TextStyle(fontSize: 20, color: Colors.white),)),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('you Do not have account please register account ?'),
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) =>const RegisterPage()));
                  }, child: const Text('Register')),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}