import 'package:flutter/material.dart';

import '../bottom.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      bottomSheet: BottomMenuSheet(bottomMenuKey: GlobalKey(), active: 4,) ,
      body: const Text("set"),
    );
  }
}
