import 'package:flutter/material.dart';

import '../bottom.dart';

class Notice extends StatefulWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomSheet: BottomMenuSheet(bottomMenuKey: GlobalKey(), active: 3,) ,
      body: const Text("notice", style: TextStyle(color: Colors.white),),
    );
  }
}