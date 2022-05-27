import 'package:flutter/material.dart';

import 'model/user.dart';

class DetailPage extends StatelessWidget {

  final User user;

  const DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(user.fname),
        ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
               Container(
                padding: EdgeInsets.all(0.0),
                height: 170,
                decoration:  const BoxDecoration(
                    image: DecorationImage(
                      image:
                      NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_LiAb0N5xXwPFMBkvXX9_vZPvCevgexuFiw&usqp=CAU"),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      repeat: ImageRepeat.noRepeat,
                    )),
              ),
              Card(
                elevation: 10.0,
                shape: const CircleBorder(),
                color: Colors.transparent,
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.only(top: 40),
                  child: Center(
                    child: Hero(
                      tag: "image${user.index}",
                      child: CircleAvatar(
                        radius: 100.0,
                        backgroundImage: NetworkImage(
                            user.pictureLarge),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  padding: EdgeInsets.only(top: 270),
                  child: Card(
                    elevation: 7,
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Text(
                              user.fname+" "+user.lname,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.0),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            user.email,
                            style: const TextStyle(color: Colors.grey,  fontSize: 17.0),
                          ),
                          SizedBox(height: 10,),
                          Text(user.phone, style: const TextStyle(fontSize: 17.0)),
                          SizedBox(height: 10,),
                          Text(
                            user.dob.split("T")[0],
                              style: const TextStyle(fontSize: 17.0)
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),


            ],
          )
        ],
      ),
    );
  }
}