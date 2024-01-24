

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   String name = "";
  @override
  void initState() {
    super.initState();
    loadData();
  }

   loadData() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     setState(()  {
       name = prefs.getString('username')!;
     });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(name.toString())
        ],
      ),
    );
  }

}
