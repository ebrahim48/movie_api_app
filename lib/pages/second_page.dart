// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/movie_model.dart';
class SecondPage extends StatefulWidget {
  static const routeName = "/second-page";

  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Movies? movies;
  @override
  void didChangeDependencies() {
    movies = ModalRoute.of(context)!.settings.arguments as Movies;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff12141C),
        appBar: AppBar(
          title: Text("Movie Details"),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                Image.network(movies!.largeCoverImage.toString(), height: 300,),
                SizedBox(height: 30,),
                Text(movies!.title.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Runtime: ${movies!.runtime.toString()}",
                      style: TextStyle(color: Colors.white54),
                    ),
                    Container(
                      height: 22,
                      width: 2,
                      color: Colors.white,
                    ),
                    Text("Ratting: ${movies!.rating.toString()}",
                        style: TextStyle(color: Colors.white54)),
                    Container(
                      height: 20,
                      width: 2,
                      color: Colors.white,
                    ),
                    Text("Year: ${movies!.year.toString()}",
                        style: TextStyle(color: Colors.white54)),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Language: ${movies!.language.toString()}",
                      style: TextStyle(color: Colors.white54),
                    ),
                    Container(
                      height: 22,
                      width: 2,
                      color: Colors.white,
                    ),
                    Text("Duration: ${movies!.dateUploaded?.split(" ").toList()[1]}",
                        style: TextStyle(color: Colors.white54)),
                    Container(
                      height: 20,
                      width: 2,
                      color: Colors.white,
                    ),
                    Text("State:  ${movies!.state}",
                        style: TextStyle(color: Colors.white54)),
                  ],
                ),
                SizedBox(height: 20,),
                Text("Description:  ${movies!.descriptionFull.toString()}", style: TextStyle(color: Colors.white,  ),),
                ListTile(),
              ],
            ),
          ),
        )
    );
  }
}
