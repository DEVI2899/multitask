import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _getUserDetails();
  }

  void _getUserDetails() {
    final User? currentUser = _auth.currentUser;
    setState(() {
      _user = currentUser;
    });
  }

 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile Page'),
        ),
        body: _user != null ?Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(_user!.uid),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("${_user!.email}"),
              ),
              ElevatedButton(onPressed: () {
                logout();
              }, child: const Text('Logout'),

              ),
            ],
          ),
        ):  const CircularProgressIndicator(),
      ),
    );
  }
  Future<void> logout()async {
    FirebaseAuth.instance.signOut();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>  const Login()));

  }
}
