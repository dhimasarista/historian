import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:historian_app/widgets/items_widget.dart';
import 'package:historian_app/widgets/popular_widget.dart';
import 'package:historian_app/widgets/search_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/img/white.png",
          height: 50,
          color: Colors.blueGrey,
        ),
        centerTitle: true,
        // backgroundColor: Colors.white,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        elevation: 10,
        width: MediaQuery.of(context).size.width / 1.7,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(top: 40, right: 60, bottom: 20, left: 40),
                child: Text(
                  "History Repeat it Self..",
                  style: TextStyle(fontSize: 39, fontWeight: FontWeight.bold),
                ),
              ),
              SearchWidget(),
              const PopularWidget(),
              Image.asset("assets/img/undraw_writer_q06d.png"),
              ItemGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
