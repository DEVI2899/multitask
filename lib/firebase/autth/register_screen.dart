import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;


  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register page', style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body:  Form(
          key:_formKey ,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      fillColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),

                      )
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: passwordController,
                  decoration:  InputDecoration(
                      fillColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),

                      )
                  ),

                ),
              ),

              const SizedBox(height: 10,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple
                  ),
                  onPressed: (){
                   registerMethod() ;
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const Login()));

                  }, child: const Text('Register',
                style: TextStyle(fontSize: 20, color: Colors.white),)),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('Already you  have account please login account ?'),
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const Login()));
                  }, child: const Text('Login')),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void registerMethod( )async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('successfully register')));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

}