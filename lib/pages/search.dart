import 'package:flutter/material.dart';

import '../bottom.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomSheet: BottomMenuSheet(bottomMenuKey: GlobalKey(), active: 2,) ,
      body: const Text("search"),
    );
  }
}
