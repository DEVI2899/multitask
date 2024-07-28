import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomeScreen'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10))
                    )
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/Random');
                }, child: const Text('Random',
                style: TextStyle(color: Colors.white),
              ),),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10))
                    )
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/ListData');
                }, child: const Text('List view',
                style: TextStyle(color: Colors.white),
              ),),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10))
                    )
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/camera');
                }, child: const Text('Camera',
                style: TextStyle(color: Colors.white),
              ),),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10))
                    )
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/ImageSearch');
                }, child: const Text('Image Search',
                style: TextStyle(color: Colors.white),
              ),),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10))
                    )
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/auth');
                }, child: const Text('Register page',
                style: TextStyle(color: Colors.white),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
