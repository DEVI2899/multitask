
import 'package:animation/providers/user_provider.dart';
import 'package:animation/screens/camera_screen.dart';
import 'package:animation/screens/home_screen.dart';
import 'package:animation/screens/list_view.dart';
import 'package:animation/screens/random_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'firebase/autth/register_screen.dart';
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
          routes: {
            '/' : (context) =>const HomeScreen(),
            '/Random' : (context) => const RandomColor(),
            '/ListData' :(context) => const ListData(),
            '/camera' :(context) => const CameraScreen(),
            '/ImageSearch': (context) => ImageSearchScreen(),
            '/auth' :(context) =>const RegisterPage()
          },

          debugShowCheckedModeBanner: false,
        ),


    );
  }
}




