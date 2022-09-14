import 'package:app_1/GridView.dart';
import 'package:flutter/material.dart';
import 'package:app_1/Profile.dart';
import 'package:app_1/Twitter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabbarExample extends StatefulWidget {
  const TabbarExample({Key? key}) : super(key: key);

  @override
  State<TabbarExample> createState() => _TabbarExampleState();
}

class _TabbarExampleState extends State<TabbarExample>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(icon: Icon(Icons.sports_soccer_outlined)),
    Tab(
      icon: Icon(FontAwesomeIcons.twitter),
    ),
    Tab(icon: Icon(Icons.person_outlined)),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 33, 33, 33),
          bottom: TabBar(
            onTap: (index) {
              // Should not used it as it only called when tab options are clicked,
              // not when user swapped
            },
            controller: _controller,
            tabs: list,
          ),
          title: Text('Premier League'),
        ),
        body: TabBarView(
          controller: _controller,
          children: [gridView(), Twitter(), CardProfile()],
        ),
      ),
    );
  }
}
