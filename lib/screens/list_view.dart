import 'package:animation/providers/user_provider.dart';
import 'package:animation/screens/list_view_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListData extends StatefulWidget {
  const ListData({super.key});

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  @override
  Widget build(BuildContext context) {
    final userprovider =Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ApiEnd points'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body:  FutureBuilder(
        future: userprovider.fetchItems(),
        builder: (context, snapshot) {
           if (snapshot.hasError) {
            return Center(child:
            Text('Error: ${snapshot.error}'));
         } else {
            return ListView.builder(
                itemCount: userprovider.details.length,
                itemBuilder: (context ,index){
                  final data = userprovider.details[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(data.id.toString()),
                        ),
                        title: Text(data.title,
                          style: const TextStyle(color:Colors.black ,fontSize: 20 ),),
                        subtitle: Text(data.body),
                        onTap: () {
                         Navigator.pushReplacement(context,
                             MaterialPageRoute(builder: (context)=> ListViewDetails(userinfo: data)));
                        },
                      ),
                    ),
                  );
                },
            );
          }
       }
      ),
    );
  }
}
