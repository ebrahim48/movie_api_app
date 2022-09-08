// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:movie_api_project/pages/second_page.dart';
import 'package:provider/provider.dart';

import '../models/provider/movie_provider.dart';
import '../widgets/filter_item.dart';
class HomePage extends StatefulWidget {
  static const routeName = "/";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MovieProvider provider;
  bool isFirst = true;

  @override
  void didChangeDependencies() {
    if (isFirst) {
      provider = Provider.of<MovieProvider>(context);
      _getData();

      isFirst = false;
    }

    super.didChangeDependencies();
  }

  _getData() async {
    try {
      provider.getMoviesData();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff12141C),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text("Hello Foyzur!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500)),
                      subtitle: Text("Check for latest addition.",
                          style: TextStyle(color: Colors.grey)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xff20212B),
                          contentPadding: EdgeInsets.only(left: 10),
                          focusColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white70,
                          ),
                          hintText: "Search your movie",
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Icon(
                            Icons.keyboard_voice_sharp,
                            color: Colors.white70,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Filters",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: FilterItem(
                              filterIcon: Icons.grid_view_rounded,
                              title: "Genre",
                            )),
                        Expanded(
                            child: FilterItem(
                              filterIcon: Icons.star,
                              title: "Top IMBD",
                            )),
                        Expanded(
                            child: FilterItem(
                              filterIcon: Icons.language,
                              title: "Language",
                            )),
                        Expanded(
                            child: FilterItem(
                              filterIcon: Icons.video_library_outlined,
                              title: "Watched",
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Trending Movies",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: provider.movieModel == null
                        ? Center(
                        child: Text(
                          "Loadding..",
                          style: TextStyle(color: Colors.white),
                        ))
                        : GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding:
                        const EdgeInsets.only(left: 5, right: 5, top: 5),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 3,
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                        itemCount: provider.movieModel!.data!.movies!.length,
                        itemBuilder: (context, index) {
                          final data =
                          provider.movieModel!.data!.movies![index];

                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SecondPage.routeName,
                                  arguments: data);
                            },
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      data.largeCoverImage.toString(),
                                      fit: BoxFit.cover,
                                    )),
                                Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: double.infinity,
                                  child: Text(
                                    data.title.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      color: Colors.white60),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
