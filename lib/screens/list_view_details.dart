import 'package:animation/model/user_details.dart';
import 'package:flutter/material.dart';

class ListViewDetails extends StatelessWidget {
  const ListViewDetails({super.key, required this.userinfo});
  final Userdetails userinfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading:
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back)),

        title: const Text('Details Screen',
            style: TextStyle(fontSize: 25, color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'USER ID: ${userinfo.userId}',
                  style: const TextStyle(fontSize: 25, color: Colors.purple),
                ),
                const SizedBox(width:100 ,),
                Text(
                  'ID: ${userinfo.id}',
                  style: const TextStyle(fontSize: 25, color: Colors.purple),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Description: ${userinfo.body}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
