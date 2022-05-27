import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'details_page.dart';
import 'model/user.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Users'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];
  Future<List<User>> _getUsers() async {

    var data = await http.get(Uri.parse('https://randomuser.me/api/?results=10'));

    var jsonData = json.decode(data.body);


    int index = 0;
    for(var u in jsonData['results']){
      User user = User(
        index: index,
        fname: u['name']['first'],
        lname: u['name']['last'],
        email: u['email'],
        phone: u['phone'],
        pictureLarge: u['picture']['large'],
        pictureSmall: u['picture']['medium'],
        gender: u['gender'],
        dob: u['dob']['date'],
      );
      users.add(user);
      index++;
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            print(snapshot.data);
            if(snapshot.data == null){
              return Container(
                  child: const Center(
                      child: Text("Loading...")
                  )
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card (child:ListTile(
                    leading: CircleAvatar(backgroundImage:
                    NetworkImage(users[index].pictureSmall)),
                    title: Text(snapshot.data[index].fname),
                    subtitle: Text(snapshot.data[index].email),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index]))
                      );
                    },
                  ));
                },
              );
            }
          },
        ),
      ),
    );
  }
}








