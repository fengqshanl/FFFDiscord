import 'package:flutter/material.dart';

import '../bottom.dart';

class Friend extends StatefulWidget {
  const Friend({Key? key}) : super(key: key);

  @override
  State<Friend> createState() => _FriendState();
}

class _FriendState extends State<Friend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomSheet: BottomMenuSheet(bottomMenuKey: GlobalKey(), active: 1,) ,
      body: const Text("friend"),
    );
  }
}

