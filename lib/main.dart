
import 'package:animation/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'imeage_search/image_search.dart';
import 'imeage_search/sample.dart';

 Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyARQtfxTdQxK9dXGOa71oO6q3XjZbiTt8o',
        appId: '58594',
        messagingSenderId: 'sendid',
        projectId: 'authentication-58594',
        storageBucket: 'authentication-58594.appspot.com',
      )
  );

  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
          create: (context) => UserProvider(),
          ),

        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          //home: const RandomColor(),
         //  home:const CameraScreen() ,
          //   home: const ListData(),
         home: ImageSearchScreen(),
        //  home: const RegisterPage(),
          debugShowCheckedModeBanner: false,
        ),


    );
  }
}




